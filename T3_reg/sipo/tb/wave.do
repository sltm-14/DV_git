onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_sipo_right/clk
add wave -noupdate /tb_sipo_right/rst
add wave -noupdate /tb_sipo_right/enb
add wave -noupdate /tb_sipo_right/inp
add wave -noupdate /tb_sipo_right/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 91
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
WaveRestoreZoom {0 ps} {42 ps}
