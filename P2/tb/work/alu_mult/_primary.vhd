library verilog;
use verilog.vl_types.all;
library work;
entity alu_mult is
    port(
        i_val_a_M       : in     vl_logic_vector(15 downto 0);
        i_val_b_M       : in     vl_logic_vector(15 downto 0);
        i_val_a_DR      : in     vl_logic_vector(31 downto 0);
        i_val_b_DR      : in     vl_logic_vector(31 downto 0);
        i_sltr          : in     vl_logic_vector(1 downto 0);
        i_init          : in     vl_logic;
        i_enable        : in     vl_logic;
        i_flag          : in     vl_logic;
        i_op            : in     work.pkg_system_mdr.op_select_t;
        o_val_M         : out    vl_logic_vector(15 downto 0);
        o_val_DR        : out    vl_logic_vector(31 downto 0);
        o_flag          : out    vl_logic
    );
end alu_mult;
