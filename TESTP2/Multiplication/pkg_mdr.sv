package pkg_mdr;

localparam	DW 	= 16;//$clog2(MAX_COUNT);	
localparam	DW2 = DW<<2;

typedef	logic [DW-1:0]	ini_val;			/*Data with sign*/
typedef	logic [DW2-1:0]	out_val;				/*Absolute data*/
typedef logc  [2:0]		t_op;


typedef enum logic  [3:0]	{IDLE, 
							 CLEAN,
							 WAIT_X,
							 WAIT_Y,
							 INIT,
							 VERIFICATION,
							 CALCULATION,
							 READY,
							 ADD_SHIFT
							 } state_t;	/* enum for states */

typedef struct{
	logic 		load_x;
	logic 		load_y;
	logic 		ena_pipo;
	logic		ena_veri;
	logic		ena_mdr_mods;
	t_op 		op;
	logic 		clean;
	logic		ovf;
	logic		ready;
	count_t     count;
}control_t;


endpackage : pkg_mdr