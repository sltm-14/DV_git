onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUTS
add wave -noupdate /tb_piso_lsb/clk
add wave -noupdate /tb_piso_lsb/rst
add wave -noupdate /tb_piso_lsb/enb
add wave -noupdate /tb_piso_lsb/l_s
add wave -noupdate /tb_piso_lsb/inp
add wave -noupdate -divider OUTPUTS
add wave -noupdate /tb_piso_lsb/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {88481 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 110
configure wave -valuecolwidth 57
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
WaveRestoreZoom {0 ps} {145804 ps}
