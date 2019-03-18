library verilog;
use verilog.vl_types.all;
entity ms_for_simulation is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_start         : in     vl_logic;
        i_mltnd_val     : in     vl_logic_vector(3 downto 0);
        i_mlter_val     : in     vl_logic_vector(3 downto 0);
        o_product       : out    vl_logic_vector(7 downto 0)
    );
end ms_for_simulation;
