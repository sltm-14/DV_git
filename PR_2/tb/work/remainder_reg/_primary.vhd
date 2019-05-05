library verilog;
use verilog.vl_types.all;
entity remainder_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_dividend      : in     vl_logic_vector(15 downto 0);
        i_remainder     : in     vl_logic_vector(31 downto 0);
        i_enable        : in     vl_logic;
        i_flag          : in     vl_logic;
        i_init          : in     vl_logic_vector(7 downto 0);
        o_remainder     : out    vl_logic_vector(31 downto 0);
        o_flag          : out    vl_logic
    );
end remainder_reg;
