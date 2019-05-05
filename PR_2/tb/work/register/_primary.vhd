library verilog;
use verilog.vl_types.all;
entity \register\ is
    generic(
        SDW             : integer := 32
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_val           : in     vl_logic_vector;
        o_val           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SDW : constant is 1;
end \register\;
