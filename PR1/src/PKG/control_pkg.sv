/*-----------------------------------------------
* MODULE: 	  control_pkg.sv
* DESCRITION: Packege for control_pkg
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
package control_pkg;

localparam DW 		= 8;			/* Width for counter */
localparam BW 		= $clog2(DW);	/* Width for data */
localparam MAX_CNTR = DW - 1'b1;	/* Max value of counter */

typedef logic 				signal_t;	/*signal  */
typedef logic 		[BW:0] 	count_t;	/* count */
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