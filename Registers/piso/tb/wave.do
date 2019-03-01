onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {CTRL INPUTS}
add wave -noupdate /tb_usr/USR/clock
add wave -noupdate /tb_usr/USR/reset
add wave -noupdate /tb_usr/USR/enb
add wave -noupdate -divider INPUTS
add wave -noupdate -radix unsigned /tb_usr/selector
add wave -noupdate /tb_usr/i_serialLeft
add wave -noupdate /tb_usr/i_serialRight
add wave -noupdate /tb_usr/i_parallel
add wave -noupdate -divider OUTPUTS
add wave -noupdate -expand /tb_usr/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {110 ps}
