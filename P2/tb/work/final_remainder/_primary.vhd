library verilog;
use verilog.vl_types.all;
entity final_remainder is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_done          : in     vl_logic;
        i_data          : in     vl_logic_vector(31 downto 0);
        o_ready         : out    vl_logic;
        o_data          : out    vl_logic_vector(31 downto 0)
    );
end final_remainder;
