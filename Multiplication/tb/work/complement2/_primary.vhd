library verilog;
use verilog.vl_types.all;
entity complement2 is
    port(
        i_val           : in     vl_logic_vector(8 downto 0);
        o_val           : out    vl_logic_vector(7 downto 0);
        o_sign          : out    vl_logic
    );
end complement2;
