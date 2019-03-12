library verilog;
use verilog.vl_types.all;
entity ms_mult is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_start         : in     vl_logic;
        i_sw            : in     vl_logic_vector(17 downto 0);
        o_led           : out    vl_logic_vector(16 downto 0);
        o_ready         : out    vl_logic
    );
end ms_mult;
