/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: bin_to_thto.sv
** DESCRIPCION: Entra el valor completo ne binario y se divide en unidades, decenas, centenas...
** ENTRADAS: i_Bin
** SALIDAS:  o_Full_Val
** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */
module bin_to_thto
import pkg_system_mdr::*;
    (
    input  [IVW-1:0]   i_Bin, /* Se introduce el valor que se quiere separar en unidades, decenas y centenas */
    
    output [FVW-1:0]   o_Full_Val
    );

    /* cables para pasar y hacer shift de cada uno de los modulos sumadores */
    struct_thto  wires;

    /* Para iniciar se toman los valores de entrada y se recorren en cada suma */
    assign wires.full_val[0] = {'0,i_Bin[IVW-1:0]};

    /* Se pasan los valores con shift para sus respectivas sumas, esto para separarlos entre unidades, decenas... */
    generate 
        genvar i;
        for ( i = 0; i < IVW-1'b1 ; i = i + 1'b1)begin: generate_add
            add add( 
                .i_hto_full( wires.full_val[i] << 1'b1 ), 
                .o_hto_full( wires.full_val[i+1'b1] ) 
            );
        end: generate_add
    endgenerate

    /* Se reparte el valor entero a sus unidades, decenas y centenas */
    assign o_Full_Val = wires.full_val[IVW-1'b1] << 1'b1;

    
endmodule
