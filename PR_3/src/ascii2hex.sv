`ifndef ASCII2HEX_SV
    `define ASCII2HEX_SV 

module ascii2hex
import mxv_pkg::*;
(
	input data_uart_t ascii,

	output data_hex_t hex
);
	data_uart_t hex_r;
	
	always @(*) begin
		if ( (ascii >= KEY_0) && (ascii <= KEY_9) ) begin
			hex_r = ascii - 48;
		end 
		else if  ( (ascii >= KEY_A) && (ascii <= KEY_F) ) begin
			hex_r = ascii - 55;
		end 
		else if(ascii == 95)begin
			hex_r = 30;
		end
		else begin
			hex_r = 5'b0_0000;
		end 
	end
	
	assign hex = hex_r[4:0];

endmodule 
`endif