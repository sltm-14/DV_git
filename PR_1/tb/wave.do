onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUTS
add wave -noupdate /tb_ms/TB_simulation/i_clk
add wave -noupdate /tb_ms/TB_simulation/i_rst
add wave -noupdate /tb_ms/TB_simulation/i_start
add wave -noupdate /tb_ms/TB_simulation/i_sw
add wave -noupdate -divider SW
add wave -noupdate /tb_ms/TB_simulation/SW/i_sw
add wave -noupdate /tb_ms/TB_simulation/SW/o_multiplier
add wave -noupdate /tb_ms/TB_simulation/SW/o_multiplicand
add wave -noupdate -divider A2_1
add wave -noupdate /tb_ms/TB_simulation/COMP2_MULTIPLICAND/o_val
add wave -noupdate /tb_ms/TB_simulation/COMP2_MULTIPLICAND/o_sign
add wave -noupdate -divider A2_2
add wave -noupdate /tb_ms/TB_simulation/COMP2_MULTIPLIER/o_val
add wave -noupdate /tb_ms/TB_simulation/COMP2_MULTIPLIER/o_sign
add wave -noupdate -divider SIGN
add wave -noupdate -divider CTRL
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/i_start
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/o_load
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/o_clean
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/r_control.enb
add wave -noupdate -expand -group Ctrl -radix unsigned /tb_ms/TB_simulation/SM/r_control.count
add wave -noupdate -expand -group Ctrl -radix unsigned /tb_ms/TB_simulation/SM/r_control.state
add wave -noupdate -divider ADDER
add wave -noupdate /tb_ms/TB_simulation/SIGN/i_val1
add wave -noupdate /tb_ms/TB_simulation/SIGN/i_val2
add wave -noupdate /tb_ms/TB_simulation/SIGN/r_val1
add wave -noupdate /tb_ms/TB_simulation/SIGN/r_val2
add wave -noupdate /tb_ms/TB_simulation/SIGN/o_val1
add wave -noupdate /tb_ms/TB_simulation/SIGN/o_val2
add wave -noupdate -divider MLTER
add wave -noupdate -radix decimal /tb_ms/TB_simulation/MULTIPLIER/i_load
add wave -noupdate -radix decimal /tb_ms/TB_simulation/MULTIPLIER/i_data
add wave -noupdate -radix decimal /tb_ms/TB_simulation/MULTIPLIER/r_multiplier
add wave -noupdate -radix decimal /tb_ms/TB_simulation/MULTIPLIER/o_lsb
add wave -noupdate -divider MLTND
add wave -noupdate -radix decimal /tb_ms/TB_simulation/MULTIPLICAND/i_load
add wave -noupdate -radix decimal /tb_ms/TB_simulation/MULTIPLICAND/i_data
add wave -noupdate -radix decimal /tb_ms/TB_simulation/MULTIPLICAND/i_stop
add wave -noupdate -radix decimal /tb_ms/TB_simulation/MULTIPLICAND/o_data
add wave -noupdate -divider A2_3
add wave -noupdate -expand -group A2_3 -radix decimal /tb_ms/TB_simulation/COMP2_PRODUCT/i_val
add wave -noupdate -expand -group A2_3 -radix decimal /tb_ms/TB_simulation/COMP2_PRODUCT/i_signA
add wave -noupdate -expand -group A2_3 -radix decimal /tb_ms/TB_simulation/COMP2_PRODUCT/i_signB
add wave -noupdate -expand -group A2_3 -radix decimal /tb_ms/TB_simulation/COMP2_PRODUCT/o_product
add wave -noupdate -expand -group A2_3 -radix decimal /tb_ms/TB_simulation/COMP2_PRODUCT/o_sign
add wave -noupdate -divider OUTPUTS
add wave -noupdate /tb_ms/TB_simulation/i_clk
add wave -noupdate /tb_ms/TB_simulation/i_rst
add wave -noupdate -divider INPUTS
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/i_start
add wave -noupdate /tb_ms/TB_simulation/i_sw
add wave -noupdate -divider SW
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SW/o_multiplicand
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SW/o_multiplier
add wave -noupdate -divider A2_1
add wave -noupdate -radix decimal /tb_ms/TB_simulation/COMP2_MULTIPLICAND/i_val
add wave -noupdate -radix decimal /tb_ms/TB_simulation/COMP2_MULTIPLICAND/o_val
add wave -noupdate -radix decimal /tb_ms/TB_simulation/COMP2_MULTIPLICAND/o_sign
add wave -noupdate -divider A2_2
add wave -noupdate -radix decimal /tb_ms/TB_simulation/COMP2_MULTIPLIER/i_val
add wave -noupdate -radix decimal /tb_ms/TB_simulation/COMP2_MULTIPLIER/o_val
add wave -noupdate -radix decimal /tb_ms/TB_simulation/COMP2_MULTIPLIER/o_sign
add wave -noupdate -divider SIGN
add wave -noupdate /tb_ms/TB_simulation/SIGN/i_load
add wave -noupdate /tb_ms/TB_simulation/SIGN/i_val1
add wave -noupdate /tb_ms/TB_simulation/SIGN/i_val2
add wave -noupdate /tb_ms/TB_simulation/SIGN/o_val1
add wave -noupdate /tb_ms/TB_simulation/SIGN/o_val2
add wave -noupdate -divider CTRL
add wave -noupdate /tb_ms/TB_simulation/SM/i_start
add wave -noupdate /tb_ms/TB_simulation/SM/o_load
add wave -noupdate /tb_ms/TB_simulation/SM/o_clean
add wave -noupdate /tb_ms/TB_simulation/SM/o_ovf
add wave -noupdate /tb_ms/TB_simulation/SM/r_control.ovf
add wave -noupdate /tb_ms/TB_simulation/SM/r_control.state
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SM/r_control.count
add wave -noupdate -divider ADDER
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/i_stop
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/i_enable
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/i_clean
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/i_val
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/o_sum
add wave -noupdate -divider MLTER
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/i_load
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/i_data
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/o_lsb
add wave -noupdate -divider MLTND
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/i_load
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/i_data
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/i_stop
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/o_data
add wave -noupdate -divider A2_3
add wave -noupdate -divider OUTPUTS
add wave -noupdate -radix decimal -childformat {{{/tb_ms/TB_simulation/o_led[18]} -radix decimal} {{/tb_ms/TB_simulation/o_led[17]} -radix decimal} {{/tb_ms/TB_simulation/o_led[16]} -radix decimal} {{/tb_ms/TB_simulation/o_led[15]} -radix decimal} {{/tb_ms/TB_simulation/o_led[14]} -radix decimal} {{/tb_ms/TB_simulation/o_led[13]} -radix decimal} {{/tb_ms/TB_simulation/o_led[12]} -radix decimal} {{/tb_ms/TB_simulation/o_led[11]} -radix decimal} {{/tb_ms/TB_simulation/o_led[10]} -radix decimal} {{/tb_ms/TB_simulation/o_led[9]} -radix decimal} {{/tb_ms/TB_simulation/o_led[8]} -radix decimal} {{/tb_ms/TB_simulation/o_led[7]} -radix decimal} {{/tb_ms/TB_simulation/o_led[6]} -radix decimal} {{/tb_ms/TB_simulation/o_led[5]} -radix decimal} {{/tb_ms/TB_simulation/o_led[4]} -radix decimal} {{/tb_ms/TB_simulation/o_led[3]} -radix decimal} {{/tb_ms/TB_simulation/o_led[2]} -radix decimal} {{/tb_ms/TB_simulation/o_led[1]} -radix decimal} {{/tb_ms/TB_simulation/o_led[0]} -radix decimal}} -subitemconfig {{/tb_ms/TB_simulation/o_led[18]} {-radix decimal} {/tb_ms/TB_simulation/o_led[17]} {-radix decimal} {/tb_ms/TB_simulation/o_led[16]} {-radix decimal} {/tb_ms/TB_simulation/o_led[15]} {-radix decimal} {/tb_ms/TB_simulation/o_led[14]} {-radix decimal} {/tb_ms/TB_simulation/o_led[13]} {-radix decimal} {/tb_ms/TB_simulation/o_led[12]} {-radix decimal} {/tb_ms/TB_simulation/o_led[11]} {-radix decimal} {/tb_ms/TB_simulation/o_led[10]} {-radix decimal} {/tb_ms/TB_simulation/o_led[9]} {-radix decimal} {/tb_ms/TB_simulation/o_led[8]} {-radix decimal} {/tb_ms/TB_simulation/o_led[7]} {-radix decimal} {/tb_ms/TB_simulation/o_led[6]} {-radix decimal} {/tb_ms/TB_simulation/o_led[5]} {-radix decimal} {/tb_ms/TB_simulation/o_led[4]} {-radix decimal} {/tb_ms/TB_simulation/o_led[3]} {-radix decimal} {/tb_ms/TB_simulation/o_led[2]} {-radix decimal} {/tb_ms/TB_simulation/o_led[1]} {-radix decimal} {/tb_ms/TB_simulation/o_led[0]} {-radix decimal}} /tb_ms/TB_simulation/o_led
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/o_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {47 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 141
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
WaveRestoreZoom {42 ps} {89 ps}
