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
	data_in_t 	w_in_val;

	data_in_t	w_rem_X;
/* PIPO Y */
	//data_t 	w_dataIn_Y;
		
	data_in_t	w_data_Y;

/* DATA */
	op_t 	w_op;
	data_t  w_val_data;

/* ALU OP */
	lsb2_t 	w_rem_2lsb;
	logic 	w_r_mb;

	logic [1:0] w_alu_op;

/* compA2 data */
	data_in_t w_data_Y_a2;

/* or gate */
	data_t w_val_rem;
	data_t w_val_or;

/* mux data */
	data_t w_data_val;

/* mux rd */
	data_t w_mux_data_alu;

/* mmux rp */
	data_t w_mux_rem_alu;
/* alu */
	data_t w_alu_rem;

	data_t w_quo_val;
	data_t w_rem_val;
	data_t w_mux_quo;
	data_t w_mux_rem;
	count_t w_counter;
	logic w_init;
	data_in_t w_rem_X_a2;
	data_in_t w_quo_X_a2;

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
	output  w_init,

	output  w_ovf,
	output  w_counter
);

modport validation(
	input 	w_veri,
	input 	w_rem_X,
	input 	w_data_Y,
	input 	w_op,
	
	output 	w_error
);

modport pipo_X(
	input   w_loadX,
	input   w_in_val,
	
	output	w_rem_X
);

modport alu_op(
	input   w_rem_2lsb,
	input   w_op,
	input 	w_enable,
	input 	w_r_mb,
	input 	w_ovf,

	output 	w_alu_op
);

modport pipo_Y(
	input   w_loadY,
	input   w_in_val,
	
	output	w_data_Y
);

modport compA2_data(
	input   w_data_Y,

	output  w_data_Y_a2
);

modport mux_data(
	input   w_op,
	input 	w_data_Y,
	input 	w_data_Y_a2,

	output 	w_data_val
);



modport or_gate(
	input  w_val_data,
	input  w_val_rem,

	output  w_val_or
);



modport alu(
	input   w_mux_data_alu,
	input   w_mux_rem_alu,
	input 	w_alu_op,

	output  w_alu_rem
);

modport compA2_rem(
	input   w_rem_X,

	output  w_rem_X_a2
);

modport mux_rem(
 	input 	w_op,
	input 	w_rem_X,
	input 	w_rem_X_a2,

	output 	w_mux_rem 
	);

modport mux_rq(
	input 	w_op,
	input  	w_rem_val,
	input  	w_quo_val,

	output w_mux_rem_alu
);

modport reminder (
	input 	w_op,
	input 	w_alu_rem,
	input 	w_mux_rem,
	input 	w_ovf,
	input 	w_init,
	input 	w_enable,

	output 	w_rem_val,
	output	w_rem_2lsb,
	output	w_r_mb
);

modport mux_rd(
	input 	w_op,
	input  	w_val_or,
	input  	w_val_data,

	output 	w_mux_data_alu
);

modport data(
	input  w_op,
	input  w_counter,
	input  w_data_val,
	input  w_init,
	input  w_enable,

	output w_val_data
);

modport compA2_quo(
	input   w_rem_X,

	output  w_quo_X_a2
);


modport mux_quo(
 	input   w_op,
	input 	w_rem_X,
	input 	w_quo_X_a2,

	output 	w_mux_quo 
);

modport quotient(
	input w_op,
	input w_r_mb,
	input w_mux_quo,
	input w_ovf,
	input w_init,
	input w_enable,

	output w_quo_val
);



endinterface
	 
`endif

