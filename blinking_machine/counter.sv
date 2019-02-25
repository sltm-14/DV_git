module counter 
#( 
	parameter COUNT_LENGTH  =  $clog2(6) 
)
(
	input 					    		i_clk,
	input 					     		i_rst,
	input 								i_enable,
	input  [COUNT_LENGTH-1:0]    	i_val,

	output					     		o_timeout
);


	logic 					    l_timeout = 0;
	logic [COUNT_LENGTH-1:0] l_counter = 0; // Frequency counter
	

always@(posedge i_clk, posedge i_rst) begin

	if(i_rst)// Reset counter
		l_counter <= 0;
	else if(i_enable)
		if(l_counter >= i_val -1'b1)
			l_counter <= 1'b0;
		else
			l_counter <= l_counter + 1'b1;
end

always_comb begin
	if(l_counter >= i_val - 1'b1)
		l_timeout = 1'b1;
	else
		l_timeout = 1'b0;
end

assign o_timeout = l_timeout;

endmodule
