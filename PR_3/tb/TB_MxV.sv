`ifndef TB_MXV_SV
    `define TB_MXV_SV

module TB_MxV
import mxv_pkg::*;
();

	logic clk;
	logic rst;

	logic       clk_b;  
	logic       rcv;
	data_uart_t data;

	logic      error;
	result_t   result;

top_full_mxv TOP(	
	.clk    (clk),
	.rst    (rst),

	.clk_b  (clk_b),
	.rcv    (rcv),
	.data   (data),

	.error  (error),
	.result (result)
);

always begin
    #1 clk <= ~clk;
end
always begin
	#3 clk_b <= ~clk_b;
end



initial begin
	rcv   = 0;
	data  = 0;
	clk   = 1;  
	clk_b = 1;  

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