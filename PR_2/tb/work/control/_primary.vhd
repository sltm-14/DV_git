library verilog;
use verilog.vl_types.all;
entity control is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_start         : in     vl_logic;
        i_load          : in     vl_logic;
        i_error         : in     vl_logic;
        i_done          : in     vl_logic;
        o_clean         : out    vl_logic;
        o_save_x        : out    vl_logic;
        o_save_y        : out    vl_logic;
        o_load_x        : out    vl_logic;
        o_load_y        : out    vl_logic;
        o_veri          : out    vl_logic;
        o_error         : out    vl_logic;
        o_enable        : out    vl_logic;
        o_ready         : out    vl_logic;
        o_init          : out    vl_logic
    );
end control;
