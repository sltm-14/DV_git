package packege;

localparam DW       = 4;
localparam MAXCNT   = 10;

typedef logic [DW-1:0] cnt_t;
typedef logic          ovf_t;

typedef struct {
cnt_t       count;
ovf_t       ovf;
} cntr_t;

endpackage: cntr_mod_n_ovf_pkg
