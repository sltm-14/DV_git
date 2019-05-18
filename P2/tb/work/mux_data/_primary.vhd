library verilog;
use verilog.vl_types.all;
library work;
entity mux_data is
    port(
        i_mult          : in     vl_logic_vector(15 downto 0);
        i_div           : in     vl_logic_vector(31 downto 0);
        i_root          : in     vl_logic_vector(31 downto 0);
        i_null          : in     vl_logic_vector(15 downto 0);
        i_selector      : in     work.pkg_system_mdr.op_select_t;
        o_dataM         : out    vl_logic_vector(15 downto 0);
        o_dataDR        : out    vl_logic_vector(31 downto 0)
    );
end mux_data;
