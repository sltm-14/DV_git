library verilog;
use verilog.vl_types.all;
entity multiplicand_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_enable        : in     vl_logic;
        i_reg           : in     vl_logic_vector(15 downto 0);
        o_reg           : out    vl_logic_vector(15 downto 0)
    );
end multiplicand_reg;
