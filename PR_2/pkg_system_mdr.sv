`ifndef PKG_SYSTEM_MDR_SV
    `define PKG_SYSTEM_MDR_SV
	 
package pkg_system_mdr;

localparam  DW  = 16;
localparam  DWH = DW>>1;
localparam  DWB = $clog2(DW);
localparam	DW2 = DW<<1;

typedef logic [DW-1:0]	data_in_t;
typedef logic [DW2-1:0]	data_t;
typedef logic [1:0]		enb_t;
typedef logic [1:0]		lsb2_t;
typedef	logic [DWB:0]	count_t;
typedef logic [1:0] 	or_q_t;
typedef logic [1:0]		op_t;
typedef logic [DW-1:0]  reminder_t;


typedef enum logic  [3:0]	{IDLE, CLEAN, WAIT_X, WAIT_Y,
							 VERIFICATION, INIT, CALCULATION,
							 READY } state_t;	/* enum for states */

typedef enum logic [1:0] {ZERO, SUBS, ADD,NULL} alu_op_t;							 

typedef struct{
	logic 		clean;
	logic 		loadX;
	logic 		loadY;
	logic 		veri;
	logic 		error;
	logic 		enable;
	logic 		ready;
	logic		init;
	/*logic		ovf;
	count_t     count;*/
	state_t		state;
}st_control;

typedef struct{
data_t or_op_q_q;
data_t q_val;
data_t qs_or;
data_t r_val;
or_q_t op_or_q;
logic  op_or_alu;
data_t d_and;
data_t and_or;
}st_root_square;

endpackage
`endif
