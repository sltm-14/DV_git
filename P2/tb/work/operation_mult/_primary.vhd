library verilog;
use verilog.vl_types.all;
entity operation_mult is
    port(
        i_msb2          : in     vl_logic_vector(1 downto 0);
        o_op            : out    vl_logic_vector(1 downto 0)
    );
end operation_mult;
