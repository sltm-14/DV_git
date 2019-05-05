library verilog;
use verilog.vl_types.all;
entity mux_2powerN is
    generic(
        MUX_SEL         : integer := 2;
        MDW             : integer := 16
    );
    port(
        i_buses         : in     vl_logic_vector;
        i_sltr          : in     vl_logic_vector;
        o_bus           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MUX_SEL : constant is 1;
    attribute mti_svvh_generic_type of MDW : constant is 1;
end mux_2powerN;
