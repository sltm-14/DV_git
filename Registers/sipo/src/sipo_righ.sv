/*******************************************************************
* Nombre del modulo:
*  siso_right.sv
* Descripcion:
*  Este modulo representa un registro SISO, el cual, es una entrada 
*  serial y una salida serial
* Entradas:
*  Clock, reset, selector, enable y entrada serial
* Salidas: 
*  Salida serial
* Version: 
*  1.0
* Autores:
*  Carem Bernabe
*  Andres Hernandez
* Fecha: 
*  01/03/2019
********************************************************************/
module siso_right #(
	parameter DW = 4
	)(
	//Inputs
	input               clk,
	input               rst,
	input               enb,
	input               inp,
	
	//Outputs
	output              out
	);

	logic [DW-1:0]      rgstr_r;

	always_ff@(posedge clk or negedge rst) begin: rgstr_label
	    if(!rst)
	        rgstr_r  <= '0;	//Inicia en cero
	    else if (enb)
	        rgstr_r  <= {inp,rgstr_r[DW-1:1]};//Recorre a la derecha
	end:rgstr_label

	assign out  = rgstr_r[0];

endmodule
