library verilog;
use verilog.vl_types.all;
entity final_values is
    generic(
        VW              : integer := 32
    );
    port(
        i_reminder      : in     vl_logic_vector;
        i_quotient      : in     vl_logic_vector;
        i_done          : in     vl_logic;
        o_reminder      : out    vl_logic_vector;
        o_quotient      : out    vl_logic_vector;
        o_ready         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VW : constant is 1;
end final_values;
