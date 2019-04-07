`ifndef COMPA2_DATA_SV
    `define COMPA2_DATA_SV

module compA2_data
import pkg_system_mdr::*;(

	if_mdr.compA2_data comp_A2Data

	);

comp_A2Data.val = ( comp_A2Data.w_data_Y_a2[DW] ) ? ( ~(comp_A2Dataw_data_Y. - 1'b1)) :
 										comp_A2Data.w_data_Y; 

endmodule 