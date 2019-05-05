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

data_t	o_data_sw;
data_t	o_dataX_val;
data_t	o_dataY_val;

logic 	o_done_core;
logic		o_error_val;
logic 	o_error_ctrl;
logic		o_ready_ctrl;
logic 	o_loadX_ctrl;
logic		o_loadY_ctrl;
logic 	o_load_ctrl;
logic		o_enable_ctrl;
logic 	o_error_val;
logic 	o_done_core;
logic 	o_load_ctrl;
data_t	o_result;
data_t	o_remainder;

modport switch
(
	input		o_load_ctrl,	
	
	output	o_data_sw			
);

modport control
(	
	input		o_done_core,			
	input		o_error_val,		
	
	output	o_error_ctrl,		
	output	o_ready_ctrl,			
	output	o_loadX_ctrl,		
	output	o_loadY_ctrl,		
	output	o_load_ctrl,		
	output	o_enable_ctrl				
);

modport validation
(
	input 	o_data_sw,		
	
	output 	o_error_val,	
	output	o_dataX_val,	
	output	o_dataY_val		
);

modport core
(
	input		o_dataX_val,	
	input		o_dataY_val,	
	input		o_enable_ctrl,	
	
	output	o_done_core,
	output	o_result,
	output	o_remainder
);

modport led
(	
	input		o_readY_ctrl,
	input		o_loadX_ctrl,
	input		o_loadY_ctrl,
	input		o_error_ctrl,
);
	 
modport bcd
(
	input		o_result
);
endinterface

`endif
