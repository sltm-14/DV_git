onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUT
add wave -noupdate -radix decimal /TB_bcd_7seg/TOP/in_Bin
add wave -noupdate -divider A2_COM
add wave -noupdate -radix decimal /TB_bcd_7seg/TOP/A2_COM/i_Val
add wave -noupdate -radix decimal /TB_bcd_7seg/TOP/A2_COM/o_Val
add wave -noupdate -radix decimal /TB_bcd_7seg/TOP/A2_COM/o_Signo
add wave -noupdate -divider OTHT
add wave -noupdate -radix decimal /TB_bcd_7seg/TOP/OTHT/i_Bin
add wave -noupdate -radix hexadecimal /TB_bcd_7seg/TOP/OTHT/o_Full_Val
add wave -noupdate -divider OUTPUT
add wave -noupdate -expand /TB_bcd_7seg/TOP/out_displays
add wave -noupdate /TB_bcd_7seg/TOP/out_Signo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 108
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
WaveRestoreZoom {0 ps} {20 ps}
