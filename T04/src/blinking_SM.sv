/*******************************************************************
* Nombre del modulo:
*  blinking_SM.sv
* Descripcion:
*  Este modulo representa a la maquina de estados, la cual cambia el
*  estado de la salida
* Entradas:
*  Clock, reset, start; senal que viene de un switch, y enable, el
*  cual es una senal que viene desde el contador
* Salidas: 
*  La cantidad de conteos y la senal en On/Off, ademas de una bandera
*  la cual avisa si al contador cuanto contar
* Version: 
*  1.0
* Autores:
*  Carem Bernabe
*  Andres Hernandez
* Fecha: 
*  24/02/2019
********************************************************************/
module blinking_SM
(
	input        i_clk,
	input        i_rst,
	input        i_start,
	input        i_enable,

	output       o_out,
	output       o_flag_counter,
	output [2:0] o_count_ena
	);

//Etiquetas de los estados
enum logic [2:0] {IDLE, ON_1, OFF_1, ON_2, OFF_2, ON_3, OFF_3} state; 

logic       l_out;
logic	    l_flag_counter;
logic [2:0] l_count_ena;

//Maquina de estados
 always_ff@(posedge i_clk, posedge i_rst)begin

		if(i_rst)
			state <= IDLE;//Inicia en el estado IDLE
		else
	 
		case (state)
			IDLE: // Mientras no se active Start se queda en IDLE
				if(i_start == 1'b1)
					state <= ON_1;
				else 
					state <= IDLE;

			ON_1: //Mientras no se active Enable se queda en ese estado
				if(i_enable == 1'b0)
					state <= ON_1;
				else
					state <= OFF_1;
				
			OFF_1: //Mientras no se active Enable se queda en ese estado
				if(i_enable == 1'b0)
					state <= OFF_1;
				else
					state <= ON_2;
			
			ON_2:  //Mientras no se active Enable se queda en ese estado
				if(i_enable == 1'b0)
					state <= ON_2;
				else
					state <= OFF_2;
				
			OFF_2:  //Mientras no se active Enable se queda en ese estado
				if(i_enable == 1'b0)
					state <= OFF_2;
				else
					state <= ON_3;
					
			ON_3:  //Mientras no se active Enable se queda en ese estado
				if(i_enable == 1'b0)
					state <= ON_3;
				else
					state <= OFF_3;
				
			OFF_3:  //Mientras no se active Enable se queda en ese estado
				if(i_enable == 1'b0)
					state <= OFF_3;
				else
					state <= IDLE;
			default:
					state = IDLE;

		endcase // state		 
 end

//Asignacion de los valores correspondientes de salida
 always_comb begin
	if(state == ON_1 || state == ON_2 || state == ON_3)begin
		l_flag_counter = 1'b1; //Activa la bandera para conteo
		l_out       = 1'b1; //Activa la salida en alto para el LED
		l_count_ena = 3'b110; //Asigna el conteo a realizar
	end
	else if(state == OFF_1 || state == OFF_2 || state == OFF_3)begin
		l_flag_counter = 1'b1; //Activa la bandera para conteo
		l_out       = 1'b0; //Desactiva la salida en bajo para el LED
		l_count_ena = 3'b100; // Asigna el conteo a realizar
	end
	else	begin
		l_flag_counter = 1'b0; //Desactiva la bandera de conteo
		l_out       = 1'b0; //Desactiva la salida en el LED
		l_count_ena = 3'b000; //No asigna valor para el conteo
	end
 end
 
 assign o_flag_counter = l_flag_counter;
 assign o_out       = l_out;
 assign o_count_ena = l_count_ena;

endmodule // blinking_SM
