library verilog;
use verilog.vl_types.all;
library work;
entity mux_output is
    port(
        i_result_mult   : in     vl_logic_vector(31 downto 0);
        i_result_div    : in     vl_logic_vector(31 downto 0);
        i_result_root   : in     vl_logic_vector(31 downto 0);
        i_remainder_div : in     vl_logic_vector(31 downto 0);
        i_remainder_root: in     vl_logic_vector(31 downto 0);
        i_ready_mult    : in     vl_logic;
        i_ready_div     : in     vl_logic;
        i_ready_root    : in     vl_logic;
        i_selector      : in     work.pkg_system_mdr.op_select_t;
        o_result        : out    vl_logic_vector(31 downto 0);
        o_remainder     : out    vl_logic_vector(31 downto 0);
        o_ready         : out    vl_logic
    );
end mux_output;
