library verilog;
use verilog.vl_types.all;
entity sign_reg is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_load          : in     vl_logic;
        i_val1          : in     vl_logic;
        i_val2          : in     vl_logic;
        o_val1          : out    vl_logic;
        o_val2          : out    vl_logic
    );
end sign_reg;
