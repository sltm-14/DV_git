library verilog;
use verilog.vl_types.all;
entity add is
    port(
        i_hto_full      : in     vl_logic_vector(31 downto 0);
        o_hto_full      : out    vl_logic_vector(31 downto 0)
    );
end add;
