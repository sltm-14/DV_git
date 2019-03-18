library verilog;
use verilog.vl_types.all;
entity tb_ms is
    generic(
        DW              : integer := 4;
        DW2             : vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
    attribute mti_svvh_generic_type of DW2 : constant is 3;
end tb_ms;
