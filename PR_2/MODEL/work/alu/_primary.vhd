library verilog;
use verilog.vl_types.all;
library work;
entity alu is
    port(
        i_val_a         : in     vl_logic_vector(31 downto 0);
        i_val_b         : in     vl_logic_vector(31 downto 0);
        i_sltr          : in     work.pkg_system_mdr.alu_op_t;
        o_val           : out    vl_logic_vector(31 downto 0)
    );
end alu;
