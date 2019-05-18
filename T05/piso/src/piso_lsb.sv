/*******************************************************************
* Nombre del modulo:
*  piso_lsb.sv
* Descripcion:
*  Este modulo representa un registro tipo PISO; Parallel Input
*  Serial Output donde el LSB es el primero en salir.
* Entradas:
*  Clock, reset, enable, l_s; el cual carga o recorre, entrada
*  paralela del dato
* Salidas: 
*  Sale el LSB
* Version: 
*  1.0
* Autores:
*  Carem Bernabe
*  Andres Hernandez
* Fecha: 
*  01/03/2019
********************************************************************/
module piso_lsb #(
	parameter DW = 4
	)(
	input               clk,    // Clock
	input               rst,    // asynchronous reset low active 
	input               enb,    // Enable
	input               l_s,    // load or shift
	input  [DW-1:0]     inp,    // data input
	output              out     // Serial output
	);

	logic [DW-1:0]      rgstr_r;

	always_ff@(posedge clk or negedge rst) begin: rgstr_label
	    if(!rst)
	        rgstr_r  <= '0; //Inicia en cero
	    else if (enb) begin //Solo se activa si enable esta en 1
	        if (l_s)
	            rgstr_r  <= inp; //No modifica el dato
	        else 
	            rgstr_r  <= {rgstr_r[0], rgstr_r[DW-1:1]}; //Recorre a la derecha
	    end
	end:rgstr_label

	assign out  = rgstr_r[0];  //El LSB es el primero en salir 

endmodule