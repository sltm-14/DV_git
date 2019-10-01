/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: TOP_bcd_7seg.sv
** DESCRIPCION: Top module para BCD
** ENTRADAS: in_Bin
** SALIDAS:  out_displays, out_Signo
** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */
module TOP_bcd_7seg
    import pkg_bin_to_thto::*;
    (
    input  t_iv       in_Bin,       /* Valor en complemento A2 */

    output t_display  out_displays, /* Salida para los displays */
	output            out_Signo     /* Salida signo */
    );

    struct_bcd_TOP wires;
	 
    /* Modulo para obtener el complemento A2 */
	complement_a2 A2_COM(
		.i_Val    (in_Bin),

		.o_Signo  (out_Signo),
		.o_Val    (wires.ini_val)
	);
    
    /* Modulo para obtener las unidades, decenas y centenas por separado */
    bin_to_thto OTHT(
        .i_Bin      (wires.ini_val),
        
        .o_Full_Val (wires.full_val)
     );

    /* Instanciaciones para lis displays */
    displays DISPLAY(
        .i_full_val (wires.full_val),
        .o_7seg     (out_displays)
    );
	

endmodule
