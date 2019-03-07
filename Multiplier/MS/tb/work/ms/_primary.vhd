library verilog;
use verilog.vl_types.all;
entity ms is
    generic(
        DW              : integer := 8
    );
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_start         : in     vl_logic;
        i_multd_val     : in     vl_logic_vector;
        i_multr_val     : in     vl_logic_vector;
        o_rc            : out    vl_logic_vector(16 downto 0);
        o_stop          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end ms;
