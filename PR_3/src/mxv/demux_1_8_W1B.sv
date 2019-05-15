`ifndef demux_1_8_W1B_SV
    `define demux_1_8_W1B_SV
    
module demux_1_8_W1B
import mxv_pkg::*;
(
	input                i_bus,  
	input  sltr_8_t      i_sltr,     

	output dmx_1_8_w1b_t o_buses     
);

always @(*)begin
    o_buses[i_sltr]  = i_bus;
    o_buses[!i_sltr] = i_bus;
end


endmodule
`endif

