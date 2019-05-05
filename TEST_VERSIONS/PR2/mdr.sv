
`ifndef MDR_SV
    `define MDR_SV

module mdr
import pkg_system_mdr::*;
(
	input	 clk,
	input	 rst,

	if_mdr     mdr_itf

);



control CTRL(
	.clk    (clk),   // Core clock
	.rst    (rst),   // asynchronous reset low active.

	.control_if  (mdr_itf.control) 
);

validation VAL(
	.clk    (clk),   // Core clock
	.rst    (rst),   // asynchronous reset low active.

	.validation_if  (mdr_itf.validation) 
);

pipo_x PIPOX(
	.clk    (clk),   // Core clock
	.rst    (rst),   // asynchronous reset low active.

	.pipo_ifx  (mdr_itf.pipo_X) 
);

alu_operation ALUOP(
	.clk    (clk),   // Core clock
	.rst    (rst),   // asynchronous reset low active.

	.itf_alu_op  (mdr_itf.alu_op) 
);

pipo_y PIPOY(
	.clk    (clk),   // Core clock
	.rst    (rst),   // asynchronous reset low active.

	.pipo_if  (mdr_itf.pipo_Y) 
);

compA2_data COMPA2DATA(
	//.clk    (clk),   // Core clock
	//.rst    (rst),   // asynchronous reset low active.

	.comp_A2Data  (mdr_itf.compA2_data) 
);

mux_data MUXDATA(
	//.clk    (clk),   // Core clock
	//.rst    (rst),   // asynchronous reset low active.

	.mux   (mdr_itf.mux_data) 
);

data DATA(
	.clk    (clk),   // Core clock
	.rst    (rst),   // asynchronous reset low active.

	.data_if  (mdr_itf.data) 
);

or_gate ORGATE(
	//.clk    (clk),   // Core clock
	//.rst    (rst),   // asynchronous reset low active.

	.or_if  (mdr_itf.or_gate) 
);

mux_rd MUXRD(
	//.clk    (clk),   // Core clock
	//.rst    (rst),   // asynchronous reset low active.

	.mux  (mdr_itf.mux_rd) 
);

alu ALU(
	//.clk    (clk),   // Core clock
	//.rst    (rst),   // asynchronous reset low active.

	.itf_alu  (mdr_itf.alu) 
);

compA2_reminder COMPA2REM(
	.comp_A2rem  (mdr_itf.compA2_rem) 
);

mux_reminder MUXREM(
	.mux   (mdr_itf.mux_rem) 
);

compA2_quotient COMPA2QUO(
	.comp_A2quo  (mdr_itf.compA2_quo) 
);

mux_quotient MUXQUO(
	.mux   (mdr_itf.mux_quo) 
);

reminder REM(
	.clk    (clk),   // Core clock
	.rst    (rst),   // asynchronous reset low active.

	.rem  (mdr_itf.reminder) 
);

quotient QUO(
	.clk    (clk),   // Core clock
	.rst    (rst),   // asynchronous reset low active.

	.quo_if  (mdr_itf.quotient) 
);

mux_rq MUXRQ(
	//.clk    (clk),   // Core clock
	//.rst    (rst),   // asynchronous reset low active.

	.mux  (mdr_itf.mux_rq) 
);
	

endmodule

`endif
