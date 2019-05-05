library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        i_val_a         : in     vl_logic_vector(31 downto 0);
        i_val_b         : in     vl_logic_vector(31 downto 0);
        i_sltr          : in     vl_logic_vector(1 downto 0);
        i_init          : in     vl_logic;
        o_val           : out    vl_logic_vector(31 downto 0)
    );
end alu;
