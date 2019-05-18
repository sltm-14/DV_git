library verilog;
use verilog.vl_types.all;
entity clkDivider is
    port(
        rst             : in     vl_logic;
        clk_FPGA        : in     vl_logic;
        o_clk           : out    vl_logic
    );
end clkDivider;
