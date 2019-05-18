library verilog;
use verilog.vl_types.all;
entity final_quotation is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_done          : in     vl_logic;
        i_data          : in     vl_logic_vector(15 downto 0);
        o_data          : out    vl_logic_vector(15 downto 0)
    );
end final_quotation;
