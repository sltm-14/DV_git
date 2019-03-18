library verilog;
use verilog.vl_types.all;
entity multiplicand is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_load          : in     vl_logic;
        i_data          : in     vl_logic_vector(3 downto 0);
        i_stop          : in     vl_logic;
        o_data          : out    vl_logic_vector(7 downto 0)
    );
end multiplicand;
