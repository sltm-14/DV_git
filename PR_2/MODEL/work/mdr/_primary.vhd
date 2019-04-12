library verilog;
use verilog.vl_types.all;
entity mdr is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_start         : in     vl_logic;
        i_load          : in     vl_logic;
        i_data          : in     vl_logic_vector(15 downto 0);
        i_op            : in     vl_logic_vector(1 downto 0);
        o_load_x        : out    vl_logic;
        o_load_y        : out    vl_logic;
        o_error         : out    vl_logic
    );
end mdr;
