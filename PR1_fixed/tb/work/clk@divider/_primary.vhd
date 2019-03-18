library verilog;
use verilog.vl_types.all;
entity clkDivider is
    port(
        i_reset         : in     vl_logic;
        i_clk_FPGA      : in     vl_logic;
        o_clk           : out    vl_logic
    );
end clkDivider;
