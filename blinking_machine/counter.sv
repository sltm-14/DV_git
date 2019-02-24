module counter 
#( 
	parameter COUNT_LENGTH  =  $clog2(6) 
)
(
	input 					     i_clk,
	input 					     i_rst,
	input  [COUNT_LENGTH-1:0] i_val,

	output					     o_timeout
	);


	logic 					    l_timeout = 0;
	logic [COUNT_LENGTH-1:0] l_counter = 0; // Frequency counter
	

always@(posedge i_clk, posedge i_rst) begin

	if(i_rst) begin // Reset counter
		l_counter <= 0;
	end

	else if(l_counter == i_val-1'b1 && l_counter > 0)begin
		l_counter <= 1'b0;
		l_timeout <= 1'b1;
	end

	else begin
		l_counter <= l_counter + 1'b1;
		l_timeout <= 1'b0;
	end 

end

assign o_timeout = l_timeout;

endmodule
