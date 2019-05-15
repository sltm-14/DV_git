`ifndef TOP_MXV_SV
    `define TOP_MXV_SV

module top_mxv
import mxv_pkg::*;
(
	input clk_wr,
	input clk_rd,
	input rst,

	input data_i_t val
);

mxv_st wires;

demux_1_8_W4B DMX_DATA
(
	.i_bus   (wires.ctrl_data),  
	.i_sltr  (wires.dmx_sltr),     

	.o_buses (wires.dmx_fifo)     
);

demux_1_8_W1B DMX_PUSH
(
	.i_bus   (wires.ctrl_push),  
	.i_sltr  (wires.dmx_sltr),     

	.o_buses (wires.dmx_push)     
);

demux_1_8_W1B DMX_POP
(
	.i_bus   (wires.ctrl_pop),  
	.i_sltr  (wires.dmx_sltr),     

	.o_buses (wires.dmx_pop)     
);

/* FIFO VECTOR ---------------------------------------------- */

TOP_fifo_ram_dc FIFO_VECTOR
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (wires.fifo_vector),
	.push    (wires.push_vector),
	.pop     (wires.pop_vector),

	.data_o  (wires.fifo_dmx_vctr),
	.empty   (),
	.full    ()
);

demux_1_4_W4B DEMUX_VECTOR(
	.i_bus   (wires.fifo_dmx_vctr),  
	.i_sltr  (wires.dmx_4_sltr),     

	.o_buses (wires.dmx_prcsr_vctr)     
);

/* FIFO 0 4 ------------------------------------------------- */

mux_2_1 MUX_PRCS
(
	.i_buses ({0,
			  wires.result_reg_d}),    
	.i_sltr  (wires.mux_x_r_sltr),     

	.o_bus   (wires.result_mux)      
);

TOP_fifo_ram_dc FIFO_0
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (wires.dmx_fifo[0]),
	.push    (wires.dmx_push[0]),
	.pop     (wires.dmx_pop[0]),

	.data_o  (wires.data_fifo_0),
	.empty   (),
	.full    ()
);

TOP_fifo_ram_dc FIFO_4
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (wires.dmx_fifo[4]),
	.push    (wires.dmx_push[4]),
	.pop     (wires.dmx_pop[4]),

	.data_o  (wires.data_fifo_4),
	.empty   (),
	.full    ()
);

mux_2_1 MUX_FIFO_0_4
(
	.i_buses ({wires.data_fifo_4,
		       wires.data_fifo_0}),    
	.i_sltr  (wires.mux_0_4_sltr),     

	.o_bus   (wires.matrix_0_4)      
);

procesor PROCESSOR_A
(
	.clk (clk_rd),
	.rst (rst),

	.ena         (wires.ena_prcs_a),
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

	.data_i  (wires.dmx_fifo[1]),
	.push    (wires.dmx_push[1]),
	.pop     (wires.dmx_pop[1]),

	.data_o  (wires.data_fifo_1),
	.empty   (),
	.full    ()
);

TOP_fifo_ram_dc FIFO_5
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (wires.dmx_fifo[5]),
	.push    (wires.dmx_push[5]),
	.pop     (wires.dmx_pop[5]),

	.data_o  (wires.data_fifo_5),
	.empty   (),
	.full    ()
);

mux_2_1 MUX_FIFO_1_5
(
	.i_buses ({wires.data_fifo_5,
		       wires.data_fifo_1}),    
	.i_sltr  (wires.mux_1_5_sltr),     

	.o_bus   (wires.matrix_1_5)      
);

procesor PROCESSOR_B
(
	.clk (clk_rd),
	.rst (rst),

	.ena         (wires.ena_prcs_b),
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

	.data_i  (wires.dmx_fifo[2]),
	.push    (wires.dmx_push[2]),
	.pop     (wires.dmx_pop[2]),

	.data_o  (wires.data_fifo_2),
	.empty   (),
	.full    ()
);

TOP_fifo_ram_dc FIFO_6
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (wires.dmx_fifo[6]),
	.push    (wires.dmx_push[6]),
	.pop     (wires.dmx_pop[6]),

	.data_o  (wires.data_fifo_6),
	.empty   (),
	.full    ()
);

mux_2_1 MUX_FIFO_2_6
(
	.i_buses ({wires.data_fifo_6,
		       wires.data_fifo_2}),    
	.i_sltr  (wires.mux_2_6_sltr),     

	.o_bus   (wires.matrix_2_6)      
);

procesor PROCESSOR_C
(
	.clk (clk_rd),
	.rst (rst),

	.ena         (wires.ena_prcs_c),
	.matriz      (wires.matrix_2_6), 
	.vector      (wires.dmx_prcsr_vctr[2]), 
	.last_result (wires.result_reg_b), 

	.result      (wires.result_c) 
);

register_en REG_C
(
	.clk (clk_rd),
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

	.data_i  (wires.dmx_fifo[3]),
	.push    (wires.dmx_push[3]),
	.pop     (wires.dmx_pop[3]),

	.data_o  (wires.data_fifo_3),
	.empty   (),
	.full    ()
);

TOP_fifo_ram_dc FIFO_7
(	
	.clk_wr  (clk_wr),
	.clk_rd  (clk_rd),
	.rst     (rst),

	.data_i  (wires.dmx_fifo[7]),
	.push    (wires.dmx_push[7]),
	.pop     (wires.dmx_pop[7]),

	.data_o  (wires.data_fifo_7),
	.empty   (),
	.full    ()
);

mux_2_1 MUX_FIFO_3_7
(
	.i_buses ({wires.data_fifo_7,
		       wires.data_fifo_3}),    
	.i_sltr  (wires.mux_3_7_sltr),     

	.o_bus   (wires.matrix_3_7)      
);

procesor PROCESSOR_D
(
	.clk (clk_rd),
	.rst (rst),

	.ena         (wires.ena_prcs_d),
	.matriz      (wires.matrix_3_7), 
	.vector      (wires.dmx_prcsr_vctr[3]), 
	.last_result (wires.result_reg_c), 

	.result      (wires.result_d) 
);

register_en REG_D
(
	.clk (clk_rd),
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
	.push    (wires.push_result),
	.pop     (wires.pop_result),

	.data_o  (wires.fifo_result),
	.empty   (),
	.full    ()
);

endmodule
`endif