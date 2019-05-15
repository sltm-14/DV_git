onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb_ms/MDR/clk
add wave -noupdate -radix decimal /tb_ms/MDR/rst
add wave -noupdate -divider INPUTS-MDR
add wave -noupdate -radix decimal /tb_ms/MDR/i_start
add wave -noupdate -radix decimal /tb_ms/MDR/i_load
add wave -noupdate -radix decimal /tb_ms/MDR/i_data
add wave -noupdate -radix decimal /tb_ms/MDR/i_op
add wave -noupdate -divider CTRL
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/clk
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/rst
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/i_start
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/i_load
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/i_error
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/i_done
add wave -noupdate -radix decimal -childformat {{/tb_ms/MDR/CTRL/r_control.clean -radix decimal} {/tb_ms/MDR/CTRL/r_control.load_x -radix decimal} {/tb_ms/MDR/CTRL/r_control.load_y -radix decimal} {/tb_ms/MDR/CTRL/r_control.save_x -radix decimal} {/tb_ms/MDR/CTRL/r_control.save_y -radix decimal} {/tb_ms/MDR/CTRL/r_control.veri -radix decimal} {/tb_ms/MDR/CTRL/r_control.error -radix decimal} {/tb_ms/MDR/CTRL/r_control.enable -radix decimal} {/tb_ms/MDR/CTRL/r_control.ready -radix decimal} {/tb_ms/MDR/CTRL/r_control.init -radix decimal} {/tb_ms/MDR/CTRL/r_control.state -radix decimal}} -expand -subitemconfig {/tb_ms/MDR/CTRL/r_control.clean {-radix decimal} /tb_ms/MDR/CTRL/r_control.load_x {-radix decimal} /tb_ms/MDR/CTRL/r_control.load_y {-radix decimal} /tb_ms/MDR/CTRL/r_control.save_x {-radix decimal} /tb_ms/MDR/CTRL/r_control.save_y {-radix decimal} /tb_ms/MDR/CTRL/r_control.veri {-radix decimal} /tb_ms/MDR/CTRL/r_control.error {-radix decimal} /tb_ms/MDR/CTRL/r_control.enable {-radix decimal} /tb_ms/MDR/CTRL/r_control.ready {-radix decimal} /tb_ms/MDR/CTRL/r_control.init {-radix decimal} /tb_ms/MDR/CTRL/r_control.state {-radix decimal}} /tb_ms/MDR/CTRL/r_control
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_clean
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_save_x
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_save_y
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_load_x
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_load_y
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_veri
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_error
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_enable
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_ready
add wave -noupdate -radix decimal /tb_ms/MDR/CTRL/o_init
add wave -noupdate -divider OUTPUTS-MDR
add wave -noupdate -radix decimal /tb_ms/MDR/o_reminder
add wave -noupdate -radix decimal -childformat {{{/tb_ms/MDR/o_result[31]} -radix decimal} {{/tb_ms/MDR/o_result[30]} -radix decimal} {{/tb_ms/MDR/o_result[29]} -radix decimal} {{/tb_ms/MDR/o_result[28]} -radix decimal} {{/tb_ms/MDR/o_result[27]} -radix decimal} {{/tb_ms/MDR/o_result[26]} -radix decimal} {{/tb_ms/MDR/o_result[25]} -radix decimal} {{/tb_ms/MDR/o_result[24]} -radix decimal} {{/tb_ms/MDR/o_result[23]} -radix decimal} {{/tb_ms/MDR/o_result[22]} -radix decimal} {{/tb_ms/MDR/o_result[21]} -radix decimal} {{/tb_ms/MDR/o_result[20]} -radix decimal} {{/tb_ms/MDR/o_result[19]} -radix decimal} {{/tb_ms/MDR/o_result[18]} -radix decimal} {{/tb_ms/MDR/o_result[17]} -radix decimal} {{/tb_ms/MDR/o_result[16]} -radix decimal} {{/tb_ms/MDR/o_result[15]} -radix decimal} {{/tb_ms/MDR/o_result[14]} -radix decimal} {{/tb_ms/MDR/o_result[13]} -radix decimal} {{/tb_ms/MDR/o_result[12]} -radix decimal} {{/tb_ms/MDR/o_result[11]} -radix decimal} {{/tb_ms/MDR/o_result[10]} -radix decimal} {{/tb_ms/MDR/o_result[9]} -radix decimal} {{/tb_ms/MDR/o_result[8]} -radix decimal} {{/tb_ms/MDR/o_result[7]} -radix decimal} {{/tb_ms/MDR/o_result[6]} -radix decimal} {{/tb_ms/MDR/o_result[5]} -radix decimal} {{/tb_ms/MDR/o_result[4]} -radix decimal} {{/tb_ms/MDR/o_result[3]} -radix decimal} {{/tb_ms/MDR/o_result[2]} -radix decimal} {{/tb_ms/MDR/o_result[1]} -radix decimal} {{/tb_ms/MDR/o_result[0]} -radix decimal}} -subitemconfig {{/tb_ms/MDR/o_result[31]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[30]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[29]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[28]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[27]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[26]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[25]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[24]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[23]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[22]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[21]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[20]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[19]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[18]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[17]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[16]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[15]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[14]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[13]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[12]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[11]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[10]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[9]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[8]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[7]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[6]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[5]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[4]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[3]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[2]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[1]} {-height 15 -radix decimal} {/tb_ms/MDR/o_result[0]} {-height 15 -radix decimal}} /tb_ms/MDR/o_result
add wave -noupdate -radix decimal /tb_ms/MDR/o_ready
add wave -noupdate -radix decimal /tb_ms/MDR/o_load_x
add wave -noupdate -radix decimal /tb_ms/MDR/o_load_y
add wave -noupdate -radix decimal /tb_ms/MDR/o_error
add wave -noupdate -radix decimal /tb_ms/MDR/o_remainder
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {24 ps} 0}
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
WaveRestoreZoom {0 ps} {464 ps}
