module ripple_adder #(
	parameter AW = 8,
	parameter HAW = AW/2
	)(
	input  [AW-1:0] i_valA,
	input  [AW-1:0] i_valB,

	output [AW-1:0] o_sum,
	output  	  	o_carry
	);

	wire [HAW-1:0] 	w_fd1_s;
	wire			w_fd1_c;

	wire [HAW-1:0] 	w_fdA_s;
	wire			w_fdA_c;

	wire [HAW-1:0] 	w_fdB_s;
	wire			w_fdB_c;

	full_adder FD_1(
		.i_valA		(i_valA[HAW-1:0]),
		.i_valB		(i_valB[HAW-1:0]),
		.i_carry	(1'b0),

		.o_sum		(w_fd1_s),
		.o_carry	(w_fd1_c)
	);

	full_adder FD_A(
		.i_valA		(i_valA[AW-1:HAW]),
		.i_valB		(i_valB[AW-1:HAW]),
		.i_carry	(1'b1),

		.o_sum		(w_fdA_s),
		.o_carry	(w_fdA_c)
	);

	full_adder FD_B(
		.i_valA		(i_valA[AW-1:HAW]),
		.i_valB		(i_valB[AW-1:HAW]),
		.i_carry	(1'b0),

		.o_sum		(w_fdB_s),
		.o_carry	(w_fdB_c)
	);


	assign o_sum   = ( w_fd1_c ) ? {w_fdA_s,w_fd1_s} : {w_fdB_s,w_fd1_s};
	assign o_carry = ( w_fd1_c ) ? w_fdA_c : w_fdB_c;


endmodule // ripple_adder