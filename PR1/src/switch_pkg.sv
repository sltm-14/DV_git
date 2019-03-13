/*-----------------------------------------------
* MODULE: 	  switch_pkg.sv
* DESCRITION: Packege for switches
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
package switch_pkg;

localparam DW = 8;				/*Data width*/
typedef logic [DW:0]data_t;	/*Data with sign*/

typedef struct						/*Struct with registers*/
{
	data_t	multiplier;	
	data_t	multiplicand;
}registers_t;

endpackage: switch_pkg