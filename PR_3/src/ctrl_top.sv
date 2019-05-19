`ifndef CTRL_TOP_SV
    `define CTRL_TOP_SV

module ctrl_top 
import mxv_pkg::*;
(	
	input clk,
	input rst,

	input logic       rcv,
	input data_uart_t data,

	output logic      push_result,
	output logic      pop_result,
	output logic      push_vector,
	output logic      pop_vector,
	output push_pop_t push_matrix,
	output push_pop_t pop_matrix,
	output val_t      val,
	output sltr_4_t   dmx_v_sltr,
	output sltr_2_t   mx_reg_sltr,
	output sltr_2_t   mx_a_sltr,
	output sltr_2_t   mx_b_sltr,
	output sltr_2_t   mx_c_sltr,
	output sltr_2_t   mx_d_sltr,

	output logic      ena_proc_a,
    output logic      ena_proc_b,
    output logic      ena_proc_c,
    output logic      ena_proc_d

);

ctrl_st wires;

register_8 REG_DATA(
	.clk   (clk),
	.rst   (rst),

	.i_val (data), //data_uart_t

	.o_val (wires.data_reg_a2h) //data_uart_t
);

register REG_RCV(
	.clk   (clk),
	.rst   (rst),

	.i_val (rcv), //data_uart_t

	.o_val (wires.rcv) //data_uart_t
);




ascii2hex ASCII_2_HEX(
	.ascii (wires.data_reg_a2h), //data_uart_t

	.hex   (wires.data_hex)   //data_hex_t
);

hex2dec HEX_2_DEC(	
	.clk (clk),
	.rst (rst),

	.ena (wires.rcv),
	.hex (wires.data_hex), //data_hex_t

	.dec (wires.data_dec), //data_dec_t
	.ena_o (wires.ena_rcv)
);    



control CTRL(
	.clk  (clk),
	.rst  (rst),

	.rcv          (wires.ena_rcv),
	.data         (wires.data_dec),
	.cc_ovf       (wires.cc_ovf),
	.counter      (wires.counter),  

	.ena_cv       (wires.ena_cv),
	.ena_cc       (wires.ena_cc),
	.push_result  (push_result),
	.pop_result   (pop_result),
	.push_vector  (push_vector),
	.pop_vector   (pop_vector),
	.push_matrix  (push_matrix),  
	.pop_matrix   (pop_matrix),  
	.val          (val),  
	.dmx_v_sltr   (dmx_v_sltr),  
	.mx_reg_sltr  (mx_reg_sltr),
	.mx_a_sltr    (mx_a_sltr),  
	.mx_b_sltr    (mx_b_sltr),  
	.mx_c_sltr    (mx_c_sltr), 
	.mx_d_sltr    (mx_d_sltr), 
	.sipo_ena     (wires.sipo_ena),
	.clear_val    (wires.clear_val),
	.clear_comm   (wires.clear_comm),
	.ena_proc_a   (ena_proc_a),
    .ena_proc_b   (ena_proc_b),
    .ena_proc_c   (ena_proc_c),
    .ena_proc_d   (ena_proc_d)
);




counter_ctrl COUNTER_VAL(
	.clk(clk),
	.rst(rst),

	.i_clear (wires.clear_val),
	.i_ena   (wires.ena_cv),

	.o_count (wires.counter) //count_t
);

counter_command COUNTER_COMM(
	.clk(clk),
	.rst(rst),

	.i_ena(wires.ena_cc),
	.i_clear(wires.clear_comm),

	.o_ovf(wires.cc_ovf),
	.o_count()//count_t
);


endmodule
`endif