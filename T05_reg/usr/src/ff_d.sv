/*******************************************************************
* Nombre del modulo:
*  ff_d.sv
* Descripcion:
*  Este modulo representa un flip flop tipo D
* Entradas:
*  Clock, reset, enable y un dato
* Salidas: 
*  Captura el dato de entrada cuando aparece un flanco de reloj 
*  y cuando el enable esta en alto
* Version: 
*  1.0
* Autores:
*  Carem Bernabe
*  Andres Hernandez
* Fecha: 
*  01/03/2019
********************************************************************/
module ff_d (
//Inputs
input       clk,
input       rst,
input       enb,
input       inp,

//Outputs
output      out
);

//Wires
logic ff_d_r;

always_ff@(posedge clk or negedge rst) begin: ff_d_label
    if(!rst)
        ff_d_r  <= '0;	//Inicia en cero con reset
    else if (enb)
        ff_d_r  <= inp;	//Captura el dato
end:ff_d_label

assign out  = ff_d_r;

endmodule
