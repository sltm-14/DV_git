library verilog;
use verilog.vl_types.all;
entity or_gate is
    port(
        i_val_a         : in     vl_logic_vector(31 downto 0);
        i_val_b         : in     vl_logic_vector(31 downto 0);
        o_val           : out    vl_logic_vector(31 downto 0)
    );
end or_gate;
