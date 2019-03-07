onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ms/TOP/SM/i_clk
add wave -noupdate /tb_ms/TOP/SM/i_rst
add wave -noupdate /tb_ms/TOP/SM/i_start
add wave -noupdate -radix unsigned /tb_ms/TOP/i_multd_val
add wave -noupdate -radix unsigned /tb_ms/TOP/i_multr_val
add wave -noupdate -divider CTRL
add wave -noupdate /tb_ms/TOP/SM/i_lsb
add wave -noupdate -radix unsigned /tb_ms/TOP/SM/r_count
add wave -noupdate /tb_ms/TOP/SM/state
add wave -noupdate /tb_ms/TOP/SM/o_load
add wave -noupdate /tb_ms/TOP/SM/o_add
add wave -noupdate /tb_ms/TOP/SM/o_shift
add wave -noupdate /tb_ms/TOP/SM/o_stop
add wave -noupdate /tb_ms/TOP/SM/state
add wave -noupdate -divider MLTD
add wave -noupdate /tb_ms/TOP/MULTIPLICAND/i_load
add wave -noupdate -radix unsigned /tb_ms/TOP/MULTIPLICAND/i_data
add wave -noupdate -radix unsigned /tb_ms/TOP/MULTIPLICAND/o_out
add wave -noupdate -divider ADD
add wave -noupdate -radix unsigned /tb_ms/TOP/R_ADD/i_valA
add wave -noupdate -radix unsigned /tb_ms/TOP/R_ADD/i_valB
add wave -noupdate -radix unsigned /tb_ms/TOP/R_ADD/o_sum
add wave -noupdate /tb_ms/TOP/R_ADD/o_carry
add wave -noupdate -divider MLTR
add wave -noupdate -radix unsigned /tb_ms/TOP/MULTIPLIER/i_val
add wave -noupdate /tb_ms/TOP/MULTIPLIER/i_load
add wave -noupdate /tb_ms/TOP/MULTIPLIER/i_shift
add wave -noupdate /tb_ms/TOP/MULTIPLIER/i_add
add wave -noupdate -radix unsigned /tb_ms/TOP/MULTIPLIER/i_sum
add wave -noupdate /tb_ms/TOP/MULTIPLIER/o_lsb
add wave -noupdate -radix unsigned /tb_ms/TOP/MULTIPLIER/o_rc
add wave -noupdate -radix unsigned /tb_ms/TOP/MULTIPLIER/o_rb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16 ps} 0}
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
WaveRestoreZoom {0 ps} {68 ps}
