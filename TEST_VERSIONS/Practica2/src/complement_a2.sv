/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: complement_a2.sv
** DESCRIPCION: Se obtiene el complemento A2 del valor inicial
** ENTRADAS: i_Val
** SALIDAS:  a,b,c,d,e,f,g
** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */

`ifndef COMPLEMENT_A2_SV
    `define COMPLEMENT_A2_SV
	 
module complement_a2
import pkg_bin_to_thto::*;
(
		input	t_iv	i_Val,
		output		o_Signo,
		display_if.complement	complement_if
);

/* El valor del septimo bit indica si el signo es positivo o negativo, en caso de ser positivo 
** se hace complemento A2 de lo contrario el valor continua igual */
assign complement_if.o_Val   	=  ( i_Val[IVW-1] ) ? ( (~i_Val) + 1'b1 ) : i_Val; 
assign o_Signo 					= ~( i_Val[IVW-1] ) ? 1'b1 : 1'b0;

endmodule

`endif
