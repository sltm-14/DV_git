onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUTS
add wave -noupdate /TB_MxV/TOP/clk
add wave -noupdate /TB_MxV/TOP/rst
add wave -noupdate /TB_MxV/TOP/clk_b
add wave -noupdate /TB_MxV/TOP/rcv
add wave -noupdate -radix ascii /TB_MxV/TOP/data
add wave -noupdate -divider ASCCI2HEX
add wave -noupdate -radix ascii /TB_MxV/TOP/CONTROL/ASCII_2_HEX/ascii
add wave -noupdate -radix hexadecimal /TB_MxV/TOP/CONTROL/ASCII_2_HEX/hex
add wave -noupdate -divider HEX2DEC
add wave -noupdate -radix hexadecimal /TB_MxV/TOP/CONTROL/HEX_2_DEC/hex
add wave -noupdate /TB_MxV/TOP/CONTROL/HEX_2_DEC/ena
add wave -noupdate -radix unsigned /TB_MxV/TOP/CONTROL/HEX_2_DEC/rgstr_r
add wave -noupdate /TB_MxV/TOP/CONTROL/HEX_2_DEC/ena_o
add wave -noupdate -radix decimal /TB_MxV/TOP/CONTROL/HEX_2_DEC/dec
add wave -noupdate -divider CTRL
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/cc_ovf
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/clear_comm
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/clear_val
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/clk
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/command
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/counter
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/data
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/dmx_v_sltr
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/ena_cc
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/ena_cv
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/ena_proc_a
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/ena_proc_b
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/ena_proc_c
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/ena_proc_d
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/frame_size
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/mx_a_sltr
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/mx_b_sltr
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/mx_c_sltr
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/mx_d_sltr
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/mx_reg_sltr
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/n
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/pop_matrix
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/pop_result
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/pop_vector
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/push_matrix
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/push_result
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/push_vector
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/rcv
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/rst
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/sipo_ena
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/state
add wave -noupdate /TB_MxV/TOP/CONTROL/CTRL/val
add wave -noupdate -divider COUNT_COMM
add wave -noupdate /TB_MxV/TOP/CONTROL/COUNTER_COMM/i_ena
add wave -noupdate /TB_MxV/TOP/CONTROL/COUNTER_COMM/o_count
add wave -noupdate /TB_MxV/TOP/CONTROL/COUNTER_COMM/o_ovf
add wave -noupdate -divider COUNT_VAL
add wave -noupdate /TB_MxV/TOP/CONTROL/COUNTER_VAL/i_ena
add wave -noupdate /TB_MxV/TOP/CONTROL/COUNTER_VAL/o_count
add wave -noupdate -divider OUTPUTS
add wave -noupdate /TB_MxV/TOP/error
add wave -noupdate /TB_MxV/TOP/result
add wave -noupdate /TB_MxV/TOP/wires
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17 ps} 0}
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
WaveRestoreZoom {0 ps} {46 ps}
