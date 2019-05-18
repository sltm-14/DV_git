library verilog;
use verilog.vl_types.all;
entity sub is
    port(
        i_rem           : in     vl_logic_vector(31 downto 0);
        i_div           : in     vl_logic_vector(31 downto 0);
        i_flag          : in     vl_logic;
        o_sub           : out    vl_logic_vector(31 downto 0);
        o_flag          : out    vl_logic
    );
end sub;
