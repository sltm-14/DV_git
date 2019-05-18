library verilog;
use verilog.vl_types.all;
entity multiplication is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_multiplier    : in     vl_logic_vector(15 downto 0);
        i_multiplicand  : in     vl_logic_vector(15 downto 0);
        i_enable        : in     vl_logic;
        i_alu_result    : in     vl_logic_vector(15 downto 0);
        i_count         : in     vl_logic_vector(8 downto 0);
        i_done          : in     vl_logic;
        o_op            : out    vl_logic_vector(1 downto 0);
        o_product_out   : out    vl_logic_vector(32 downto 0);
        o_multiplicand  : out    vl_logic_vector(15 downto 0);
        o_ready         : out    vl_logic;
        o_result        : out    vl_logic_vector(31 downto 0)
    );
end multiplication;
