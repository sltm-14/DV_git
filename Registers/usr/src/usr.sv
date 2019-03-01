/*******************************************************************
* Nombre del modulo:
*  usr.sv
* Descripcion:
*  Registro Universal el cual elige entre 4 posibles estados los cuales
*  son para elegir como tratar el dato de acuerdo a la siguiente tabla
*
*  | SELECTOR | TIPO DE REGISTRO  |
*  |    00    | No hay cambios    |
*  |    01    | Serial Shift Left |
*  |    10    | Serial Shift Right|
*  |    11    |     Parallel      |
* Entradas:
*  Clock, reset, enable, selector, entrada serial right, entrada serial
*  left, entrada paralela.
* Salidas: 
*  Una salida paralela para los datos, los cuales se modifican de acuerdo
*  al tipo de entrada. Si es serial, el bit sale recorrido, dejando los
*  demas bits en cero, a diferencia de la salida en paralelo, la cual si
*  si modifica a ntodo el bus de N bits.
* Version: 
*  1.0
* Autores:
*  Carem Bernabe
*  Andres Hernandez
* Fecha: 
*  01/03/2019
********************************************************************/
module usr #(
	//Modulo parametrizable a N bits
	parameter DW  = 8
	)(
	//Inputs
	input 			clock,
	input 			reset,
	input          		 enb,
	input  		[1:0] selector,
	//Dato serial para shift left
	input 		i_serialLeft,
	//Dato serial para shift right
	input 		i_serialRight,
	//Dato paralelo
	input  		[DW-1:0] i_parallel,
	
	//Outputs
	output [DW-1:0] out
);

	//Wires
	
	//Crea dos espacios adicionales para shift left y right
	wire [DW + 1'b1:0] w_data;
	//Mux de N bits
	wire [DW - 1'b1:0] w_mux_ff;
	
	//Se asigna los datos de serial shift righ y left
	assign w_data[0] 	= i_serialRight;
	assign w_data[DW+1] 	= i_serialLeft;
	
	//Instanciacion de modulos para N bits
	generate 
		for (genvar i = 1; i <= DW ; i = i + 1'b1)begin: generate_USR
		//Instancia del multiplexor al flip flop tipo D
			multiplexer MUX(	 
				.clk(clock),
				.rst(reset),
				.i_slc(selector),
				//Datos que se iran pasando N
				.i_data({i_parallel[i - 1'b1],w_data[i+1'b1],w_data[i-1'b1],w_data[i]}),

				//Sale el dato elegido por el selector
				.o_out(w_mux_ff[i - 1'b1])
			);
		//Recibe el dato del multiplexor
			ff_d flipflop(
				.clk(clock       ),
				.rst(reset       ),
				.enb(enb         ),
				//Entra el dato del multiplexor
				.inp(w_mux_ff[i - 1'b1] ),

				//Sale el dato capturado
				.out(w_data[i]   )
			);
		end: generate_USR
	endgenerate

	//Asigna el dato de la misma longitud que el original
	assign out = w_data[DW:1];
	
endmodule
