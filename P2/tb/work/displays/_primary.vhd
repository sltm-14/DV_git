library verilog;
use verilog.vl_types.all;
entity displays is
    port(
        i_full_val      : in     vl_logic_vector(31 downto 0);
        o_7seg          : out    vl_logic_vector(4 downto 0)
    );
end displays;
