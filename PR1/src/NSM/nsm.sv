module nsm(
	input i_start,
	input [8:0] i_multiplicand,
	input [8:0] i_multiplier,

	output [15:0]o_mult
	);

	logic [8:0] multiplicand;
	logic [8:0] multiplier;
	logic [15:0] product = 0;
	logic [5:0]  index = '0;

always@(*)begin
	if (i_start)begin
		multiplicand = i_multiplicand;
		multiplier   = i_multiplier;
		index   = '0;
		product = '0;
	    for (index = '0; index < 8;index = index + 1'b1)begin
	        if(multiplier[0] & 1'b1)
	            product = product + multiplicand;
	        
	        else
	            product = product + '0;
	        
	        multiplicand = multiplicand << 1;
	        multiplier   = multiplier   >> 1;
	    end
	end
	else begin
		multiplicand = '0;
		multiplier = '0;
		index   = '0;
		product = '0;
	end

end


assign o_mult = ((multiplier == '0)||(index >= 8))? product : '0 ;

endmodule // mult_no_state_machine