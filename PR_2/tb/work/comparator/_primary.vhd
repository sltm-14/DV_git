library verilog;
use verilog.vl_types.all;
entity comparator is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_result        : in     vl_logic_vector(15 downto 0);
        o_done          : out    vl_logic
    );
end comparator;
