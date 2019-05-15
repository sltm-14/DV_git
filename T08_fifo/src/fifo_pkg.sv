`ifndef FIFO_PKG_SV
    `define FIFO_PKG_SV

package fifo_pkg;

    localparam  W_DATA  = 5;
    localparam  W_ADDR  = 12;
    localparam  W_DEPTH = 7;

  //  localparam W_BUFF = $clog2(W_ADDR);

    typedef logic [W_DATA-1:0]  data_t;
    typedef logic [W_ADDR-1:0]  addr_t;
    //typedef logic [W_BUFF-1:0]  buff_t;

	typedef struct{
    	addr_t addr_bin_synch;
    	addr_t addr_synch_gray;
    	addr_t addr_gray_comp;
    }addr_synch_st;

    typedef struct{
        logic  ena_poin_ram_wr;
        addr_t addr_poin_ram_wr;
        
        logic  ena_poin_ram_rd;
        addr_t addr_poin_ram_rd;
    }fifo_st;
    
endpackage
`endif

