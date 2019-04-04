`ifndef PIPO_IF_SV
    `define PIPO_IF_SV
	 
interface pipo_if ();
import system_mdr_pkg::*;

logic 	i_enable;
data_t 	i_data;
data_t 	o_out;

modport pipo
(
	input    i_enable,
	input		i_data,
	output	o_out
);

endinterface
	 
`endif


