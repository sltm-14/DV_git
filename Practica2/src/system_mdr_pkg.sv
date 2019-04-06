/*-----------------------------------------------
* MODULE: 	  	system_mdr_pkg.sv
* DESCRIPTION: This modules contains the variables
					and data types of the system
* VERSION:    	1.0
* AUTHORS:    	Andres Hernandez, Carem Acosta
* DATE:       	05 / 04 / 19
* ----------------------------------------------*/
`ifndef SYSTEM_MDR_PKG_SV
    `define SYSTEM_MDR_PKG_SV
	 
package system_mdr_pkg;

    localparam		DW = 16;
	 localparam		SW = 18;
	 localparam		LW = 4;
	 localparam		ON = 1'b1;

    typedef logic [DW-1:0]		data_t;
    typedef logic [1:0]			enb_t;
	 typedef logic [1:0]			op_t;
	 
	 typedef struct
	 {
		data_t	data;
		opt_t		op;
	 }switch_t;

endpackage

`endif
