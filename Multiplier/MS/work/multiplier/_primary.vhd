library verilog;
use verilog.vl_types.all;
entity multiplier is
    generic(
        DW              : integer := 8;
        RW              : vl_notype
    );
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_load          : in     vl_logic;
        i_shift         : in     vl_logic;
        i_add           : in     vl_logic;
        i_add_out       : in     vl_logic_vector;
        i_multiplier    : in     vl_logic_vector;
        o_lsb           : out    vl_logic;
        o_rc            : out    vl_logic;
        o_rb            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
    attribute mti_svvh_generic_type of RW : constant is 3;
end multiplier;
