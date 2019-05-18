library verilog;
use verilog.vl_types.all;
entity verification2 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_enable        : in     vl_logic;
        i_result        : in     vl_logic_vector(31 downto 0);
        i_remainder     : in     vl_logic_vector(31 downto 0);
        o_result        : out    vl_logic_vector(15 downto 0);
        o_remainder     : out    vl_logic_vector(15 downto 0);
        o_error         : out    vl_logic
    );
end verification2;
