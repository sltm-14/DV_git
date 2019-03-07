module multiplier#(
	parameter DW = 8,
	parameter RW = DW*2
	)(
	input 			i_clk,
	input 			i_rst,
	input 			i_load,
	input 			i_shift,
	input 			i_add,
	input [DW:0]	i_add_out,
	input [DW-1:0]	i_multiplier,

	output 			o_lsb,
	output 			o_rc,
	output 			o_rb
	);

	logic [RW:0] r_register;
	logic		 r_add;

	always_ff@(posedge i_clk, negedge i_rst) begin
        if (i_load)
        	r_register[DW-1:0] <= i_multiplier;
        else if (i_add)begin
        	r_add <= 1'b1;
        end
        else if (i_shift && r_add)begin
        	r_add <= '0;
        	r_register[DW-2:0]    <= r_register[DW-1:1];
        	r_register[RW-1:DW-1] <= i_add_out;
        end
        else if (i_shift)begin
        	r_register <= r_register >> 1'b1;
        end
        else begin
        	r_register <= r_register;
        end
    end

    assign o_lsb = r_register[0];
    assign o_rc  = r_register[RW-1:DW];

    //Final multiplication result, valid only when the controller asserts the STOP signal
    assign o_rb  = r_register[RW-1:0]; 

endmodule