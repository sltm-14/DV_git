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
    o_buses[0]  = ( i_sltr == 0 )?i_bus:'0;
    o_buses[1]  = ( i_sltr == 1 )?i_bus:'0;
	 o_buses[2]  = ( i_sltr == 2 )?i_bus:'0;
    o_buses[3]  = ( i_sltr == 3 )?i_bus:'0;
end


endmodule
`endif

