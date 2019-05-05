/*-----------------------------------------------
* MODULE: 	  comp2_pkg.sv
* DESCRITION: Packege for comp2_pkg
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
package comp2_pkg;

localparam DW = 8;				/* Width of signal */
localparam D2W = DW*2;			/* Double width of signal */

typedef logic [DW:0]    val_t;		/* Type value */
typedef logic [DW-1:0]  out_t;		/* Type out signal */
typedef logic [D2W-1:0] product_t;	/* Product */
typedef logic 		    	sign_t;		/* Sign if the signal */

/* Struct for value and signal */
typedef struct{ 
	out_t		val;
	sign_t	sign;
}comp2_t;

endpackage
