library verilog;
use verilog.vl_types.all;
entity piso_msb is
    generic(
        DW              : integer := 4
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        enb             : in     vl_logic;
        l_s             : in     vl_logic;
        inp             : in     vl_logic_vector;
        \out\           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end piso_msb;
