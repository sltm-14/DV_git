`ifndef SYSTEM_MDR_PKG_SV
    `define SYSTEM_MDR_PKG_SV
	 
package pkg_system_mdr;

localparam  DW      	= 16;
localparam  DWB = $clog2(DW);
localparam	DW2 = DW<<2;

typedef logic [DW-1:0]	data_t;
typedef logic [1:0]		enb_t;
typedef	logic [DWB-1:0]	count_t;

typedef enum logic  [3:0]	{IDLE, CLEAN, WAIT_X, WAIT_Y,
							 VERIFICATION, CALCULATION,
							 READY } state_t;	/* enum for states */

typedef struct{
	logic 		clean;
	logic 		loadX;
	logic 		loadY;
	logic 		veri;
	logic 		error;
	logic 		enable;
	logic 		ready;

	logic		ovf;
	count_t     count;

	state_t		state;
}st_control;

typedef struct{
	
}st_data;

typedef struct{
	
}st_reminder;

typedef struct{
	
}st_quotient;

typedef struct{
	
}st_alu;

endpackage

`endif
