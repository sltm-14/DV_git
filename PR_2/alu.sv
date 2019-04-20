`ifndef ALU_SV
    `define ALU_SV

module alu
import pkg_system_mdr::*;
(	
	input data_t  	i_val_a,
	input data_t 	i_val_b,
	input op_t      i_sltr,
	input           i_init,
	input           i_enable,

	output data_t   o_val
);


always_comb begin

	if (i_enable) begin
		if(i_sltr == ADD)
			o_val = (i_val_a  +  i_val_b);

		else if (i_sltr == SUBS)
			o_val = (i_val_a  -  i_val_b);
		
		else if (i_sltr == NULL)
			o_val = i_val_a;
		
		else
			o_val = '0 ;
	 end
	 else begin
	 	o_val = '0 ;
	 end
	 
end

endmodule 
`endif