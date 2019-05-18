`ifndef MUX_2POWERN2_SV
    `define MUX_2POWERN2_SV

module mux_2powerN2 
import pkg_system_mdr::*;
#(  parameter MUX_SEL = 2,
	parameter MDW     = 33  )
 (
	input   [(2**MUX_SEL)-1:0][MDW-1:0] i_buses,    
	input   [MUX_SEL-1:0]               i_sltr,     

	output                  [MDW-1:0]   o_bus      
);

assign o_bus = i_buses[i_sltr];

endmodule
`endif

