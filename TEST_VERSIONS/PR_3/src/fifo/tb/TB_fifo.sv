`ifndef TB_FIFO_SV
    `define TB_FIFO_SV

module TB_fifo
import fifo_pkg::*;
();

	logic   clk_wr;
	logic   clk_rd;
	logic   rst;

	data_t  data_i;
	logic   push;
	logic   pop;

	data_t  data_o;
	logic   empty;
	logic   full;

	TOP_fifo_ram_dc TOP_FIFO_RAM(	
		.clk_wr  (clk_wr),
		.clk_rd  (clk_rd),
		.rst     (rst),

		.data_i  (data_i),
		.push    (push),
		.pop     (pop),

		.data_o  (data_o),
		.empty   (empty),
		.full    (full)
	);

always begin
    #1 clk_wr <= ~clk_wr;
end
always begin
	#3 clk_rd <= ~clk_rd;
end

initial begin
	clk_wr = 1;  #1;
	clk_rd = 1;  #1;

	push   = 0; 
	pop    = 0; 

	rst    = 1;  #2;
	rst    = 0;  #3;
	rst    = 1;  #2;

	data_i = 20;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 14;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 5;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 9;
	push   = 1;  #2;
	push   = 0;  #4;

	pop    = 1;  #6;
	pop    = 0;  #12;

	pop    = 1;  #6;
	pop    = 0;  #12;

	data_i = 3;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 17;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 24;
	push   = 1;  #2;
	push   = 0;  #4;

	pop    = 1;  #6;
	pop    = 0;  #12;

	pop    = 1;  #6;
	pop    = 0;  #12;

	pop    = 1;  #6;
	pop    = 0;  #12;

	pop    = 1;  #6;
	pop    = 0;  #12;

	pop    = 1;  #6;
	pop    = 0;  #12;

	pop    = 1;  #6;
	pop    = 0;  #12;

	data_i = 11;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 12;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 13;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 14;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 15;
	push   = 1;  #2;
	push   = 0;  #4;

	data_i = 16;
	push   = 1;  #2;
	push   = 0;  #4;



end

endmodule
`endif