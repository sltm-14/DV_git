onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUTS
add wave -noupdate /TB_MxV/CTRL_TOP/clk
add wave -noupdate /TB_MxV/CTRL_TOP/rst
add wave -noupdate /TB_MxV/CTRL_TOP/rcv
add wave -noupdate -radix ascii /TB_MxV/CTRL_TOP/data
add wave -noupdate -divider ASCCI2HEX
add wave -noupdate -radix ascii /TB_MxV/CTRL_TOP/ASCII_2_HEX/ascii
add wave -noupdate -radix hexadecimal -childformat {{{/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[4]} -radix hexadecimal} {{/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[3]} -radix hexadecimal} {{/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[2]} -radix hexadecimal} {{/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[1]} -radix hexadecimal} {{/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[0]} -radix hexadecimal}} -subitemconfig {{/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[4]} {-height 15 -radix hexadecimal} {/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[3]} {-height 15 -radix hexadecimal} {/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[2]} {-height 15 -radix hexadecimal} {/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[1]} {-height 15 -radix hexadecimal} {/TB_MxV/CTRL_TOP/ASCII_2_HEX/hex[0]} {-height 15 -radix hexadecimal}} /TB_MxV/CTRL_TOP/ASCII_2_HEX/hex
add wave -noupdate -divider HEX2DEC
add wave -noupdate /TB_MxV/CTRL_TOP/HEX_2_DEC/ena
add wave -noupdate -radix hexadecimal /TB_MxV/CTRL_TOP/HEX_2_DEC/hex
add wave -noupdate -radix unsigned /TB_MxV/CTRL_TOP/HEX_2_DEC/dec
add wave -noupdate /TB_MxV/CTRL_TOP/HEX_2_DEC/ena_o
add wave -noupdate -divider CTRL
add wave -noupdate /TB_MxV/CTRL_TOP/CTRL/rcv
add wave -noupdate /TB_MxV/CTRL_TOP/CTRL/cc_ovf
add wave -noupdate -radix unsigned /TB_MxV/CTRL_TOP/CTRL/data
add wave -noupdate -color Yellow -radix unsigned /TB_MxV/CTRL_TOP/CTRL/n
add wave -noupdate -color Salmon /TB_MxV/CTRL_TOP/CTRL/state
add wave -noupdate -color Yellow /TB_MxV/CTRL_TOP/CTRL/command
add wave -noupdate -color Yellow -radix unsigned /TB_MxV/CTRL_TOP/CTRL/frame_size
add wave -noupdate -radix unsigned /TB_MxV/CTRL_TOP/CTRL/counter
add wave -noupdate /TB_MxV/CTRL_TOP/CTRL/ena_cv
add wave -noupdate /TB_MxV/CTRL_TOP/CTRL/ena_cc
add wave -noupdate /TB_MxV/CTRL_TOP/CTRL/sipo_ena
add wave -noupdate -divider COUNT_COMM
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_COMM/clk
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_COMM/rst
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_COMM/i_ena
add wave -noupdate -radix unsigned /TB_MxV/CTRL_TOP/COUNTER_COMM/r_count
add wave -noupdate -radix unsigned /TB_MxV/CTRL_TOP/COUNTER_COMM/o_count
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_COMM/o_ovf
add wave -noupdate -divider COUNT_VAL
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_VAL/clk
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_VAL/rst
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_VAL/i_clear
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_VAL/i_ena
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_VAL/o_count
add wave -noupdate /TB_MxV/CTRL_TOP/COUNTER_VAL/r_count
add wave -noupdate -divider OUTPUTS
add wave -noupdate /TB_MxV/CTRL_TOP/push_result
add wave -noupdate /TB_MxV/CTRL_TOP/pop_result
add wave -noupdate /TB_MxV/CTRL_TOP/push_vector
add wave -noupdate /TB_MxV/CTRL_TOP/pop_vector
add wave -noupdate /TB_MxV/CTRL_TOP/push_matrix
add wave -noupdate /TB_MxV/CTRL_TOP/pop_matrix
add wave -noupdate /TB_MxV/CTRL_TOP/val
add wave -noupdate /TB_MxV/CTRL_TOP/dmx_val_sltr
add wave -noupdate /TB_MxV/CTRL_TOP/dmx_a_sltr
add wave -noupdate /TB_MxV/CTRL_TOP/dmx_b_sltr
add wave -noupdate /TB_MxV/CTRL_TOP/dmx_c_sltr
add wave -noupdate /TB_MxV/CTRL_TOP/dmx_d_sltr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {228 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 104
configure wave -valuecolwidth 40
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
WaveRestoreZoom {126 ps} {310 ps}
