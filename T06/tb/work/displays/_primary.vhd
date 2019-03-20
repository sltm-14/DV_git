library verilog;
use verilog.vl_types.all;
entity displays is
    port(
        i_full_val      : in     vl_logic_vector(27 downto 0);
        o_7seg          : out    vl_logic_vector(3 downto 0)
    );
end displays;
