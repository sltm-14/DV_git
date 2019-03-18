library verilog;
use verilog.vl_types.all;
entity comp2Product is
    port(
        i_val           : in     vl_logic_vector(7 downto 0);
        i_signA         : in     vl_logic;
        i_signB         : in     vl_logic;
        o_product       : out    vl_logic_vector(7 downto 0);
        o_sign          : out    vl_logic
    );
end comp2Product;
