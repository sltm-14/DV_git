library verilog;
use verilog.vl_types.all;
entity quotation_add is
    port(
        i_msb           : in     vl_logic;
        i_flag          : in     vl_logic;
        i_enable        : in     vl_logic;
        i_quotation     : in     vl_logic_vector(15 downto 0);
        o_quotation     : out    vl_logic_vector(15 downto 0);
        o_msb           : out    vl_logic;
        o_flag          : out    vl_logic
    );
end quotation_add;
