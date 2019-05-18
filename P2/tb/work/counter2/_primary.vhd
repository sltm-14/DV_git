library verilog;
use verilog.vl_types.all;
entity counter2 is
    generic(
        LIMIT           : integer := 16
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_enable        : in     vl_logic;
        o_counter       : out    vl_logic_vector(8 downto 0);
        o_ovf           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of LIMIT : constant is 1;
end counter2;
