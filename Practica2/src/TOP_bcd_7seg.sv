/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: TOP_bcd_7seg.sv
** DESCRIPCION: Top module para BCD
** ENTRADAS: in_Bin
** SALIDAS:  out_displays, out_Signo
** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */

`ifndef TOP_BCD_7SEG_SV
    `define TOP_BCD_7SEG_SV

module TOP_bcd_7seg
import pkg_bin_to_thto::*;
(
	input  t_iv       in_Bin,       /* Valor en complemento A2 */

	output t_display  out_displays, /* Salida para los displays */
	output            out_Signo     /* Salida signo */
);
	display_if	top_bcd_itf();
	 
    /* Modulo para obtener el complemento A2 */
	complement_a2 A2_COM
	(
		.i_Val    		(in_Bin),

		.o_Signo  		(out_Signo),
		.complement_if		(top_bcd_itf.complement)
	);
    
    /* Modulo para obtener las unidades, decenas y centenas por separado */
    bin_to_thto OTHT
	 (
		.thto_if		(top_bcd_itf.otht)
	 );

    /* Instanciaciones para lis displays */
    displays DISPLAY
	 (
		.display_module_if	(top_bcd_itf.display),
		.o_7seg     		(out_displays)
    );
	
endmodule

`endif
