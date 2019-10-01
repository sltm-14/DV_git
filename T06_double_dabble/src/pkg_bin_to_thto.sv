/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: pkg_bin_to_thto.sv
** DESCRIPCION: Paquete con información para modificar modulos
				OTHW - Agrega otro display
				IVW  - Agrega mas entradas

** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */
package pkg_bin_to_thto;

localparam OTHW   = 4;  			/* Number of active displays  */
localparam IVW    = 12;  			/* Inicial value width (switches)*/
localparam FVW 	  = IVW + OTHW*4; 	/* Full Value width */
localparam DPW    = 7;  			/* Display width */

typedef	logic [FVW-1:0]				t_fv;
typedef	logic [IVW-1:0]				t_iv;
typedef	logic [OTHW-1:0]			t_thto;
typedef	logic [OTHW-1:0][DPW-1:0]	t_display;

typedef struct{
	t_fv  [IVW:0] full_val;
	t_fv		  switch;
}struct_thto;

typedef struct{
	t_iv	ini_val;
	t_fv 	full_val;
}struct_bcd_TOP;

typedef struct{
	t_thto  oth_in;
	t_thto  oth_out;
	t_fv  	full_val;
}struct_add;


endpackage
