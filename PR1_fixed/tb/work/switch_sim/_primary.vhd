library verilog;
use verilog.vl_types.all;
entity switch_sim is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_sw            : in     vl_logic_vector(9 downto 0);
        o_multiplier    : out    vl_logic_vector(4 downto 0);
        o_multiplicand  : out    vl_logic_vector(4 downto 0)
    );
end switch_sim;
