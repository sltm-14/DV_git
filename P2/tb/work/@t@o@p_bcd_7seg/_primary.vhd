library verilog;
use verilog.vl_types.all;
entity TOP_bcd_7seg is
    port(
        in_Bin          : in     vl_logic_vector(11 downto 0);
        out_displays    : out    vl_logic_vector(4 downto 0);
        out_Signo       : out    vl_logic
    );
end TOP_bcd_7seg;
