
package control_pkg;

localparam BW 		= 8;			/* Width for counter */
localparam DW 		= $clog2(BW);	/* Width for data */
localparam MAX_CNTR = BW - 1'b1;	/* Max value of counter */

typedef logic 				signal_t;	/*signal  */
typedef logic 		[DW:0] 	count_t;	/* count */
typedef enum logic  [2:0]	{IDLE, INIT, ADD_SHIFT} state_t;	/* enum for states */

/* Struct for ctrl module */
typedef struct{
	signal_t	load;
	signal_t	ready;
	signal_t	clean;
	count_t		count;
	state_t		state;
}control_t;

endpackage: control_pkg