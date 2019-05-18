library verilog;
use verilog.vl_types.all;
entity rem_full_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_result        : in     vl_logic_vector(31 downto 0);
        i_remainder     : in     vl_logic_vector(31 downto 0);
        i_flag          : in     vl_logic;
        o_register      : out    vl_logic_vector(31 downto 0)
    );
end rem_full_reg;
