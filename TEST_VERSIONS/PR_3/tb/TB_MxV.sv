`ifndef TB_MXV_SV
    `define TB_MXV_SV

module TB_MxV
import mxv_pkg::*;
();

	logic clk;
	logic rst;

	logic       rcv;
	data_uart_t data;

	logic      push_result;
	logic      pop_result;
	logic      push_vector;
	logic      pop_vector;
	push_pop_t push_matrix;
	push_pop_t pop_matrix;
	val_t      val;
	sltr_4_t   dmx_v_sltr;
	sltr_2_t   mx_reg_sltr;
	sltr_2_t   mx_a_sltr;
	sltr_2_t   mx_b_sltr;
	sltr_2_t   mx_c_sltr;
	sltr_2_t   mx_d_sltr;

ctrl_top CTRL_TOP(	
	.clk   (clk),
	.rst   (rst),

	.rcv   (rcv),
	.data  (data),

	.push_result  (push_result),
	.pop_result   (pop_result),
	.push_vector  (push_vector),
	.pop_vector   (pop_vector),
	.push_matrix  (push_matrix),
	.pop_matrix   (pop_matrix),
	.val          (val),
	.dmx_v_sltr   (dmx_v_sltr),
	.mx_reg_sltr  (mx_reg_sltr),
	.mx_a_sltr   (mx_a_sltr),
	.mx_b_sltr   (mx_b_sltr),
	.mx_c_sltr   (mx_c_sltr),
	.mx_d_sltr   (mx_d_sltr),
	.ena_proc_a   (ena_proc_a),
    .ena_proc_b   (ena_proc_b),
    .ena_proc_c   (ena_proc_c),
    .ena_proc_d   (ena_proc_d)


);

always begin
    #1 clk <= ~clk;
end


initial begin
	rcv  = 0;
	data = 0;
	clk  = 1;  

	rst    = 1;  #2;
	rst    = 0;  #3;
	rst    = 1;  #2;

	rcv  = 0; data = 0; #3;

	/* Establecer tamaño ---------------------------------- */

	rcv  = 1; data = "F"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "E"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "2"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "1"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "3"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "E"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "F"; #2;	rcv  = 0; data = 0; #4; #14;

	/* Indicar comienzo de transmision -------------------- */

	rcv  = 1; data = "F"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "E"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "1"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "3"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "E"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "F"; #2;	rcv  = 0; data = 0; #4; #14;

	/* Datos matriz ------------------------------------- */

	rcv  = 1; data = "F"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "E"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "9"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "4"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4; /*---*/
	rcv  = 1; data = "1"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "2"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "3"; #2;	rcv  = 0; data = 0; #4; /*---*/

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4; /*---*/
	rcv  = 1; data = "1"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "2"; #2;	rcv  = 0; data = 0; #4;
	
	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "3"; #2;	rcv  = 0; data = 0; #4; /*---*/

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4; /*---*/
	rcv  = 1; data = "1"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "2"; #2;	rcv  = 0; data = 0; #4;
	
	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "3"; #2;	rcv  = 0; data = 0; #4; /*---*/

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "E"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "F"; #2;	rcv  = 0; data = 0; #4; #14;

	/* Datos vector ------------------------------------ */

	rcv  = 1; data = "F"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "E"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "3"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "4"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4; /*---*/
	rcv  = 1; data = "4"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "4"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "0"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "4"; #2;	rcv  = 0; data = 0; #4; /*---*/

	rcv  = 1; data = "_"; #2;	rcv  = 0; data = 0; #4;

	rcv  = 1; data = "E"; #2;	rcv  = 0; data = 0; #4;
	rcv  = 1; data = "F"; #2;	rcv  = 0; data = 0; #4; #14;

end


endmodule
`endif