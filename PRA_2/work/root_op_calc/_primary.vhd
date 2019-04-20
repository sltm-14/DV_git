library verilog;
use verilog.vl_types.all;
library work;
entity root_op_calc is
    port(
        i_alu_msb       : in     vl_logic;
        o_or_q          : out    vl_logic_vector(31 downto 0);
        o_or_alu        : out    vl_logic_vector(31 downto 0);
        o_op_val        : out    work.pkg_system_mdr.alu_op_t
    );
end root_op_calc;
