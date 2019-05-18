library verilog;
use verilog.vl_types.all;
entity division is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_dividend      : in     vl_logic_vector(15 downto 0);
        i_divisor       : in     vl_logic_vector(15 downto 0);
        i_enable        : in     vl_logic;
        i_sub           : in     vl_logic_vector(31 downto 0);
        i_flag_sub      : in     vl_logic;
        i_count         : in     vl_logic_vector(8 downto 0);
        i_done          : in     vl_logic;
        o_ready         : out    vl_logic;
        o_remainder     : out    vl_logic_vector(31 downto 0);
        o_quotation     : out    vl_logic_vector(15 downto 0);
        o_remainder_alu : out    vl_logic_vector(31 downto 0);
        o_divisor       : out    vl_logic_vector(31 downto 0);
        o_flag_rem      : out    vl_logic;
        o_op            : out    vl_logic_vector(1 downto 0)
    );
end division;
