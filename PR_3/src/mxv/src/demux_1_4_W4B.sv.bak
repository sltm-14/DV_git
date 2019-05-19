`ifndef demux_1_4_W4B_SV
    `define demux_1_4_W4B_SV
    
module demux_1_4_W4B
import mxv_pkg::*;
(
	input  data_i_t      i_bus,  
	input  sltr_4_t      i_sltr,     

	output dmx_1_4_w4b_t o_buses     
);

always @(*)begin
    o_buses[i_sltr]  = i_bus;
    o_buses[!i_sltr] = i_bus;
end


endmodule
`endif

