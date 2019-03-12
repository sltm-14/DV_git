library verilog;
use verilog.vl_types.all;
entity multiplier is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_load          : in     vl_logic;
        i_data          : in     vl_logic_vector(7 downto 0);
        o_done          : out    vl_logic;
        o_lsb           : out    vl_logic
    );
end multiplier;
