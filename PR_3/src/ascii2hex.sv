`ifndef ASCII2HEX_SV
    `define ASCII2HEX_SV 

module ascii2hex
import mxv_pkg::*;
(
	input data_uart_t ascii,

	output data_hex_t hex
);

	always @(*) begin
		if ( (ascii >= KEY_0) && (ascii <= KEY_9) ) begin
			hex = ascii - 48;
		end 
		else if  ( (ascii >= KEY_A) && (ascii <= KEY_F) ) begin
			hex = ascii - 55;
		end 
		else begin
			hex = 4'bxxxx;
		end 
	end

endmodule 
`endif