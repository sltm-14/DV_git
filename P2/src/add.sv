/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: add.sv
** DESCRIPCION: Entra el valor conpleto y se dividen en grupos de 4 bits para hacer las sumas correspondientes
**              y asi dividirlos en unidades, decenas, centenas...
** ENTRADAS: i_hto_full
** SALIDAS:  o_hto_full
** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */
`ifndef ADD_SV
    `define ADD_SV
	 
module add
import pkg_system_mdr::*;
	(
    input  t_fv i_hto_full, /* Entra el valor de centenas, decenas y unidades */
    
    output t_fv o_hto_full  /* Sale el nuevo valor de centenas, decenas y unidades */
    );


    /* Se envían las secciones a sumar (si es necesario) */
    generate 
        genvar j;
        for ( j = '0 ; j < 3'b100 ; j = j + 1'b1)begin: generate_con
            integer i = (j<<2)+IVW;
            add_con ADD_CON(
                .i_hto_0(i_hto_full[i  ]),
                .i_hto_1(i_hto_full[i+1]),
                .i_hto_2(i_hto_full[i+2]),
                .i_hto_3(i_hto_full[i+3]),

                .o_hto_0(o_hto_full[((j<<2)+IVW)]),
                .o_hto_1(o_hto_full[((j<<2)+IVW)+1]),
                .o_hto_2(o_hto_full[((j<<2)+IVW)+2]),
                .o_hto_3(o_hto_full[((j<<2)+IVW)+3])
           );
        end: generate_con
    endgenerate
    
    /* Los primeros 8 bits permanecen igual */
    assign o_hto_full[IVW-1:0]   = i_hto_full[IVW-1:0];

endmodule
`endif