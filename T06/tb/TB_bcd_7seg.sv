/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: tb_bcd.sv
** DESCRIPCION: TB para BCD
** ENTRADAS: in_Bin
** SALIDAS:  out_displays, out_Signo
** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */
module TB_bcd_7seg
	import pkg_bin_to_thto::*;
	();

    t_iv       in_Bin; 			/* Valor en complemento A2 */
    
    t_display  out_displays;    /* Salida a displays */
	logic      out_Signo; 		/* Salida signo */


	TOP_bcd_7seg TOP(
	    .in_Bin		  (in_Bin), 		/* Valor en complemento A2 */
	    
	    .out_displays (out_displays),   /* Salida Unidades */
		.out_Signo	  (out_Signo) 		/* Salida signo */
	);


	initial begin
	    in_Bin    	 = -475;     #4;
	    in_Bin    	 =  2039;    #4;
	    in_Bin    	 = -1097;    #4;
	    in_Bin    	 =  8;       #4;
	end

endmodule // tb_bcd_7seg