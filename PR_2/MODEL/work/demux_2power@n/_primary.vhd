library verilog;
use verilog.vl_types.all;
entity demux_2powerN is
    generic(
        DDW             : integer := 16
    );
    port(
        i_bus           : in     vl_logic_vector;
        i_sltr          : in     vl_logic_vector(1 downto 0);
        o_buses         : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DDW : constant is 1;
end demux_2powerN;
