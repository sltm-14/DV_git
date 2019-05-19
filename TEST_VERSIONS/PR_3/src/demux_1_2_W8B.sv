`ifndef demux_1_2_W8B_SV
    `define demux_1_2_W8B_SV
    
module demux_1_2_W8B
import mxv_pkg::*;
(
	input  data_hex_t    i_bus,  
	input  sltr_2_t      i_sltr,     

	output dmx_1_2_w8b_t o_buses     
);

always @(*)begin
    o_buses[i_sltr]  = i_bus;
    o_buses[!i_sltr] = 0;
end


endmodule
`endif

