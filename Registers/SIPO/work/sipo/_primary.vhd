library verilog;
use verilog.vl_types.all;
entity sipo is
    generic(
        DW              : integer := 4
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        enb             : in     vl_logic;
        inp             : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end sipo;
