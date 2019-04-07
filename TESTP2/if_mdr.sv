`ifndef IF_MDR_SV
    `define IF_MDR_SV

import pkg_system_mdr::*;

interface if_mdr ();

/* CTRL */ 
	logic	w_start;
	logic   w_load;
	logic	w_error;
		
	logic  	w_clean;
	logic	w_loadX;
	logic	w_loadY;
	logic  	w_veri;
	logic	w_error_sig;
	logic	w_enable;
	logic	w_ready;

	logic  	w_ovf;
/* PIPO X */
	data_t 	w_dataIn_X;

	data_t	w_data_X;
/* PIPO Y */
	data_t 	w_dataIn_Y;
		
	data_t	w_data_Y;

/* DATA */
	op_t w_op;
/* VAL */


//data_t r_reaminder;


modport control
(
	input	w_start,
	input   w_load,
	input	w_error,
	
	output  w_clean,
	output	w_loadX,
	output	w_loadY,
	output  w_veri,
	output	w_error_sig,
	output	w_enable,
	output	w_ready,

	output  w_ovf
);

modport validation(
	input 	w_veri,
	input 	w_data_X,
	input 	w_data_Y,
	
	output 	w_error
);

modport pipo_X(
	input   w_loadX,
	input   w_dataIn_X,
	
	output	w_data_X
);

modport pipo_Y(
	input   w_loadY,
	input   w_dataIn_Y,
	
	output	w_data_Y
);

modport compA2_data(
	input data_t w_data_Y,

	output data_t w_data_Y_a2
);


modport mux_data(
	input op_t  w_op,
	input 		w_data_Y,
	input 		w_data_Y_a2

	output 		w_data_val
);

modport data(
	input op_t w_op,
	input 	   w_data_val
	input 	   w_enable,

	output 	   w_val_data
);

modport or_gate(
	input data_t w_val_data,
	input data_t w_val_rem,

	input data_t w_val_or
);

modport mux_rd(
	input op_t   	w_op,
	input data_t 	w_val_or,
	input data_t 	w_val_data,

	output data_t 	w_mux_data_alu
);

modport alu(
	input data_t w_mux_data_alu,
	input data_t w_mux_rem_alu,
	input alu_op_t w_alu_op,

	output data_t w_alu_rem
);




/*
modport core
(
	input	w_dataX,
	input	w_dataY,
	input	w_enable,
	
	output	w_done,
	output	w_result,
	output	w_remainder
);*/



endinterface
	 
`endif

