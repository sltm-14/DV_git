library verilog;
use verilog.vl_types.all;
entity complement_a2 is
    port(
        i_Val           : in     vl_logic_vector(11 downto 0);
        o_Val           : out    vl_logic_vector(11 downto 0);
        o_Signo         : out    vl_logic
    );
end complement_a2;
