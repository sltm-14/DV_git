/*-----------------------------------------------
* MODULE: 	  leds_pkg.sv
* DESCRITION: Packege for leds_pkg
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
package leds_pkg;

localparam D2W = 16;
typedef logic[D2W-1:0]product_t;
typedef logic sign_t;

typedef struct
{
	product_t	product;
	sign_t		sign;
}leds_t;

endpackage: leds_pkg
