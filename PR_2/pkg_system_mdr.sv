`ifndef PKG_SYSTEM_MDR_SV
    `define PKG_SYSTEM_MDR_SV
	 
package pkg_system_mdr;

localparam  DW  = 16;
localparam  DWH = DW>>1;
localparam  DWB = $clog2(DW);
localparam  DW8B = $clog2(8);
localparam	DW2 = DW<<1;


/*localparam  MUX_SEL = 2;    // Selection bits
*/
/*typedef logic [MDW-1:0]                  mux_dwd_t;  // Input/ output data width*/
//typedef logic [MUX_SEL-1:0]              sltr_t;  // Selector data type  
/*typedef logic [2**MUX_SEL-1:0][MDW-1:0]  in_bus_t;   // Incoming bus data to multiplexer*/

typedef logic [DW-1:0]	  data_in_t;
typedef logic [DW2-1:0]	  data_t;
typedef logic [1:0]		  enb_t;
typedef logic [1:0]		  lsb2_t;
typedef	logic [DWB:0]	  count_t;
typedef logic [DW8B-1:0]  count8_t;
typedef logic [1:0] 	  or_q_t;
typedef logic [1:0]		  op_t;
typedef logic [DW-1:0]    reminder_t;


typedef enum logic [3:0] {IDLE, CLEAN,       WAIT_X,  SAVE_X,   WAIT_Y,  SAVE_Y,   VERIFICATION, 
						  INIT, CALCULATION, READY     } state_t;	/* enum for states */

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
	/*logic		ovf;
	count_t     count;*/
	state_t		state;
}st_control;

typedef struct{
	data_t    or_op_q_q;
	data_t    q_val;
	data_t    qs_or;
	data_t    r_val;
	data_t    op_or_q;
	data_t    op_or_alu;
	data_in_t d_and;
	data_t    and_or;
	count8_t   counter;
}st_root_square;

typedef struct{
	logic     error;
	logic     ovf;
	logic     load_x;
	logic     load_y;
	logic       save_x;
	logic       save_y;
	logic     veri;
	logic     error_sig;
	logic     enable;
	logic     init;
	logic     ready;
	data_in_t data_x;
	data_in_t data_y;
	logic [4:0] mdr_enabler;

	op_t alu_op_mult;
	op_t alu_op_div;
	op_t alu_op_root;

	data_t mult_alu_a;
	data_t mult_alu_b;

	data_t div_alu_a;
	data_t div_alu_b;

	data_t root_alu_a;
	data_t root_alu_b;

	op_t alu_op;
	data_t alu_a;
	data_t alu_b;


	data_t alu_result;

	count8_t counter_8;


}st_mdr;

endpackage
`endif
