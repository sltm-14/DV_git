library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_stop          : in     vl_logic;
        i_enable        : in     vl_logic;
        i_clean         : in     vl_logic;
        i_val           : in     vl_logic_vector(7 downto 0);
        o_sum           : out    vl_logic_vector(7 downto 0)
    );
end adder;
