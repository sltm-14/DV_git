package pkg_mult;

localparam	FREQUENCY_IN 	= 10000; 		/* Value of input frequency */
localparam	FREQUENCY_OUT	= 2; 	 		/* Value of output frequency */
localparam	MAX_COUNT		= (FREQUENCY_IN/FREQUENCY_OUT)/2; /* Value of counter */

localparam	DW 				= 9;			/*Data width*/	
localparam	DW2 			= DW*2;			/*Length of product*/
localparam	BW 				= $clog2(DW);	/* Width for data */
localparam	MAX_CNTR 		= DW - 1'b1;	/* Max value of counter */
localparam	FC 				= $clog2(MAX_COUNT);	

typedef	logic [DW-1:0]	comp2_t;			/*Data with sign*/
typedef	logic [DW-1:0]	data_t;				/*Absolute data*/
typedef	logic [DW2-1:0]	multiplier_t;		/*Length for multiplier*/
typedef	logic [DW2-1:0]	multiplicand_t;		/*Length for multiplicand*/
typedef	logic [DW2-1:0]	product_t;			/*Length for product*/
typedef logic [DW2-1:0] 	leds_t;
typedef logic [DW-1:0]  	full_val_t;
typedef logic [DW-1:0]    val_t;		/* Type out signal */
typedef logic [BW:0] 	count_t;			/* count */
typedef logic [FC:0] 	counter_t; 	 /* Counter type */
typedef logic [DW2+1:0]	sw_in_t;			/*Data with sign*/
typedef	logic 			signal_t;			/*Single signal*/
typedef logic 			sign_t;

typedef enum logic  [2:0]	{IDLE, INIT, ADD_SHIFT} state_t;	/* enum for states */



typedef struct{ /*Struct for TOP module*/
	multiplicand_t	mltnd_out;
	product_t		finalProduct;
	product_t		product;
	signal_t		mltr_done;
	signal_t		mltd_done;
	signal_t		clkPLL;
	signal_t		clk;
	signal_t		finalSign;
	signal_t		sign_mltnd;
	signal_t		sign_mlter;
	signal_t		reg_mltnd;
	signal_t		reg_mlter;
	signal_t		ready;
	signal_t		load;
	signal_t		lsb;
	signal_t		clean;
	signal_t		ovf;
	comp2_t			real_mltnd;
	comp2_t			real_mlter;
	data_t			data_mltnd;
	data_t			data_mlter;
}ms_t;

typedef struct{  /*Struct for leds module*/
	product_t	product;
	sign_t		sign;
}leds_st;

typedef struct{ 
	val_t	val;
	sign_t	sign;
}comp2_st;

typedef struct{
	signal_t	load;
	signal_t	ready;
	signal_t	ovf;
	signal_t	enb;
	count_t     count;
	signal_t	clean;
	state_t		state;
}control_t;

typedef struct{		/*Struct with registers*/
	sw_in_t	multiplier;	
	sw_in_t	multiplicand;
}registers_t;



endpackage