`ifndef PKG_SYSTEM_MDR_SV
    `define PKG_SYSTEM_MDR_SV
	 
package pkg_system_mdr;

localparam  DW		=	16;
localparam  DWH 	=	DW>>1;
localparam  DWB 	=	$clog2(DW);
localparam  DW8B 	=	$clog2(8);
localparam	DW2 	=	DW<<1;

typedef logic [DW-1:0]	  	data_in_t;
typedef logic [DW2-1:0]		data_t;
typedef logic [1:0]		  	enb_t;
typedef logic [1:0]		  	lsb2_t;
typedef logic [DWB:0]	  	count_t;
typedef logic [DW8B-1:0]  	count8_t;
typedef logic [1:0] 	  		or_q_t;
typedef logic [1:0]			op_t;
typedef logic [DW-1:0]    	reminder_t;

typedef logic signed [DW-1:0]		data_sign_t;
typedef logic signed [DW2-1:0]	data_signFull_t;

typedef enum logic [3:0]{ 
	IDLE, 
	CLEAN,       
	WAIT_X,   
	WAIT_Y, 
	SAVE_X,
	SAVE_Y,
	VERIFICATION, 
	INIT, 
	CALCULATION, 
	READY
} state_t;	/* enum for states */

typedef enum logic [1:0] {ZERO, SUBS, ADD, NULL} alu_op_t;	

typedef enum logic [1:0] {MULT, DIV, ROOT, NON} op_select_t;							 

typedef struct{
	logic 		clean;
	logic 		load_x;
	logic 		load_y;
	logic       save_x;
	logic       save_y;
	logic 		veri;
	logic 		error;
	logic 		enable;
	logic 		ready;
	logic		init;
	state_t		state;
} st_control;

typedef struct{
	data_t    	or_op_q_q;
	data_t    	q_val;
	data_t    	qs_or;
	data_t    	r_val;
	data_t    	op_or_q;
	data_t    	op_or_alu;
	data_in_t 		d_and;
	data_t    	and_or;
	count8_t   	counter;
	data_t    	r_reg_val;
	logic     	r_bit;
} st_root_square;

typedef struct{
	logic     	error;
	logic     	done;
	logic     	load_x;
	logic     	load_y;
	logic     	save_x;
	logic     	save_y;
	logic     	veri;
	logic     	error_sig;
	logic     	enable;
	logic     	init;
	logic     	ready;
	data_in_t 	data_x;
	data_in_t 	data_y;
	logic [3:0] mdr_enabler;

	op_t 			alu_op_mult;
	op_t 			alu_op_div;
	op_t 			alu_op_root;

	data_in_t 		mult_alu_a;
	data_in_t 		mult_alu_b;

	data_t 		div_alu_a;
	data_t 		div_alu_b;

	data_t 		root_alu_a;
	data_t 		root_alu_b;

	op_t 		alu_op;
	data_t 		alu_a;
	data_t 		alu_b;

	data_t 		alu_result;

	count8_t 	counter_8;
	data_t 		alu_result_reg;
	data_t 		alu_result_reg2;
	
	logic 		clean;
	logic		ovf;
} st_mdr;

typedef struct{
	logic 					ovf;
	logic signed[32:0] 	product_out;
	logic signed[32:0] 	product_in;
	logic [1:0] 			msb2;
	logic signed[15:0] 	multiplicand;
	logic signed[32:0] 	alu_result;
	count_t 					count;	
} st_mult;

typedef struct{
	logic signed[31:0] remainder_out;
	logic signed[31:0] remainder_in;
	logic signed[31:0] divisor;
	logic signed[31:0] sub;
	logic signed[15:0] quotation;
	logic signed[15:0] quotationFull;
	logic  msb;
	logic  shift;
	logic [7:0] count;

	logic flag_div;
	logic flag_rem;
	logic flag_sub;
	logic flag_full;
	logic flag_quo;
} st_div;

endpackage
`endif
