onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ms/TB_simulation/i_clk
add wave -noupdate /tb_ms/TB_simulation/i_rst
add wave -noupdate -divider INPUTS
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/i_start
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/i_mltnd_val
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/i_mlter_val
add wave -noupdate -divider CTRL
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/i_start
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/o_load
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/o_ready
add wave -noupdate -expand -group Ctrl /tb_ms/TB_simulation/SM/o_clean
add wave -noupdate -expand -group Ctrl -radix unsigned /tb_ms/TB_simulation/SM/r_control.count
add wave -noupdate -expand -group Ctrl -radix unsigned /tb_ms/TB_simulation/SM/r_control.state
add wave -noupdate -divider ADDER
add wave -noupdate -group Adder -radix unsigned /tb_ms/TB_simulation/ADD/i_enable
add wave -noupdate -group Adder -radix unsigned /tb_ms/TB_simulation/ADD/i_clean
add wave -noupdate -group Adder -radix unsigned /tb_ms/TB_simulation/ADD/i_val
add wave -noupdate -group Adder -radix unsigned /tb_ms/TB_simulation/ADD/o_sum
add wave -noupdate -group Adder -radix unsigned /tb_ms/TB_simulation/ADD/r_product
add wave -noupdate -divider MLTER
add wave -noupdate -group Mlter -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/i_load
add wave -noupdate -group Mlter -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/i_data
add wave -noupdate -group Mlter -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/o_done
add wave -noupdate -group Mlter -radix unsigned /tb_ms/TB_simulation/MULTIPLIER/o_lsb
add wave -noupdate -divider MLTND
add wave -noupdate -group Mltnd -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/i_load
add wave -noupdate -group Mltnd -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/i_data
add wave -noupdate -group Mltnd -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/o_done
add wave -noupdate -group Mltnd -radix unsigned /tb_ms/TB_simulation/MULTIPLICAND/o_data
add wave -noupdate -divider OUTPUTS
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/o_product
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/o_stop
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {27 ps} 0}
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
WaveRestoreZoom {5 ps} {69 ps}
