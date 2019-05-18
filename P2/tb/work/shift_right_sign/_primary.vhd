library verilog;
use verilog.vl_types.all;
entity shift_right_sign is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_reg           : in     vl_logic_vector(16 downto 0);
        i_product       : in     vl_logic_vector(15 downto 0);
        o_product       : out    vl_logic_vector(32 downto 0)
    );
end shift_right_sign;
