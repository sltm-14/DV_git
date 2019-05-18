onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider MDR
add wave -noupdate /tb_ms/TB_simulation/clk
add wave -noupdate /tb_ms/TB_simulation/rst
add wave -noupdate /tb_ms/TB_simulation/i_start
add wave -noupdate /tb_ms/TB_simulation/i_load
add wave -noupdate /tb_ms/TB_simulation/i_data
add wave -noupdate /tb_ms/TB_simulation/i_op
add wave -noupdate /tb_ms/TB_simulation/o_ready
add wave -noupdate /tb_ms/TB_simulation/o_load_x
add wave -noupdate /tb_ms/TB_simulation/o_load_y
add wave -noupdate /tb_ms/TB_simulation/o_error
add wave -noupdate /tb_ms/TB_simulation/o_result
add wave -noupdate /tb_ms/TB_simulation/o_remainder
add wave -noupdate -divider {PIPO X}
add wave -noupdate /tb_ms/TB_simulation/PIPO_X/i_ena
add wave -noupdate /tb_ms/TB_simulation/PIPO_X/i_data
add wave -noupdate /tb_ms/TB_simulation/PIPO_X/o_data
add wave -noupdate -divider {PIPO Y}
add wave -noupdate /tb_ms/TB_simulation/PIPO_Y/i_ena
add wave -noupdate /tb_ms/TB_simulation/PIPO_Y/i_data
add wave -noupdate /tb_ms/TB_simulation/PIPO_Y/o_data
add wave -noupdate -divider CONTROL
add wave -noupdate /tb_ms/TB_simulation/CTRL/clk
add wave -noupdate /tb_ms/TB_simulation/CTRL/rst
add wave -noupdate /tb_ms/TB_simulation/CTRL/i_start
add wave -noupdate /tb_ms/TB_simulation/CTRL/i_load
add wave -noupdate /tb_ms/TB_simulation/CTRL/i_error1
add wave -noupdate /tb_ms/TB_simulation/CTRL/i_error2
add wave -noupdate /tb_ms/TB_simulation/CTRL/i_done
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_clean
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_save_x
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_save_y
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_load_x
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_load_y
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_veri
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_veri2
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_error
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_enable
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_ready
add wave -noupdate /tb_ms/TB_simulation/CTRL/o_init
add wave -noupdate -expand /tb_ms/TB_simulation/CTRL/r_control
add wave -noupdate -divider {VERIFICATION 1}
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION/i_enable
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION/i_dataX
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION/i_dataY
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION/i_op
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION/o_error
add wave -noupdate -divider CORE
add wave -noupdate /tb_ms/TB_simulation/CORE/clk
add wave -noupdate /tb_ms/TB_simulation/CORE/rst
add wave -noupdate /tb_ms/TB_simulation/CORE/i_enable
add wave -noupdate /tb_ms/TB_simulation/CORE/i_init
add wave -noupdate /tb_ms/TB_simulation/CORE/i_clean
add wave -noupdate /tb_ms/TB_simulation/CORE/i_dataX
add wave -noupdate /tb_ms/TB_simulation/CORE/i_dataY
add wave -noupdate /tb_ms/TB_simulation/CORE/i_op
add wave -noupdate /tb_ms/TB_simulation/CORE/o_done
add wave -noupdate /tb_ms/TB_simulation/CORE/o_result
add wave -noupdate /tb_ms/TB_simulation/CORE/o_remainder
add wave -noupdate -divider VERIFICATION2
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION2/i_enable
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION2/i_result
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION2/i_remainder
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION2/o_result
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION2/o_remainder
add wave -noupdate /tb_ms/TB_simulation/VERIFICATION2/o_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {31 ps} 0}
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
WaveRestoreZoom {29 ps} {53 ps}
