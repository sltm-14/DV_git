`ifndef MDR_SV
    `define MDR_SV

module mdr
import pkg_system_mdr::*;
(
	input 				clk,
	input 				rst,
	input          	i_start,
	input          	i_load,
	input data_in_t 	i_data,
	input op_select_t i_op,

	output				o_ready,
	output         	o_load_x,
	output         	o_load_y,
	output         	o_error,
	output data_in_t	o_result,
	output data_in_t	o_remainder
	/*
	output t_display	o_result,
	output 				o_sign_result,
	output data_in_t	o_remainder
	*/
	
);

st_mdr  wires;
/*
PLL						GEN_CLOCK
(
	.refclk				(clk),
	.rst					(rst),
	
	.outclk_0			(clk0)
);

clkDivider				CLK_DIVIDER
(
	.rst					(rst),
	.clk_FPGA			(clk0),
	
	.o_clk				(clk1)
);
*/
control 					CTRL
(
	.clk         		(clk),
	.rst         		(rst),
	.i_start 			(i_start),
	.i_load      		(i_load),
	.i_error1     		(wires.error1),
	.i_error2			(wires.error2),
	.i_done     		(wires.done),
	
	.o_clean     		(wires.clean),
	.o_load_x    		(o_load_x),
	.o_load_y    		(o_load_y),
	.o_save_x    		(wires.save_x),
	.o_save_y    		(wires.save_y),
	.o_veri      		(wires.veri),
	.o_veri2      		(wires.veri2),
	.o_error		 		(o_error),
	.o_enable    		(wires.enable),
	.o_init      		(wires.init),
	.o_ready     		(o_ready)
);

pipo 						PIPO_X
(
	.clk    				(clk),
	.rst    				(rst),
	.i_ena  				(wires.save_x),
	.i_data 				(i_data),

	.o_data 				(wires.data_x)
);

pipo 						PIPO_Y
(
	.clk    				(clk),
	.rst    				(rst),
	.i_ena  				(wires.save_y),
	.i_data 				(i_data),

	.o_data 				(wires.data_y)
);

verification			VERIFICATION
(
	.i_enable			(wires.veri),
	.i_dataX				(wires.data_x),
	.i_dataY				(wires.data_y),
	.i_op					(i_op),
	
	.o_error				(wires.error1)
);	

core 						CORE
(
	.clk 					(clk),
	.rst					(rst),
	.i_enable			(wires.enable),
	.i_op					(i_op),
	.i_init				(wires.init),
	.i_clean				(wires.clean),
	.i_dataX				(wires.data_x),
	.i_dataY				(wires.data_y),
	
	.o_done				(wires.done),
	.o_result			(wires.result),
	.o_remainder		(wires.remainder)
);

verification2			VERIFICATION2
(
	.clk					(clk),
	.rst					(rst),
	.i_enable			(wires.veri2),
	.i_result			(wires.result),
	.i_remainder		(wires.remainder),
	/*
	.o_result			(wires.result_d),
	.o_remainder		(o_remainder),
	.o_error				(wires.error2)
	*/
	.o_result			(o_result),
	.o_remainder		(o_remainder),
	.o_error				(wires.error2)
);
/*
TOP_bcd_7seg			BCD
(
	.in_Bin				(wires.result_d),
	
	.out_displays		(o_result),
	.out_Signo			(o_sign_result)
);
*/
endmodule // MDR_SV
`endif