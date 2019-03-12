onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ms/TB_simulation/i_clk
add wave -noupdate /tb_ms/TB_simulation/i_rst
add wave -noupdate -divider INPUTS
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/i_start
add wave -noupdate /tb_ms/TB_simulation/i_sw
add wave -noupdate -divider SW
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/SW/o_multiplier
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/SW/o_multiplicand
add wave -noupdate -divider CTRL
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/i_start
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/o_load
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/o_ready
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/o_clean
add wave -noupdate -expand -group Ctrl -radix unsigned /tb_ms/TB_simulation/SM/r_control.count
add wave -noupdate -expand -group Ctrl -radix unsigned /tb_ms/TB_simulation/SM/r_control.state
add wave -noupdate -divider ADDER
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/i_stop
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/i_enable
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/i_clean
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/i_val
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/ADDER/o_sum
add wave -noupdate -divider MLTER
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/i_load
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/i_data
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/o_done
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/o_lsb
add wave -noupdate -divider MLTND
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/i_load
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/i_data
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/i_stop
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/o_data
add wave -noupdate -divider OUTPUTS
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/o_led
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/o_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49 ps} 0}
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
WaveRestoreZoom {40 ps} {104 ps}
