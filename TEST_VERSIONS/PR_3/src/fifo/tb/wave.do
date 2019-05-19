onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUTS
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/rst
add wave -noupdate -radix unsigned -childformat {{{/TB_fifo/TOP_FIFO_RAM/data_i[4]} -radix decimal} {{/TB_fifo/TOP_FIFO_RAM/data_i[3]} -radix decimal} {{/TB_fifo/TOP_FIFO_RAM/data_i[2]} -radix decimal} {{/TB_fifo/TOP_FIFO_RAM/data_i[1]} -radix decimal} {{/TB_fifo/TOP_FIFO_RAM/data_i[0]} -radix decimal}} -subitemconfig {{/TB_fifo/TOP_FIFO_RAM/data_i[4]} {-height 15 -radix decimal} {/TB_fifo/TOP_FIFO_RAM/data_i[3]} {-height 15 -radix decimal} {/TB_fifo/TOP_FIFO_RAM/data_i[2]} {-height 15 -radix decimal} {/TB_fifo/TOP_FIFO_RAM/data_i[1]} {-height 15 -radix decimal} {/TB_fifo/TOP_FIFO_RAM/data_i[0]} {-height 15 -radix decimal}} /TB_fifo/TOP_FIFO_RAM/data_i
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/clk_wr
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/push
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/clk_rd
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/pop
add wave -noupdate -divider OUTPUTS
add wave -noupdate -color {Cornflower Blue} -radix decimal /TB_fifo/TOP_FIFO_RAM/POINTER_WR/head_r
add wave -noupdate -color {Cornflower Blue} -radix decimal /TB_fifo/TOP_FIFO_RAM/POINTER_RD/tail_r
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/data_o
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/empty
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/full
add wave -noupdate -divider POINT-WR
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/POINTER_WR/clk
add wave -noupdate -color Plum /TB_fifo/TOP_FIFO_RAM/POINTER_WR/push
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/POINTER_WR/full_flag
add wave -noupdate -color Khaki -radix decimal /TB_fifo/TOP_FIFO_RAM/POINTER_WR/head_r
add wave -noupdate -color {Medium Aquamarine} /TB_fifo/TOP_FIFO_RAM/POINTER_WR/ena_wr
add wave -noupdate -color {Medium Aquamarine} -radix decimal /TB_fifo/TOP_FIFO_RAM/POINTER_WR/addr_wr
add wave -noupdate -color {Medium Aquamarine} /TB_fifo/TOP_FIFO_RAM/POINTER_WR/led_error
add wave -noupdate -divider POINT-RD
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/POINTER_RD/clk
add wave -noupdate -color Plum /TB_fifo/TOP_FIFO_RAM/POINTER_RD/pop
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/POINTER_RD/empty_flag
add wave -noupdate -color Khaki -radix decimal /TB_fifo/TOP_FIFO_RAM/POINTER_RD/tail_r
add wave -noupdate -color {Medium Aquamarine} /TB_fifo/TOP_FIFO_RAM/POINTER_RD/ena_rd
add wave -noupdate -color {Medium Aquamarine} -radix decimal /TB_fifo/TOP_FIFO_RAM/POINTER_RD/addr_rd
add wave -noupdate -color {Medium Aquamarine} /TB_fifo/TOP_FIFO_RAM/POINTER_RD/led_error
add wave -noupdate -divider RAM
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/RAM/clk_wr
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/RAM/clk_rd
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/RAM/en_wr
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/RAM/en_rd
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/RAM/data_wr
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/RAM/addr_wr
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/RAM/addr_dr
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/RAM/ram
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/RAM/data_rd
add wave -noupdate -divider SYNCH-FULL
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/clk
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/rst
add wave -noupdate -radix unsigned -childformat {{{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[11]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[10]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[9]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[8]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[7]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[6]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[5]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[4]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[3]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[2]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[1]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[0]} -radix unsigned}} -subitemconfig {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[11]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[10]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[9]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[8]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[7]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[6]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[5]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[4]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[3]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[2]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[1]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1[0]} {-height 15 -radix unsigned}} /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_1
add wave -noupdate -radix unsigned -childformat {{{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[11]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[10]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[9]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[8]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[7]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[6]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[5]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[4]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[3]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[2]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[1]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[0]} -radix unsigned}} -subitemconfig {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[11]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[10]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[9]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[8]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[7]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[6]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[5]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[4]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[3]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[2]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[1]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2[0]} {-height 15 -radix unsigned}} /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/addr_2
add wave -noupdate -divider B2G
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/bin
add wave -noupdate -radix unsigned -childformat {{{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[11]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[10]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[9]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[8]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[7]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[6]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[5]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[4]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[3]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[2]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[1]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[0]} -radix unsigned}} -subitemconfig {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[11]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[10]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[9]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[8]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[7]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[6]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[5]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[4]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[3]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[2]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[1]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray[0]} {-height 15 -radix unsigned}} /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/BIN2GRAY_EMPTY/gray
add wave -noupdate -divider DUAL-FF
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/clk
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/rst
add wave -noupdate -radix unsigned -childformat {{{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[11]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[10]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[9]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[8]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[7]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[6]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[5]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[4]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[3]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[2]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[1]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[0]} -radix unsigned}} -subitemconfig {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[11]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[10]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[9]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[8]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[7]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[6]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[5]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[4]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[3]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[2]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[1]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in[0]} {-height 15 -radix unsigned}} /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/in
add wave -noupdate -radix unsigned -childformat {{{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[11]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[10]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[9]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[8]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[7]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[6]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[5]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[4]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[3]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[2]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[1]} -radix unsigned} {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[0]} -radix unsigned}} -subitemconfig {{/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[11]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[10]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[9]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[8]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[7]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[6]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[5]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[4]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[3]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[2]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[1]} {-height 15 -radix unsigned} {/TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r[0]} {-height 15 -radix unsigned}} /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/ff_d_r
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/out
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_1/clk
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_2/in
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_2/ff_d_r
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/DUAL_FF_EMPTY/FF_D_2/out
add wave -noupdate -divider G2B
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/GRAY2BIN_EMPTY/gray
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/GRAY2BIN_EMPTY/bin
add wave -noupdate -divider COMP
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/COMP_EMPTY/val_a_i
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/COMP_EMPTY/val_b_i
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/COMP_EMPTY/flag_o
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_FULL/flag
add wave -noupdate -divider SYNCH-EMPTY
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_EMPTY/clk
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_EMPTY/rst
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_EMPTY/addr_1
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_EMPTY/addr_2
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/SYNCH_EMPTY/flag
add wave -noupdate -divider OUTPUTS
add wave -noupdate -radix unsigned /TB_fifo/TOP_FIFO_RAM/data_o
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/empty
add wave -noupdate /TB_fifo/TOP_FIFO_RAM/full
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {205 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 106
configure wave -valuecolwidth 50
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {106 ps} {263 ps}
