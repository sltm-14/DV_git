/*******************************************************************
* Nombre del modulo:
*  multiplexer.sv
* Descripcion:
*  Este modulo representa un multiplexor parametrizable 
* Entradas:
*  Clock, reset, selector y lo datos de forma binaria
* Salidas: 
*  Dato binario elegido
* Version: 
*  1.0
* Autores:
*  Carem Bernabe
*  Andres Hernandez
* Fecha: 
*  01/03/2019
********************************************************************/
module multiplexer #(
	//Numero de selectores
	parameter SLC = 2,
	//Ancho de palabra
	parameter DW  = 4
	)(
	//Inputs
	input 				clk,
	input 				rst,
	input  			[SLC-1:0]i_slc,
	input  			[DW-1:0]i_data,

	//Output
	output 			 	o_out
	);
	
	//Asignacion del dato elegido de acuerdo a la posicion
	// del selector
	assign o_out = i_data[i_slc];

endmodule

