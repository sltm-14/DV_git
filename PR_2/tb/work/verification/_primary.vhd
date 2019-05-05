library verilog;
use verilog.vl_types.all;
library work;
entity verification is
    port(
        i_enable        : in     vl_logic;
        i_dataX         : in     vl_logic_vector(15 downto 0);
        i_dataY         : in     vl_logic_vector(15 downto 0);
        i_op            : in     work.pkg_system_mdr.op_select_t;
        o_error         : out    vl_logic
    );
end verification;
