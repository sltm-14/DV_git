library verilog;
use verilog.vl_types.all;
entity counter2 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_enable        : in     vl_logic;
        o_counter       : out    vl_logic_vector(7 downto 0);
        o_ovf           : out    vl_logic
    );
end counter2;
