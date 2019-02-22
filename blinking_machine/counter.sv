module counter #( 
	parameter COUNT_LENGTH  =  $clog2(6) 
	)(
	input 					  i_clk,
	input 					  i_rst,
	input  [COUNT_LENGTH-1:0] i_val,

	output					  o_timeout,
	);

	logic 					 l_timeout;
	logic [COUNT_LENGTH-1:0] l_count;

always@(posedge i_clk, posedge i_rst)begin

	l_count <= (i_rst)? '0 : l_count;

	if(l_count == '0)begin
		l_count   = i_val;
		l_timeout = 1'b1;
	end

	else begin
		l_count   = l_count - 1'b1;
		l_timeout = 1'b0;
	end 

end

assign o_timeout = l_timeout;

endmodule