library verilog;
use verilog.vl_types.all;
entity shift_left is
    generic(
        SHIFT           : integer := 1
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_val           : in     vl_logic_vector(31 downto 0);
        i_init          : in     vl_logic;
        i_enable        : in     vl_logic;
        o_val           : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SHIFT : constant is 1;
end shift_left;
