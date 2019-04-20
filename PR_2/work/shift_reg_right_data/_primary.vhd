library verilog;
use verilog.vl_types.all;
entity shift_reg_right_data is
    generic(
        SDW             : integer := 32
    );
    port(
        i_val           : in     vl_logic_vector;
        i_counter       : in     vl_logic_vector(2 downto 0);
        i_init          : in     vl_logic;
        i_enable        : in     vl_logic;
        o_val           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SDW : constant is 1;
end shift_reg_right_data;
