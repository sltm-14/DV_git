library verilog;
use verilog.vl_types.all;
entity counter is
    generic(
        LIMIT           : integer := 16;
        LB              : vl_notype
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_enable        : in     vl_logic;
        o_counter       : out    vl_logic_vector;
        o_ovf           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of LIMIT : constant is 1;
    attribute mti_svvh_generic_type of LB : constant is 3;
end counter;
