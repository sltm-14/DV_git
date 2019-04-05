/*-----------------------------------------------
* MODULE: 	  	mdr_if.sv
* DESCRIPTION: Interface with modports of the all 
*					the modules					
*					error
* VERSION:    	1.0
* AUTHORS:    	Andres Hernandez, Carem Acosta
* DATE:       	05 / 04 / 19
* ----------------------------------------------*/

`ifndef MDR_IF_SV
    `define MDR_IF_SV
	 
interface mdr_if ();
import system_mdr_pkg::*;

logic 	i_enable;
data_t 	i_data;
logic		i_load;
logic		i_op;
logic 	i_start;
logic 	i_done;
logic 	i_error;
data_t	i_dataX;
data_t	i_dataY;
logic		i_switch[SW-1:0];
logic		i_stop;
logic		i_loadX;
logic		i_loadY;
logic		i_ready;

logic 	o_error;
logic		o_ready;
logic		o_loadX;
logic		o_loadY;
enb_t		o_enable;
data_t 	o_out;
data_t	o_dataX;
data_t	o_dataY;
logic		o_done;
data_t	o_result;
data_t	o_remainder;
data_t	o_data;
op_t		o_op;
logic		o_leds[LW-1:0]

modport pipo
(
	input    i_enable,
	input		i_data,
	
	output	o_out
);

modport control
(
	input		i_load,
	input 	i_op,
	input		i_start,
	input		i_done,
	input		i_error,
	
	output	o_error,
	output	o_ready,
	output	o_loadX,
	output	o_loadY,
	output	o_enable
);

modport validation
(
	input 	i_dataX,
	input 	i_dataY,
	
	output 	o_error,
	output	o_dataX,
	output	o_dataY
);

modport core
(
	input		i_dataX,
	input		i_dataY,
	input		i_enable,
	
	output	o_done,
	output	o_result,
	output	o_remainder
);

modport switch
(
	input		i_load,
	input		i_sw[SW-1:0],
	
	output	o_data,
	output	o_op
);

modport led
(	
	input		i_stop,
	input		i_loadX,
	input		i_loadY,
	input		i_error,
	input		i_ready,
	
	output	o_leds[LW-1:0]
);
	 
endinterface

`endif
