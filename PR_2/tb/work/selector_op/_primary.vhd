library verilog;
use verilog.vl_types.all;
library work;
entity selector_op is
    port(
        i_enable        : in     vl_logic;
        i_op            : in     work.pkg_system_mdr.op_select_t;
        o_op            : out    vl_logic_vector(3 downto 0)
    );
end selector_op;
