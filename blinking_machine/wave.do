onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_blinking_machine/TOP/SM/i_start
add wave -noupdate /TB_blinking_machine/TOP/SM/i_ena
add wave -noupdate /TB_blinking_machine/TOP/SM/o_out
add wave -noupdate /TB_blinking_machine/TOP/SM/o_count_ena
add wave -noupdate /TB_blinking_machine/TOP/SM/state
add wave -noupdate /TB_blinking_machine/TOP/SM/next_state
add wave -noupdate /TB_blinking_machine/TOP/SM/l_out
add wave -noupdate /TB_blinking_machine/TOP/SM/l_count_ena
add wave -noupdate -divider SM_blinking
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2945 ps} 0}
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
WaveRestoreZoom {0 ps} {8 ns}
