library verilog;
use verilog.vl_types.all;
entity demux_2powerN is
    generic(
        MUX_SEL         : integer := 2;
        DDW             : integer := 16
    );
    port(
        i_bus           : in     vl_logic_vector;
        i_sltr          : in     vl_logic_vector;
        o_buses         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MUX_SEL : constant is 1;
    attribute mti_svvh_generic_type of DDW : constant is 1;
end demux_2powerN;
