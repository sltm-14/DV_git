onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Test Bench INPUTS}
add wave -noupdate -expand -group INPUTS -color {Yellow Green} /TB_blinking_machine/TB_clk
add wave -noupdate -expand -group INPUTS -color {Yellow Green} /TB_blinking_machine/TB_rst
add wave -noupdate -expand -group INPUTS -color {Yellow Green} /TB_blinking_machine/TB_start
add wave -noupdate -divider {State Machine}
add wave -noupdate -group {STATE MACHINE} -color {Cornflower Blue} /TB_blinking_machine/TOP/SM/i_enable
add wave -noupdate -group {STATE MACHINE} -color {Cornflower Blue} /TB_blinking_machine/TOP/SM/o_out
add wave -noupdate -group {STATE MACHINE} -color {Cornflower Blue} /TB_blinking_machine/TOP/SM/o_flag_counter
add wave -noupdate -group {STATE MACHINE} -color {Cornflower Blue} -radix unsigned /TB_blinking_machine/TOP/SM/o_count_ena
add wave -noupdate -divider Counter
add wave -noupdate -group COUNTER -color Tan /TB_blinking_machine/TOP/COUNT/i_enable
add wave -noupdate -group COUNTER -color Tan -radix unsigned /TB_blinking_machine/TOP/COUNT/i_val
add wave -noupdate -group COUNTER -color Tan -radix unsigned /TB_blinking_machine/TOP/COUNT/l_counter
add wave -noupdate -group COUNTER -color Tan /TB_blinking_machine/TOP/COUNT/o_timeout
add wave -noupdate -divider {Test Bench OUTPUTS}
add wave -noupdate -expand -group OUTPUTS -color {Yellow Green} /TB_blinking_machine/TB_out
add wave -noupdate -expand -group OUTPUTS -color {Yellow Green} /TB_blinking_machine/TB_clk_1hz
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 136
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
WaveRestoreZoom {0 ps} {8192 ps}
