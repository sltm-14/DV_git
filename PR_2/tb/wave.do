onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ms/TB_simulation/CTRL/r_control.state
add wave -noupdate -divider DIVISION
add wave -noupdate /tb_ms/TB_simulation/DIVISION/clk
add wave -noupdate /tb_ms/TB_simulation/DIVISION/rst
add wave -noupdate /tb_ms/TB_simulation/DIVISION/i_dividend
add wave -noupdate /tb_ms/TB_simulation/DIVISION/i_divisor
add wave -noupdate /tb_ms/TB_simulation/DIVISION/i_enable
add wave -noupdate /tb_ms/TB_simulation/DIVISION/o_ready
add wave -noupdate /tb_ms/TB_simulation/DIVISION/o_remainder
add wave -noupdate /tb_ms/TB_simulation/DIVISION/o_quotation
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/DIVISION/w_count
add wave -noupdate -divider REMAINDER
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/REMAINDER/i_remainder
add wave -noupdate /tb_ms/TB_simulation/DIVISION/REMAINDER/i_enable
add wave -noupdate -radix decimal -childformat {{{/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[7]} -radix decimal} {{/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[6]} -radix decimal} {{/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[5]} -radix decimal} {{/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[4]} -radix decimal} {{/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[3]} -radix decimal} {{/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[2]} -radix decimal} {{/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[1]} -radix decimal} {{/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[0]} -radix decimal}} -subitemconfig {{/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[7]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[6]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[5]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[4]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[3]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[2]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[1]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder[0]} {-height 15 -radix decimal}} /tb_ms/TB_simulation/DIVISION/REMAINDER/o_remainder
add wave -noupdate /tb_ms/TB_simulation/DIVISION/REMAINDER/i_flag
add wave -noupdate /tb_ms/TB_simulation/DIVISION/REMAINDER/o_flag
add wave -noupdate -divider SUB
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/SUB/i_rem
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/SUB/i_div
add wave -noupdate /tb_ms/TB_simulation/DIVISION/SUB/i_flag
add wave -noupdate /tb_ms/TB_simulation/DIVISION/SUB/o_flag
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/SUB/o_sub
add wave -noupdate -divider FULL
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/FULL/i_result
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/FULL/i_remainder
add wave -noupdate /tb_ms/TB_simulation/DIVISION/FULL/i_flag
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/FULL/o_register
add wave -noupdate -divider DIVISOR
add wave -noupdate /tb_ms/TB_simulation/DIVISION/DIVISOR/i_divisor
add wave -noupdate /tb_ms/TB_simulation/DIVISION/DIVISOR/i_flag
add wave -noupdate /tb_ms/TB_simulation/DIVISION/DIVISOR/o_flag
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/DIVISOR/o_divisor
add wave -noupdate -divider QUO
add wave -noupdate /tb_ms/TB_simulation/DIVISION/QUOTATION/i_msb
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/QUOTATION/o_quotation
add wave -noupdate /tb_ms/TB_simulation/DIVISION/QUOTATION/o_msb
add wave -noupdate /tb_ms/TB_simulation/DIVISION/QUOTATION/i_flag
add wave -noupdate /tb_ms/TB_simulation/DIVISION/QUOTATION/o_flag
add wave -noupdate -divider {QUO FULL}
add wave -noupdate /tb_ms/TB_simulation/DIVISION/QUOTATION_ADD/i_msb
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/QUOTATION_ADD/i_quotation
add wave -noupdate /tb_ms/TB_simulation/DIVISION/QUOTATION_ADD/i_flag
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/QUOTATION_ADD/o_quotation
add wave -noupdate -divider COMPARATOR
add wave -noupdate /tb_ms/TB_simulation/DIVISION/COMPARATOR/i_result
add wave -noupdate /tb_ms/TB_simulation/DIVISION/COMPARATOR/o_done
add wave -noupdate -divider COUNTER
add wave -noupdate -radix decimal /tb_ms/TB_simulation/DIVISION/COUNT/o_count
add wave -noupdate /tb_ms/TB_simulation/DIVISION/COUNT/o_ovf
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {91 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {26 ps} {50 ps}
