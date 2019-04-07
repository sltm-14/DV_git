`ifndef ALU_SV
    `define ALU_SV

module alu
import pkg_system_mdr::*;(
	if_mdr.alu itf_alu
	);

always_comb begin
	if(itf_alu.w_alu_op)begin
		itf_alu.w_alu_rem = (itf_alu.w_mux_rem_alu  +  itf_alu.w_mux_data_alu);
	end 
	else if () begin
		itf_alu.w_alu_rem = (itf_alu.w_mux_rem_alu  -  itf_alu.w_mux_data_alu);
	end
	else
		itf_alu.w_alu_rem = itf_alu.w_mux_rem_alu ;
end

endmodule 