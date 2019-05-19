`ifndef TOP_MXV_SV
    `define TOP_MXV_SV

module top_mxv
import mxv_pkg::*;
(
	input clk_wr,
	input clk_rd,
	input rst,

	input  logic      push_result,
	input  logic      pop_result,
	input  logic      push_vector,
	input  logic      pop_vector,
	input  push_pop_t push_matrix,
	input  push_pop_t pop_matrix,
	input  val_t      val,
	input  sltr_4_t   dmx_v_sltr,
	input  sltr_2_t   mx_reg_sltr,
	input  sltr_2_t   mx_a_sltr,
	input  sltr_2_t   mx_b_sltr,
	input  sltr_2_t   mx_c_sltr,
	input  sltr_2_t   mx_d_sltr,
	input  logic      ena_proc_a,
    input  logic      ena_proc_b,
    input  logic      ena_proc_c,
    input  logic      ena_proc_d,

	output result_t fifo_result
);

mxv_st wires;

/*demux_1_8_W4B DMX_DATA
(
	.i_bus   (val),  
	.i_sltr  (wires.dmx_sltr),     

	.o_buses (wires.dmx_fifo)     
);*/

/* FIFO VECTOR ---------------------------------------------- */

TOP_fifo_ram_dc FIFO_VECTOR
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (val),
	.push    (push_vector),
	.pop     (pop_vector),

	.data_o  (wires.fifo_dmx_vctr),
	.empty   (),
	.full    ()
);

demux_1_4_W4B DEMUX_VECTOR(
	.i_bus   (wires.fifo_dmx_vctr),  
	.i_sltr  (dmx_v_sltr),     

	.o_buses (wires.dmx_prcsr_vctr)     
);

/* FIFO 0 4 ------------------------------------------------- */

mux_2_1 MUX_PRCS
(
	.i_bus_a ('0),
	.i_bus_b (wires.result_reg_d),    
	.i_sltr  (mx_reg_sltr),     

	.o_bus   (wires.result_mux)      
);

TOP_fifo_ram_dc FIFO_0
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (val),
	.push    (push_matrix[0]),
	.pop     (pop_matrix[0]),

	.data_o  (wires.data_fifo_0),
	.empty   (),
	.full    ()
);

TOP_fifo_ram_dc FIFO_4
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (val),
	.push    (push_matrix[4]),
	.pop     (pop_matrix[4]),

	.data_o  (wires.data_fifo_4),
	.empty   (),
	.full    ()
);

mux_2_1 MUX_FIFO_0_4
(	
	.i_bus_a (wires.data_fifo_4),
	.i_bus_b (wires.data_fifo_0),   
	   
	.i_sltr  (mx_a_sltr),     

	.o_bus   (wires.matrix_0_4)      
);

processor PROCESSOR_A
(
	.clk (clk_rd),
	.rst (rst),

	.ena         (ena_proc_a),
	.matriz      (wires.matrix_0_4), 
	.vector      (wires.dmx_prcsr_vctr[0]), 
	.last_result (wires.result_mux), 

	.result      (wires.result_a) 
);

register_en REG_A
(
	.clk (clk_rd),
	.rst (rst),

	.i_enable (wires.ena_reg_a),
	.i_val    (wires.result_a),

	.o_val    (wires.result_reg_a)
);

/* FIFO 1 5 ------------------------------------------------- */

TOP_fifo_ram_dc FIFO_1
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (val),
	.push    (push_matrix[1]),
	.pop     (pop_matrix[1]),

	.data_o  (wires.data_fifo_1),
	.empty   (),
	.full    ()
);

TOP_fifo_ram_dc FIFO_5
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (val),
	.push    (push_matrix[5]),
	.pop     (pop_matrix[5]),

	.data_o  (wires.data_fifo_5),
	.empty   (),
	.full    ()
);

mux_2_1 MUX_FIFO_1_5
(	
	.i_bus_a (wires.data_fifo_5),
	.i_bus_b (wires.data_fifo_1), 
    
	.i_sltr  (mx_b_sltr),     

	.o_bus   (wires.matrix_1_5)      
);

processor PROCESSOR_B
(
	.clk (clk_rd),
	.rst (rst),

	.ena         (ena_proc_b),
	.matriz      (wires.matrix_1_5), 
	.vector      (wires.dmx_prcsr_vctr[1]), 
	.last_result (wires.result_reg_a), 

	.result      (wires.result_b) 
);

register_en REG_B
(
	.clk (clk_rd),
	.rst (rst),

	.i_enable (wires.ena_reg_b),
	.i_val    (wires.result_b),

	.o_val    (wires.result_reg_b)
);

/* FIFO 2 6 ------------------------------------------------- */

TOP_fifo_ram_dc FIFO_2
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (val),
	.push    (push_matrix[2]),
	.pop     (pop_matrix[2]),

	.data_o  (wires.data_fifo_2),
	.empty   (),
	.full    ()
);

TOP_fifo_ram_dc FIFO_6
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (val),
	.push    (push_matrix[6]),
	.pop     (pop_matrix[6]),

	.data_o  (wires.data_fifo_6),
	.empty   (),
	.full    ()
);

mux_2_1 MUX_FIFO_2_6
(
	.i_bus_a (wires.data_fifo_6),
	.i_bus_b (wires.data_fifo_2),    
	.i_sltr  (mx_c_sltr),     

	.o_bus   (wires.matrix_2_6)      
);

processor PROCESSOR_C
(
	.clk (clk_wr),
	.rst (rst),

	.ena         (ena_proc_c),
	.matriz      (wires.matrix_2_6), 
	.vector      (wires.dmx_prcsr_vctr[2]), 
	.last_result (wires.result_reg_b), 

	.result      (wires.result_c) 
);

register_en REG_C
(
	.clk (clk_wr),
	.rst (rst),

	.i_enable (wires.ena_reg_c),
	.i_val    (wires.result_c),

	.o_val    (wires.result_reg_c)
);

/* FIFO 2 6 ------------------------------------------------- */

TOP_fifo_ram_dc FIFO_3
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (val),
	.push    (push_matrix[3]),
	.pop     (pop_matrix[3]),

	.data_o  (wires.data_fifo_3),
	.empty   (),
	.full    ()
);

TOP_fifo_ram_dc FIFO_7
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (val),
	.push    (push_matrix[7]),
	.pop     (pop_matrix[7]),

	.data_o  (wires.data_fifo_7),
	.empty   (),
	.full    ()
);

mux_2_1 MUX_FIFO_3_7
(
	.i_bus_a (wires.data_fifo_7),
	.i_bus_b (wires.data_fifo_3),   
	.i_sltr  (mx_d_sltr),     

	.o_bus   (wires.matrix_3_7)      
);

processor PROCESSOR_D
(
	.clk (clk_wr),
	.rst (rst),

	.ena         (ena_proc_d),
	.matriz      (wires.matrix_3_7), 
	.vector      (wires.dmx_prcsr_vctr[3]), 
	.last_result (wires.result_reg_c), 

	.result      (wires.result_d) 
);

register_en REG_D
(
	.clk (clk_wr),
	.rst (rst),

	.i_enable (wires.ena_reg_d),
	.i_val    (wires.result_d),

	.o_val    (wires.result_reg_d)
);

/* ---------------------------------------------------------- */

TOP_fifo_ram_dc FIFO_RESULT
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (wires.result_reg_d),
	.push    (push_result),
	.pop     (pop_result),

	.data_o  (fifo_result),
	.empty   (),
	.full    ()
);

endmodule
`endif