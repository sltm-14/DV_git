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
	        rgstr_r[0]  <= '0;
			  rgstr_r[1]  <= '0;
	    end
	    else if (ena) begin
	    	if (hex == 30)begin
	    	  rgstr_r[0]  <= 12;
			  rgstr_r[1]  <= 18;
			 end
	    	else begin
			  rgstr_r[0]  <= hex;
			  rgstr_r[1]  <= rgstr_r[0];
			end
	    end
		 
	    ena_o    <= ena;
	end

	always @(*) begin
		dec = (rgstr_r[1] << 4) + rgstr_r[0];
	end

endmodule 
`endif