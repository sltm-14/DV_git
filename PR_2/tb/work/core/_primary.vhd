library verilog;
use verilog.vl_types.all;
library work;
entity core is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_enable        : in     vl_logic;
        i_op            : in     work.pkg_system_mdr.op_select_t;
        i_init          : in     vl_logic;
        i_clean         : in     vl_logic;
        i_dataX         : in     vl_logic_vector(15 downto 0);
        i_dataY         : in     vl_logic_vector(15 downto 0);
        o_done          : out    vl_logic;
        o_result        : out    vl_logic_vector(31 downto 0);
        o_remainder     : out    vl_logic_vector(31 downto 0)
    );
end core;
