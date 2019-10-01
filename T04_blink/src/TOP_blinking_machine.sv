/*******************************************************************
* Nombre del modulo:
*  TOP_blinking_machine.sv
* Descripcion:
*  Este modulo representa el Top module del sistema
* Entradas:
*  Clock, reset y start, el cual representa a la entrada de un switch
*  que inicia con el conteo de los estados.
* Salidas: 
*  Senal del conteo a 1Hz en un led verde y la salida del estado se
*  reflejara en un led rojo
* Version: 
*  1.0
* Autores:
*  Carem Bernabe
*  Andres Hernandez
* Fecha: 
*  24/02/2019
********************************************************************/
module TOP_blinking_machine(
	input  i_clk,
	input  i_rst,	
	input  i_start,

	output o_out,
	output o_clk_1hz
	);
	
//Wires para instanciar
wire 	   w_clk_1hz;
wire 	   w_timeout;
wire 		w_flag_counter;
wire [2:0] w_count_ena;

//Instancia para clock divider
clk_divider CD
(
	.i_rst(i_rst), 
	.i_clk_FPGA(i_clk),
	
	.o_clk(w_clk_1hz)
);

//Instancia para la maquina de estados
blinking_SM SM
(
	.i_clk(w_clk_1hz),
	.i_rst(i_rst),
	.i_start(i_start),
	.i_enable(w_timeout),

	.o_out(o_out),
	.o_flag_counter(w_flag_counter),
	.o_count_ena(w_count_ena)
);

//Instancia para el contador
counter COUNT
(
	.i_clk(w_clk_1hz),
	.i_rst(i_rst),
	.i_val(w_count_ena),
	.i_enable(w_flag_counter),

	.o_timeout(w_timeout)
);

assign o_clk_1hz = w_clk_1hz;

endmodule
