/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: add_con.sv
** DESCRIPCION: Entra un balor de cuatro bits, si dicho valor es mayor a 4 se le suman 3, si no, permanece igual
** ENTRADAS: i_hto_0, i_hto_1, i_hto_2, i_hto_3
** SALIDAS:  o_hto_0, o_hto_1, o_hto_2, o_hto_3
** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */
module add_con
import pkg_system_mdr::*;
	(
    input  i_hto_0, /* Entradas a sumar */
    input  i_hto_1,
    input  i_hto_2,
    input  i_hto_3,

    output  o_hto_0, /* Salidas con suma  */
    output  o_hto_1,
    output  o_hto_2,
    output  o_hto_3  
    );

    struct_add wires;
    /* Se pasan los valores de entradas a un bus para sumarlos */
    assign wires.oth_in = {i_hto_3,i_hto_2,i_hto_1,i_hto_0};

    /* Si el valor actual es mayor a 4, se le suman 3, si no el valor pasa igual */
    assign wires.oth_out = ( wires.oth_in > 4'b0100 ) ? ( wires.oth_in + 2'b11 ) : wires.oth_in;

    /* Se separan los valores del bus para la salida */
    assign o_hto_0 = wires.oth_out[0];
    assign o_hto_1 = wires.oth_out[1];
    assign o_hto_2 = wires.oth_out[2];
    assign o_hto_3 = wires.oth_out[3];

  
endmodule