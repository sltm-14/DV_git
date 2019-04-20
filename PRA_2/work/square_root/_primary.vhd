library verilog;
use verilog.vl_types.all;
library work;
entity square_root is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_alu_result    : in     vl_logic_vector(31 downto 0);
        i_val_x         : in     vl_logic_vector(15 downto 0);
        i_enable        : in     vl_logic;
        i_init          : in     vl_logic;
        i_counter       : in     vl_logic_vector(2 downto 0);
        i_alu_msb       : in     vl_logic;
        o_root_alu_a    : out    vl_logic_vector(31 downto 0);
        o_root_alu_b    : out    vl_logic_vector(31 downto 0);
        o_root_op       : out    work.pkg_system_mdr.alu_op_t
    );
end square_root;
