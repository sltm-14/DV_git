`ifndef SHIFTER_SV
    `define SHIFTER_SV

module shifter 
import pkg_uart::*;
(
	input clk,
	input rst,

	input data_t  i_data,
	input         i_load,
	input         i_ena,

	output rcv_data_t o_shift_lsb

);

rcv_data_t r_shifter;

always @(posedge clk,negedge rst) begin

  if (rst == 0)
    r_shifter <= 10'b11_1111_1111;


  else if ( i_load )
    r_shifter <= {i_data,2'b01};


  else if ( !i_load && i_ena )
    r_shifter <= {1'b1, r_shifter[DW1:1]};

end

assign o_shift_lsb = r_shifter;

endmodule
`endif