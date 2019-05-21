`ifndef MXV_PKG_SV
    `define MXV_PKG_SV

package mxv_pkg;

    /*    import mxv_pkg::*;    */

    /* PARAMETERS ------------------------------- */

    localparam  DW  = 255;
    localparam  DIW = $clog2(DW);
    localparam  RW  = $clog2(DW*DW*8);

    localparam  MUX_IN_2 = 2;
    localparam  DMX_IN_2 = 2;
    localparam  SLTR_2   = $clog2(DMX_IN_2);
    localparam  DMX_IN_4 = 4;
    localparam  SLTR_4   = $clog2(DMX_IN_4);
    localparam  DMX_IN_8 = 8;
    localparam  SLTR_8   = $clog2(DMX_IN_8);

    localparam  DWUART  = 8;
    localparam  DHEX    = 5;
    localparam  DDEC    = 9;

    localparam  KEY_0   = 48;
    localparam  KEY_9   = 57;
    localparam  KEY_A   = 65;
    localparam  KEY_F   = 70;

    localparam SIPO_REG = 14;
    localparam CW       = 7;
    localparam NMAX     = 8;
    localparam NW       = $clog2(NMAX);

    localparam COMW     = $clog2(5);

    localparam FW       = $clog2(16);

    localparam PPS      = 8;
    localparam VW       = 8;




    localparam FE_FRAME       = 9'h0FE;
    localparam EF_FRAME       = 9'h0EF;
    localparam UNDERSCORE     = 300;
    localparam NO_COMMAND     = 9'h000;
    localparam COMMAND_SIZE   = 9'h001;
    localparam COMMAND_REPEAT = 9'h002;
    localparam COMMAND_START  = 9'h003;
    localparam COMMAND_MV     = 9'h004;

    /* TYPEDEFS -------------------------------- */

    typedef logic [DW-1:0]       data_t;
    typedef logic [DIW-1:0]      data_i_t;
    typedef logic [RW-1:0]       result_t;
    typedef logic [DIW-1:0]      mux_2_1_t;
    typedef logic [SLTR_2-1:0]   sltr_2_t;
    typedef logic [DMX_IN_8-1:0] dmx_1_8_w4b_t [DIW-1:0];
    typedef logic [SLTR_8-1:0]   sltr_8_t;
    typedef logic [DMX_IN_8-1:0] dmx_1_8_w1b_t;
    typedef logic [SLTR_4-1:0]   sltr_4_t;
    typedef logic [DIW-1:0] dmx_1_4_w4b_t [DMX_IN_4-1:0] ;

   
    typedef logic [DMX_IN_4-1:0] dmx_1_2_w4b_t [DHEX-1:0];
    typedef logic [DMX_IN_4-1:0] dmx_1_2_w8b_t [DDEC-1:0];

    typedef logic [DWUART-1:0]   data_uart_t;
    typedef logic [DHEX-1:0]     data_hex_t;
    typedef logic [DHEX-1:0]     data_hex_sipo_t [SIPO_REG-1:0];
    typedef logic [DDEC-1:0]     data_dec_t;
    typedef logic [DHEX-1:0]     data_h2d_reg_t  [1:0];

    typedef logic [CW-1:0]       count_t;
    typedef logic [NW-1:0]       n_t;

    typedef logic [COMW -1:0]    command_t;
    typedef logic [FW-1:0]       frame_size_t;
    typedef logic [PPS-1:0]      push_pop_t;
    typedef logic [VW-1:0]       val_t;



    /* ENUMS ----------------------------------- */

    typedef enum logic [4:0] {FE, UC_1,FRAME_SIZE,UC_2,COMMAND,UC_3,SIZE,UC_SZ,
                              FIFO_M0,UC_M0,FIFO_M1,UC_M1,FIFO_M2,UC_M2,FIFO_M3,UC_M3,
                              FIFO_M4,UC_M4,FIFO_M5,UC_M5,FIFO_M6,UC_M6,FIFO_M7,UC_M7,
                              FIFO_V,UC_V,EF,CLEAN} state_ctrl_t;


    /* STRUCTS --------------------------------- */

    typedef struct {

        data_i_t     ctrl_data;
        logic        ctrl_push;
        logic        ctrl_pop;

        data_t        matrix_val;
        sltr_8_t      dmx_sltr;

     

        data_t        vector_val;
        sltr_4_t      dmx_4_sltr;
        data_i_t      fifo_dmx_vctr;
        dmx_1_4_w4b_t dmx_prcsr_vctr;

        data_t        data_fifo_0;
        data_t        data_fifo_1;
        data_t        data_fifo_2;
        data_t        data_fifo_3;
        data_t        data_fifo_4;
        data_t        data_fifo_5;
        data_t        data_fifo_6;
        data_t        data_fifo_7;

        data_i_t      matrix_0_4;
        data_i_t      matrix_1_5;
        data_i_t      matrix_2_6;
        data_i_t      matrix_3_7;

        result_t      result_mux;
        result_t      result_a;
        result_t      result_reg_a;
        result_t      result_b;
        result_t      result_reg_b;
        result_t      result_c;
        result_t      result_reg_c;
        result_t      result_d;
        result_t      result_reg_d;



        logic         ena_prcs_a;
        logic         ena_prcs_b;
        logic         ena_prcs_c;
        logic         ena_prcs_d;

        logic         ena_reg_a;
        logic         ena_reg_b;
        logic         ena_reg_c;
        logic         ena_reg_d;

   
        logic         push_result;
        logic         pop_result;
        data_i_t      fifo_result;
		  
		  

    }mxv_st; 

    typedef struct {
        data_uart_t data_reg_a2h;
        data_hex_t  data_hex;
        data_dec_t  data_dec;

        logic   cv_ovf;
        logic   cc_ovf;
        count_t counter;  

        logic   ena_cv;
        logic   ena_cc;
        logic   clear;
        logic   sipo_ena;
        logic   rcv;
        logic   ena_rcv;
        logic   clear_val;
        logic   clear_comm;
        logic   deb;
    }ctrl_st;


    typedef struct{
        logic   clk_baud;
        logic   tx;
        logic   error_uart;

        logic       rcv;
        data_uart_t data;

        logic      push_result;
        logic      pop_result;
        logic      push_vector;
        logic      pop_vector;
        push_pop_t push_matrix;
        push_pop_t pop_matrix;
        val_t      val;
        sltr_4_t   dmx_v_sltr;
        sltr_2_t   mx_reg_sltr; 
        sltr_2_t   mx_a_sltr;
        sltr_2_t   mx_b_sltr;
        sltr_2_t   mx_c_sltr;
        sltr_2_t   mx_d_sltr;

        logic      ena_proc_a;
        logic      ena_proc_b;
        logic      ena_proc_c;
        logic      ena_proc_d;
		  
		  
    }top_mxv_st;
        
endpackage
`endif
