library verilog;
use verilog.vl_types.all;
entity leds is
    port(
        i_product       : in     vl_logic_vector(7 downto 0);
        i_sign          : in     vl_logic;
        i_stop          : in     vl_logic;
        o_led0          : out    vl_logic;
        o_led1          : out    vl_logic;
        o_led2          : out    vl_logic;
        o_led3          : out    vl_logic;
        o_led4          : out    vl_logic;
        o_led5          : out    vl_logic;
        o_led6          : out    vl_logic;
        o_led7          : out    vl_logic;
        o_led8          : out    vl_logic;
        o_led9          : out    vl_logic;
        o_led10         : out    vl_logic;
        o_led11         : out    vl_logic;
        o_led12         : out    vl_logic;
        o_led13         : out    vl_logic;
        o_led14         : out    vl_logic;
        o_led15         : out    vl_logic;
        o_led16         : out    vl_logic;
        o_ready         : out    vl_logic
    );
end leds;
