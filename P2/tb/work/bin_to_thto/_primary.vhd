library verilog;
use verilog.vl_types.all;
entity bin_to_thto is
    port(
        i_Bin           : in     vl_logic_vector(11 downto 0);
        o_Full_Val      : out    vl_logic_vector(31 downto 0)
    );
end bin_to_thto;
