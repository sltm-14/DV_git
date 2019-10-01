/*******************************************************************
* Nombre del modulo:
*  counter.sv
* Descripcion:
*  Este modulo representa el contador
* Entradas:
*  Clock, reset, enable; el cual representa la bandera para poder
*  contar, y val; esta valor representa los valores a contar
* Salidas: 
*  Una bandera de timeout al terminar de contar
* Version: 
*  1.0
* Autores:
*  Carem Bernabe
*  Andres Hernandez
* Fecha: 
*  24/02/2019
********************************************************************/
module counter 
#( 
	parameter COUNT_LENGTH  =  $clog2(6) // Ajusta el nivel de bits necesarios para el conteo
)
(
	input 					    		i_clk,
	input 					     		i_rst,
	input 								i_enable,
	input  [COUNT_LENGTH-1:0]    	i_val,

	output					     		o_timeout
);


	logic 					    l_timeout = 0; // Bandera de conteo
	logic [COUNT_LENGTH-1:0] l_counter = 0; // Frequency counter
	

always@(posedge i_clk, posedge i_rst) begin

	if(i_rst)// Reset counter
		l_counter <= 0;
	else if(i_enable)
		if(l_counter >= i_val -1'b1) //Si el conteo llega al limite se reinicia
			l_counter <= 1'b0; 
		else
			l_counter <= l_counter + 1'b1; //Aumenta el contador en 1
end

always_comb begin
	if(l_counter >= i_val - 1'b1)
		l_timeout = 1'b1; //Cuando el contador llega al limite, activa la bandera
	else
		l_timeout = 1'b0; //Si aun no termina, la bandera no se activa
end

assign o_timeout = l_timeout;

endmodule
