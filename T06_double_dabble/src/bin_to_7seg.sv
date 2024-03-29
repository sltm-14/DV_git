/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: bin_to_7seg.sv
** DESCRIPCION: Entra el valor en binario (se recibe cada bit por separado) y salen las salidas a los displays
** ENTRADAS: A,B,C,D
** SALIDAS:  a,b,c,d,e,f,g
** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */
module bin_to_7seg(
	input A, /* A, B, C y D son las entradas, valores de 0 a 9 siendo A el bit mas significativo */
	input B,
	input C,
	input D,
	
	output a, /* Cada una de las letres corresponde a uno de los leds de los display 7 segmentos */
	output b,
	output c,
	output d,
	output e,
	output f,
	output g
);
	/* Se calcula la salida para cada uno de los leds */
    assign a = ~(  A | C | ( B & D ) | (( ~B ) & ( ~D ))  );
    assign b = ~(  (~B) | (( ~C ) & ( ~D )) | ( C & D )  );
    assign c = ~(  B | ~C | D  );
    assign d = ~(  ( ( ~B ) & ( ~D )) | ( C &( ~D )) | ( B & ( ~C )& D ) | ( ( ~B )& C) | A );
    assign e = ~(  (( ~B )&( ~D )) | ( C &( ~D )) ); 
    assign f = ~(  A | (( ~C )&( ~D )) | ( B &( ~C )) | ( B &( ~D ))  );
    assign g = ~(  A | ( B &( ~C )) | (( ~B ) & C ) | ( C & ( ~D ) )  );

endmodule
