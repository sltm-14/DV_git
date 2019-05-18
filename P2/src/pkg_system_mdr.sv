`ifndef PKG_SYSTEM_MDR_SV
    `define PKG_SYSTEM_MDR_SV
	 
package pkg_system_mdr;

localparam  DW					=			16;
localparam  DWH 				=			DW>>1;
localparam  DWB 				=			$clog2(DW);
localparam  DW8B 				=			$clog2(8);
localparam	DW2 				=			DW<<1;
localparam	LIM_MULT			=			DW2 + 1;
localparam	LIM_DIV			=			DW2 + 3;
localparam	LIM_ROOT	   	=			8;
localparam	FREQUENCY_IN 	= 			10000; 		/* Value of input frequency */
localparam	FREQUENCY_OUT	= 			2; 	 		/* Value of output frequency */
localparam	MAX_COUNT		=			(FREQUENCY_IN/FREQUENCY_OUT)/2; /* Value of counter */

typedef logic [1:0]		  				enb_t;
typedef logic [1:0]		  				lsb2_t;
typedef logic [DWB:0]	  				count_t;
typedef logic [DW8B-1:0]  				count8_t;
typedef logic [1:0] 	  					or_q_t;
typedef logic [1:0]						op_t;
typedef logic [DW-1:0]    				reminder_t;
typedef logic [DWB*2:0]					counter_t;
typedef logic signed[DW2+1:0]			product_t;

typedef logic signed [DW-1:0]			data_in_t;
typedef logic signed [DW2-1:0]		data_t;
typedef logic signed [DW2:0]			data_mult_a_t;

localparam OTHW   			= 			5;  				/* Number of active displays  */
localparam IVW    			= 			12;  				/* Inicial value width (switches)*/
localparam FVW 	 			=	 		IVW + OTHW*4; 	/* Full Value width */
localparam DPW    			= 			7;  				/* Display width */

typedef	logic [FVW-1:0]				t_fv;
typedef	logic [IVW-1:0]				t_iv;
typedef	logic [OTHW-1:0]				t_thto;
typedef	logic [OTHW-1:0][DPW-1:0]	t_display;

typedef struct{
	t_fv  [IVW:0] 	full_val;
	t_fv		  		switch;
} struct_thto;

typedef struct{
	t_iv				ini_val;
	t_fv 				full_val;
} struct_bcd_TOP;

typedef struct{
	t_thto  			oth_in;
	t_thto  			oth_out;
	t_fv  			full_val;
} struct_add;

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
	VERIFICATION2,
	READY
} state_t;	/* enum for states */

typedef enum logic [1:0] {ZERO, SUBS, ADD, NULL} alu_op_t;	

typedef enum logic [1:0] {MULT, DIV, ROOT, NON} op_select_t;							 

typedef struct{
	logic 				clean;
	logic 				load_x;
	logic 				load_y;
	logic       		save_x;
	logic       		save_y;
	logic 				veri;
	logic					veri2;
	logic 				error;
	logic 				enable;
	logic 				ready;
	logic					init;
	state_t				state;
} st_control;

typedef struct{
	data_t    			or_op_q_q;
	data_t    			q_val;
	data_t    			qs_or;
	data_t    			r_val;
	data_t    			op_or_q;
	data_t    			op_or_alu;
	data_in_t 			d_and;
	data_t    			and_or;
	count8_t   			counter;
	data_t    			r_reg_val;
	logic     			r_bit;
} st_root_square;

typedef struct{
	logic     			error1;
	logic					error2;
	logic     			done;
	logic     			load_x;
	logic     			load_y;
	logic     			save_x;
	logic     			save_y;
	logic     			veri;
	logic					veri2;
	logic     			error_sig;
	logic     			enable;
	logic     			init;
	logic     			ready;
	data_in_t 			data_x;
	data_in_t 			data_y;
	logic [3:0] 		mdr_enabler;

	op_t 					alu_op_mult;
	op_t 					alu_op_div;
	op_t 					alu_op_root;

	data_mult_a_t		mult_alu_a;
	data_in_t			mult_alu_b;

	data_t 				div_alu_a;
	data_t 				div_alu_b;

	data_t 				root_alu_a;
	data_t 				root_alu_b;

	op_t 					alu_op;
	data_in_t 			alu_a_M;
	data_in_t 			alu_b_M;
	
	data_t				alu_a_DR;
	data_t				alu_b_DR;

	data_t				alu_result_M;
	data_t				alu_result_DR;

	counter_t 			counter_mult;
	counter_t			counter_div;
	counter_t 			counter_root;
	
	data_t 				alu_result_reg;
	data_t 				alu_result_reg2;
	
	logic 				clean;
	logic					ovf_mult;
	logic					ovf_div;
	logic					ovf_root;
	
	logic					flag_rem;
	logic					flag_sub;
	
	data_t				result_mult;
	data_t				result_div;
	data_t				result_root;
	data_t				remainder_root;
	data_t				remainder_div;
	logic					ready_div;
	logic					ready_mult;
	logic					ready_root;
	
	data_t				result;
	data_t				remainder;
	data_in_t			result_d;
	t_display			displays;
	logic					sign;
} st_mdr;

typedef struct{
	logic 				ovf;
	product_t			product_out;
	product_t			product_in;
	logic [1:0] 		msb2;
	data_in_t			multiplicand;
	data_in_t			alu_result;
	counter_t			count;	
} st_mult;

typedef struct{
	data_t				remainder_out;
	data_t 				remainder_in;
	data_t 				divisor;
	data_t				sub;
	data_t 				quotation;
	data_in_t			quotationFull;
	logic  				msb;
	logic  				shift;
	counter_t	 		count;

	logic 				flag_div;
	logic 				flag_rem;
	logic 				flag_sub;
	logic 				flag_full;
	logic 				flag_quo;
} st_div;

typedef struct{
	data_t				r_result_mult;
	data_t				r_result_div;
	data_t				r_result_root;
	data_t				r_remainder_div;
	data_t				r_remainder_root;
	logic					r_ready_mult;
	logic					r_ready_div;
	logic					r_ready_root;
} st_mux_final;

endpackage
`endif
