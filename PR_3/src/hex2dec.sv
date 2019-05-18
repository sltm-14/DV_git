`ifndef HEX2DEC_SV
    `define HEX2DEC_SV

module hex2dec
import mxv_pkg::*;
(	
	input clk,
	input rst,

	input ena,
	input data_hex_t hex,

	output data_dec_t dec,
	output logic      ena_o
);    

data_h2d_reg_t  rgstr_r;

	always_ff@(posedge clk or negedge rst) begin
	    if(!rst) begin
	        rgstr_r  <= {'0,'0};
	    end
	    else if (ena) begin
	    	if (hex == 30)
	    		rgstr_r  <= {18, 12};
	    	else
	        	rgstr_r  <= {rgstr_r[0], hex};
	    end
	    ena_o    <= ena;
	end

	always @(*) begin
		dec = (rgstr_r[1] << 4) + rgstr_r[0];
	end

endmodule 
`endif