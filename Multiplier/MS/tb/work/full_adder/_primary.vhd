library verilog;
use verilog.vl_types.all;
entity full_adder is
    generic(
        DW              : integer := 4
    );
    port(
        i_valA          : in     vl_logic_vector;
        i_valB          : in     vl_logic_vector;
        i_carry         : in     vl_logic;
        o_sum           : out    vl_logic_vector;
        o_carry         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end full_adder;
