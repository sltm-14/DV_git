library verilog;
use verilog.vl_types.all;
entity product_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_multiplier    : in     vl_logic_vector(15 downto 0);
        i_ovf           : in     vl_logic;
        i_product       : in     vl_logic_vector(32 downto 0);
        i_enable        : in     vl_logic;
        i_init          : in     vl_logic_vector(4 downto 0);
        o_product       : out    vl_logic_vector(32 downto 0);
        o_msb2          : out    vl_logic_vector(1 downto 0)
    );
end product_reg;
