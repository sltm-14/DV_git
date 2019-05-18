library verilog;
use verilog.vl_types.all;
entity quotation_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_msb           : in     vl_logic;
        i_flag          : in     vl_logic;
        i_enable        : in     vl_logic;
        i_quotation     : in     vl_logic_vector(15 downto 0);
        o_quotation     : out    vl_logic_vector(15 downto 0)
    );
end quotation_reg;
