library verilog;
use verilog.vl_types.all;
entity divisor_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_divisor       : in     vl_logic_vector(15 downto 0);
        i_init          : in     vl_logic_vector(8 downto 0);
        i_flag          : in     vl_logic;
        o_divisor       : out    vl_logic_vector(31 downto 0);
        o_flag          : out    vl_logic
    );
end divisor_reg;
