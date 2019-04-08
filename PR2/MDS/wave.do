onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/d0/mdr_itf/w_start
add wave -noupdate /tb/d0/mdr_itf/w_load
add wave -noupdate /tb/d0/mdr_itf/w_error
add wave -noupdate /tb/d0/mdr_itf/w_op
add wave -noupdate /tb/if0/w_enable
add wave -noupdate /tb/d0/mdr_itf/w_init
add wave -noupdate /tb/if0/w_rem_2lsb
add wave -noupdate -radix decimal /tb/d0/REM/r_rem
add wave -noupdate -radix decimal /tb/if0/w_rem_val
add wave -noupdate -radix decimal /tb/d0/MUXRD/mux/w_mux_data_alu
add wave -noupdate -radix decimal /tb/if0/w_mux_rem_alu
add wave -noupdate -radix decimal /tb/d0/mdr_itf/w_alu_rem
add wave -noupdate -radix decimal -childformat {{{/tb/d0/mdr_itf/w_mux_rem[31]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[30]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[29]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[28]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[27]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[26]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[25]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[24]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[23]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[22]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[21]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[20]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[19]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[18]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[17]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[16]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[15]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[14]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[13]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[12]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[11]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[10]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[9]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[8]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[7]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[6]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[5]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[4]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[3]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[2]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[1]} -radix decimal} {{/tb/d0/mdr_itf/w_mux_rem[0]} -radix decimal}} -subitemconfig {{/tb/d0/mdr_itf/w_mux_rem[31]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[30]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[29]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[28]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[27]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[26]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[25]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[24]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[23]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[22]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[21]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[20]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[19]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[18]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[17]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[16]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[15]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[14]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[13]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[12]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[11]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[10]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[9]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[8]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[7]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[6]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[5]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[4]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[3]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[2]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[1]} {-height 15 -radix decimal} {/tb/d0/mdr_itf/w_mux_rem[0]} {-height 15 -radix decimal}} /tb/d0/mdr_itf/w_mux_rem
add wave -noupdate -radix decimal /tb/d0/DATA/data_if/w_val_data
add wave -noupdate -label state /tb/d0/CTRL/r_control.state
add wave -noupdate -label count -radix unsigned /tb/d0/CTRL/r_control.count
add wave -noupdate -radix decimal /tb/d0/DATA/r_data
add wave -noupdate -childformat {{/tb/d0/CTRL/r_control.count -radix unsigned}} -subitemconfig {/tb/d0/CTRL/r_control.count {-height 15 -radix unsigned}} /tb/d0/CTRL/r_control
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {33 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {24 ps} {52 ps}
