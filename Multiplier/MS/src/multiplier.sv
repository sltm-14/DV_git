module multiplier#(
	parameter DW = 8,
	parameter RW = DW*2
	)(
	input 			i_clk,
	input 			i_rst,
	input 			i_load,
	input 			i_shift,
	input 			i_add,
	input [DW:0]	i_sum,
	input [DW-1:0]	i_val,

	output 			o_lsb,
	output [RW-1:0] o_rc,
	output [DW-1:0]	o_rb
	);

	logic [RW:0] r_register ='0;

	always_ff@(posedge i_clk, negedge i_rst) begin
        if (i_load)begin
        	r_register[DW-1:0] <= i_val ;
            r_register[RW:DW]  <= '0;
        end
        else if (i_shift && i_add)begin
        	r_register[DW-2:0]    <= r_register[DW-1:1];
        	r_register[RW-1:DW-1] <= i_sum;
        end
        else if (i_shift)begin
        	r_register <= r_register >> 1'b1;
        end
        else begin
        	r_register <= r_register;
        end
    end

    assign o_lsb = r_register[0];
    assign o_rb  = r_register[RW-1:DW];

    //Final multiplication result, valid only when the controller asserts the STOP signal
    assign o_rc  = r_register[RW-1:0]; 

endmodule