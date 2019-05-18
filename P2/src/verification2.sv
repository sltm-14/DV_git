`ifndef VERIFICATION2_SV
    `define VERIFICATION2_SV

module verification2
import pkg_system_mdr::*; 
(
	input						clk, 
	input 					rst,
	input 					i_enable,
	input data_t			i_result,
	input data_t			i_remainder,
	
	output data_in_t		o_result,
	output data_in_t		o_remainder,
	output 					o_error
);

logic 		r_error;
data_in_t	r_result;
data_in_t	r_remainder;

always_ff@(posedge clk, negedge rst) begin
	if(~rst) begin
		r_result				<=	'0;
		r_remainder			<=	'0;
		r_error				<=	'0;
	end
	else if(i_enable) begin
		if(i_result[DW2-1]) begin
			if(i_result 	>=	{{(DW+1){1'b1}}, {(DW-1){1'b0}}}) begin
				r_error		<=	1'b1;
				r_result		<=	'0;
				r_remainder	<=	'0;
			end
			else 
				r_error		<= '0;
				r_remainder	<=	i_remainder[DW-2:0];
				r_result		<=	i_result[DW-2:0];
		end
		else if(~i_result[DW2-1]) begin
			if(i_result 	>=	{{(DW){1'b0}}, {(DW){1'b1}}}) begin
				r_error		<=	1'b1;
				r_result		<=	'0;
				r_remainder	<=	'0;
			end
			else begin
				r_error		<= '0;
				r_remainder	<=	i_remainder[DW-2:0];
				r_result		<=	i_result[DW-2:0];
			end
		end
		else if(i_remainder[DW2-1]) begin
			if(i_remainder	>=	{{(DW+1){1'b1}}, {(DW-1){1'b0}}}) begin
				r_error		<=	1'b1;
				r_remainder	<=	'0;
				r_result		<=	'0;
			end
			else begin
				r_error		<= '0;
				r_remainder	<=	i_remainder[DW-2:0];
				r_result		<=	i_result[DW-2:0];
			end
		end
		else if(~i_remainder[DW2-1]) begin
			if(i_remainder	>=	{{(DW){1'b0}}, {(DW){1'b1}}}) begin
				r_error		<=	1'b1;
				r_remainder	<=	'0;
				r_result		<=	'0;
			end
			else begin
				r_error		<= '0;
				r_remainder	<=	i_remainder[DW-2:0];
				r_result		<=	i_result[DW-2:0];
			end
		end
		else begin
			r_error		<=	'0;
			r_remainder	<=	'0;
			r_result		<=	'0;
		end
	end
	else begin
		r_result		<=	r_result;
		r_remainder	<=	r_remainder;
		r_error 		<=	r_error;
	end
end

assign o_result		=	r_result;
assign o_remainder	=	r_remainder;
assign o_error 		=	r_error;

endmodule
`endif