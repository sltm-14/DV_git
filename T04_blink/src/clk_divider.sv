//-----------------------------------------------
// MODULE NAME: clk_divider.sv
//
// DESCRIPTION: Implementation of frequency divider
// INPUTS:   i_clk_FPGA (initial clock) reset (reset of the code)
// OUTOUTS:  o_clk (output clock)
// VERSION:  1.0
// AUTHORS:  Andres Hernandez, Carem Bernabe
// DATE:     18 / 02 / 19
//----------------------------------------------

module clk_divider
#(
	parameter FRECUENCY_IN  = 10,
	parameter FRECUENCY_OUT = 1,

	parameter COUNT_LENGTH  = $clog2(FRECUENCY_IN)
)
(
	// Input signals
	input i_rst, 
	input i_clk_FPGA,
	
	// Output signal
	output o_clk
);
	
	logic [COUNT_LENGTH-1:0]counter = 0; // Frequency counter
	logic l_clk;
	localparam CONST    = (FRECUENCY_IN/FRECUENCY_OUT)/2; // Counter limit

	always@(posedge i_clk_FPGA, posedge i_rst) begin

		if(i_rst) begin // Reset counter
			l_clk   <= 0;
			counter <= 0;
		end

		else if(counter == (CONST - 1'b1)) begin// If counter gets to the limit
			l_clk   <= ~l_clk; // l_clk suffles its state
			counter <= 0;      // counter is set to 0
		end

		else begin
			counter <= counter + 1'b1; //add one to counter
			l_clk   <= l_clk;		   //l_clk keeps its value
		end

	end

	assign o_clk = l_clk;
	
endmodule