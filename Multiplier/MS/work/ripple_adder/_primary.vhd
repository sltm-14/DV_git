library verilog;
use verilog.vl_types.all;
entity ripple_adder is
    generic(
        AW              : integer := 8;
        HAW             : vl_notype
    );
    port(
        i_valA          : in     vl_logic_vector;
        i_valB          : in     vl_logic_vector;
        o_sum           : out    vl_logic_vector;
        o_carry         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AW : constant is 1;
    attribute mti_svvh_generic_type of HAW : constant is 3;
end ripple_adder;
