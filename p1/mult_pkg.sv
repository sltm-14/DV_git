/*-----------------------------------------------
* MODULE: 	  mult_pkg.sv
* DESCRITION: Packege for general signals
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
package mult_pkg;

localparam DW = 8;								/*Data width*/	
localparam D2W = DW*2;							/*Length of product*/
typedef	logic [DW:0]comp2_t;					/*Data with sign*/
typedef	logic [DW-1:0]data_t;				/*Absolute data*/
typedef	logic [D2W-1:0]multiplier_t;		/*Length for multiplier*/
typedef	logic [D2W-1:0]multiplicand_t;	/*Length for multiplicand*/
typedef	logic [D2W-1:0]product_t;			/*Length for product*/
typedef	logic signal_t;						/*Single signal*/

typedef struct									/*Structure for top level*/
{
	signal_t				mltr_done;
	signal_t				mltd_done;
	signal_t				clkPLL;
	signal_t				clk;
	signal_t				finalSign;
	product_t			finalProduct;
	comp2_t				real_mltnd;
	comp2_t				real_mlter;
	product_t			product;
	signal_t				sign_mltnd;
	signal_t				sign_mlter;
	signal_t				reg_mltnd;
	signal_t				reg_mlter;
	data_t				data_mltnd;
	data_t				data_mlter;
	signal_t				ready;
	signal_t				load;
	signal_t				lsb;
	signal_t				clean;
	multiplicand_t		mltnd_out;
}ms_t;

endpackage: mult_pkg
