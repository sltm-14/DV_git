library verilog;
use verilog.vl_types.all;
entity shift_right is
    generic(
        SHIFT           : integer := 1;
        SDW             : integer := 32
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_val           : in     vl_logic_vector;
        i_enable        : in     vl_logic;
        o_val           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SHIFT : constant is 1;
    attribute mti_svvh_generic_type of SDW : constant is 1;
end shift_right;
