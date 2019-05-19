`ifndef TOP_FULL_MXV_SV
   `define TOP_FULL_MXV_SV

module top_full_mxv
import mxv_pkg::*;
(
	input clk,
	input rst,

/*	input rx,

	output tx,*/
	input             clk_b,   
	input             rcv,
	input data_uart_t data

	output            error,
	output result_t   result

);

top_mxv_st wires;

/*TOP_uart UART(
    .clk  (clk), 
    .rstn (rst),    

    .rx       (rx),          
    
    .tx       (tx),
    .error    (error),
    .data     (data),  //data_t
    .rcv      (rcv),
    .clk_baud (wires.clk_baud)
);*/

ctrl_top CONTROL(	
	.clk  (clk),
	.rst  (rst),

	.rcv         (rcv),
	.data        (data), 
	.push_result (wires.push_result),
	.pop_result  (wires.pop_result),
	.push_vector (wires.push_vector),
	.pop_vector  (wires.pop_vector),
	.push_matrix (wires.push_matrix), 
	.pop_matrix  (wires.pop_matrix),
	.val         (wires.val),
	.dmx_v_sltr  (wires.dmx_v_sltr),
	.mx_reg_sltr (wires.mx_reg_sltr), 
	.mx_a_sltr   (wires.mx_a_sltr),
	.mx_b_sltr   (wires.mx_b_sltr),
	.mx_c_sltrv  (wires.mx_c_sltrv),
	.mx_d_sltr   (wires.mx_d_sltr),
	.ena_proc_a  (wires.ena_proc_a),
    .ena_proc_b  (wires.ena_proc_b),
    .ena_proc_c  (wires.ena_proc_c),
    .ena_proc_d  (wires.ena_proc_d)
);

top_mxv MXV(
	.clk_wr (clk),
	.clk_rd (clk_b),
	.rst    (rst),

	.push_result (wires.push_result),
	.pop_result  (wires.pop_result),
	.push_vector (wires.push_vector),
	.pop_vector  (wires.pop_vector),
	.push_matrix (wires.push_matrix), 
	.pop_matrix  (wires.pop_matrix),
	.val         (wires.val),
	.dmx_v_sltr  (wires.dmx_v_sltr),
	.mx_reg_sltr (wires.mx_reg_sltr), 
	.mx_a_sltr   (wires.mx_a_sltr),
	.mx_b_sltr   (wires.mx_b_sltr),
	.mx_c_sltrv  (wires.mx_c_sltrv),
	.mx_d_sltr   (wires.mx_d_sltr),
	.ena_proc_a  (wires.ena_proc_a),
    .ena_proc_b  (wires.ena_proc_b),
    .ena_proc_c  (wires.ena_proc_c),
    .ena_proc_d  (wires.ena_proc_d)

	.fifo_result (result)
);


endmodule
`endif  