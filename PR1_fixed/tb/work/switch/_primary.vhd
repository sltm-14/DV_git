library verilog;
use verilog.vl_types.all;
entity switch is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_sw0           : in     vl_logic;
        i_sw1           : in     vl_logic;
        i_sw2           : in     vl_logic;
        i_sw3           : in     vl_logic;
        i_sw4           : in     vl_logic;
        i_sw5           : in     vl_logic;
        i_sw6           : in     vl_logic;
        i_sw7           : in     vl_logic;
        i_sw8           : in     vl_logic;
        i_sw9           : in     vl_logic;
        i_sw10          : in     vl_logic;
        i_sw11          : in     vl_logic;
        i_sw12          : in     vl_logic;
        i_sw13          : in     vl_logic;
        i_sw14          : in     vl_logic;
        i_sw15          : in     vl_logic;
        i_sw16          : in     vl_logic;
        i_sw17          : in     vl_logic;
        o_multiplier    : out    vl_logic_vector(4 downto 0);
        o_multiplicand  : out    vl_logic_vector(4 downto 0)
    );
end switch;
