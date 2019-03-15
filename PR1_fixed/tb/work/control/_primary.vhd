library verilog;
use verilog.vl_types.all;
entity control is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_start         : in     vl_logic;
        i_mltr_done     : in     vl_logic;
        o_load          : out    vl_logic;
        o_clean         : out    vl_logic
    );
end control;
