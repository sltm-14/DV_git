library verilog;
use verilog.vl_types.all;
entity leds_sim is
    port(
        i_product       : in     vl_logic_vector(7 downto 0);
        i_sign          : in     vl_logic;
        i_stop          : in     vl_logic;
        o_led           : out    vl_logic_vector(8 downto 0);
        o_ready         : out    vl_logic
    );
end leds_sim;
