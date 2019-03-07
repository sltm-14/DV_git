library verilog;
use verilog.vl_types.all;
entity ff_d is
    generic(
        DW              : integer := 8
    );
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_load          : in     vl_logic;
        i_data          : in     vl_logic_vector;
        o_out           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end ff_d;
