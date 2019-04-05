`ifndef SYSTEM_MDR_PKG_SV
    `define SYSTEM_MDR_PKG_SV
	 
package system_mdr_pkg;

    localparam		DW = 16;
	 localparam		SW = 18;
	 localparam		LW = 4;

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