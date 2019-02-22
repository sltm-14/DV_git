//-----------------------------------------------
// NOMBRE DEL MODULO: clkDivider.sv
// DESCRIPCION: Implementeacion de divisor de frecuencia
// ENTRADAS: i_clk_FPGA (Reloj inicial) reset (reinicio del programa)
// SALIDAS:  o_clk (Reloj de salida)
// VERSION:  1.0
// AUTORES:  Andrés Hernandez, Carem Bernabe
// FECHA:    18 / 02 / 19
//----------------------------------------------

module clk_divider
#(
	parameter FRECUENCY_IN  = 50_000_000,
	parameter FRECUENCY_OUT = 1,

	parameter COUNT_LENGTH  =  $clog2(FRECUENCY_IN)
)
(
	// Input signals
	input i_reset, 
	input i_clk_FPGA,
	
	// Output signal
	output logic  o_clk
);
	
	logic [COUNT_LENGTH-1:0]counter = 0; // Frequency counter
	localparam CONST    = (FRECUENCY_IN/FRECUENCY_OUT)/2; // Counter limit

	always@(posedge i_clk_FPGA, posedge i_reset) begin

		if(i_reset) begin // Reset counter
			o_clk   <= 0;
			counter <= 0;
		end

		else if(counter == (CONST - 1'b1)) begin// If counter gets to the limit
			o_clk   <= ~o_clk; // o_clk suffles its state
			counter <= 0;      // counter is set to 0
		end

		else begin
			counter <= counter + 1'b1; //add one to counter
			o_clk   <= o_clk;		   //o_clk keeps its value
		end

	end
	
endmodule