`ifndef demux_2POWERN_SV
    `define deMUX_2POWERN_SV
    
module demux_2powerN 
import pkg_system_mdr::*;
#(  parameter MUX_SEL = 2,
    parameter DDW     = 16  )
 (
	input  [DDW-1:0]       i_bus,  
	input  [MUX_SEL-1:0]   i_sltr,     

	output [(2**MUX_SEL):0][DDW-1:0]     o_buses     
);

    generate 
        genvar j;
        for ( j = '0 ; j < ((2**MUX_SEL)-1) ; j = j + 1'b1)begin: generate_dem
			assign o_buses[j] = ( i_sltr == j )? i_bus : '0;
        end: generate_dem
    endgenerate

endmodule
`endif

