onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ms/TB_simulation/clk
add wave -noupdate /tb_ms/TB_simulation/rst
add wave -noupdate -divider INPUTS
add wave -noupdate /tb_ms/TB_simulation/i_start
add wave -noupdate /tb_ms/TB_simulation/i_op
add wave -noupdate /tb_ms/TB_simulation/i_load
add wave -noupdate -radix decimal /tb_ms/TB_simulation/i_data
add wave -noupdate -divider CTRL
add wave -noupdate /tb_ms/TB_simulation/CTRL/r_control.state
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/r_control.state
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/i_start
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/i_ovf
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/i_load
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/i_error
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_veri
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_ready
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_load_y
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_load_x
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_save_x
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_save_y
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_init
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_error_sig
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_enable
add wave -noupdate -group Ctrl /tb_ms/TB_simulation/CTRL/o_clean
add wave -noupdate -divider PIPO_X
add wave -noupdate -group PIPO_X /tb_ms/TB_simulation/PIPO_X/i_ena
add wave -noupdate -group PIPO_X -radix decimal /tb_ms/TB_simulation/PIPO_X/i_data
add wave -noupdate -group PIPO_X -radix decimal /tb_ms/TB_simulation/PIPO_X/r_data
add wave -noupdate -group PIPO_X -radix decimal /tb_ms/TB_simulation/PIPO_X/o_data
add wave -noupdate -divider PIPO_Y
add wave -noupdate -group PIPO_Y /tb_ms/TB_simulation/PIPO_Y/i_ena
add wave -noupdate -group PIPO_Y -radix decimal /tb_ms/TB_simulation/PIPO_Y/i_data
add wave -noupdate -group PIPO_Y -radix decimal /tb_ms/TB_simulation/PIPO_Y/r_data
add wave -noupdate -group PIPO_Y -radix decimal /tb_ms/TB_simulation/PIPO_Y/o_data
add wave -noupdate -divider A
add wave -noupdate -group A -radix decimal /tb_ms/TB_simulation/MUX_ALU_A/i_sltr
add wave -noupdate -group A -radix decimal -childformat {{{/tb_ms/TB_simulation/MUX_ALU_A/i_buses[3]} -radix decimal} {{/tb_ms/TB_simulation/MUX_ALU_A/i_buses[2]} -radix decimal} {{/tb_ms/TB_simulation/MUX_ALU_A/i_buses[1]} -radix decimal} {{/tb_ms/TB_simulation/MUX_ALU_A/i_buses[0]} -radix decimal}} -subitemconfig {{/tb_ms/TB_simulation/MUX_ALU_A/i_buses[3]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/MUX_ALU_A/i_buses[2]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/MUX_ALU_A/i_buses[1]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/MUX_ALU_A/i_buses[0]} {-height 15 -radix decimal}} /tb_ms/TB_simulation/MUX_ALU_A/i_buses
add wave -noupdate -group A -radix decimal /tb_ms/TB_simulation/MUX_ALU_A/o_bus
add wave -noupdate -divider B
add wave -noupdate -group B -radix decimal /tb_ms/TB_simulation/MUX_ALU_B/i_sltr
add wave -noupdate -group B -radix decimal -childformat {{{/tb_ms/TB_simulation/MUX_ALU_B/i_buses[3]} -radix decimal} {{/tb_ms/TB_simulation/MUX_ALU_B/i_buses[2]} -radix decimal} {{/tb_ms/TB_simulation/MUX_ALU_B/i_buses[1]} -radix decimal} {{/tb_ms/TB_simulation/MUX_ALU_B/i_buses[0]} -radix decimal}} -subitemconfig {{/tb_ms/TB_simulation/MUX_ALU_B/i_buses[3]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/MUX_ALU_B/i_buses[2]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/MUX_ALU_B/i_buses[1]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/MUX_ALU_B/i_buses[0]} {-height 15 -radix decimal}} /tb_ms/TB_simulation/MUX_ALU_B/i_buses
add wave -noupdate -group B -radix decimal /tb_ms/TB_simulation/MUX_ALU_B/o_bus
add wave -noupdate -divider OP-SEL
add wave -noupdate /tb_ms/TB_simulation/MUX_ALU_OP/i_buses
add wave -noupdate -radix unsigned -childformat {{{/tb_ms/TB_simulation/MUX_ALU_OP/i_sltr[1]} -radix decimal} {{/tb_ms/TB_simulation/MUX_ALU_OP/i_sltr[0]} -radix decimal}} -subitemconfig {{/tb_ms/TB_simulation/MUX_ALU_OP/i_sltr[1]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/MUX_ALU_OP/i_sltr[0]} {-height 15 -radix decimal}} /tb_ms/TB_simulation/MUX_ALU_OP/i_sltr
add wave -noupdate /tb_ms/TB_simulation/MUX_ALU_OP/o_bus
add wave -noupdate -divider OP-ROOT
add wave -noupdate -color Salmon /tb_ms/TB_simulation/CTRL/r_control.state
add wave -noupdate -color Coral -radix decimal /tb_ms/TB_simulation/SR/OPCALCROOT/i_init
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/OPCALCROOT/i_r_msb
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/OPCALCROOT/o_op_val
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/OPCALCROOT/o_or_alu
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/OPCALCROOT/o_or_q
add wave -noupdate -divider ALU
add wave -noupdate -color Gray60 -radix unsigned /tb_ms/TB_simulation/SR/DATA/i_counter
add wave -noupdate -color {Dark Orchid} -radix decimal /tb_ms/TB_simulation/SR/o_root_op
add wave -noupdate -radix decimal /tb_ms/TB_simulation/ALU/i_val_a
add wave -noupdate -radix decimal /tb_ms/TB_simulation/ALU/i_val_b
add wave -noupdate /tb_ms/TB_simulation/ALU/i_sltr
add wave -noupdate -radix decimal /tb_ms/TB_simulation/ALU/o_val
add wave -noupdate -divider ROOT_I
add wave -noupdate -color Coral /tb_ms/TB_simulation/CTRL/r_control.state
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/i_alu_result
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/i_enable
add wave -noupdate -color Coral -radix decimal /tb_ms/TB_simulation/SR/i_init
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/i_val_x
add wave -noupdate -divider ROOT_O
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/o_root_alu_a
add wave -noupdate -color Gray60 -label OR-op -radix decimal /tb_ms/TB_simulation/SR/OR_QS_OP_ALU/i_val_b
add wave -noupdate -color Gray60 -label OR-shift -radix decimal /tb_ms/TB_simulation/SR/OR_QS_OP_ALU/i_val_a
add wave -noupdate -color Gray60 -label OR-val-for-alu -radix decimal /tb_ms/TB_simulation/SR/OR_QS_OP_ALU/o_val
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/o_root_alu_b
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/o_root_op
add wave -noupdate -divider D_I
add wave -noupdate /tb_ms/TB_simulation/SR/DATA/i_enable
add wave -noupdate -color Coral /tb_ms/TB_simulation/SR/DATA/i_init
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/DATA/i_val
add wave -noupdate -divider D_O
add wave -noupdate -color Gray60 -radix unsigned /tb_ms/TB_simulation/SR/DATA/i_counter
add wave -noupdate -color Gold -radix decimal /tb_ms/TB_simulation/SR/DATA/o_val
add wave -noupdate -divider R_I
add wave -noupdate /tb_ms/TB_simulation/SR/REMINDER/i_enable
add wave -noupdate -color Coral /tb_ms/TB_simulation/SR/DATA/i_init
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/REMINDER/i_val
add wave -noupdate -divider R_O
add wave -noupdate -color Gray60 -radix unsigned /tb_ms/TB_simulation/SR/DATA/i_counter
add wave -noupdate -color Gold -radix decimal /tb_ms/TB_simulation/SR/REMINDER/o_val
add wave -noupdate -divider Q_I
add wave -noupdate -color Coral /tb_ms/TB_simulation/SR/DATA/i_init
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/OPCALCROOT/o_or_q
add wave -noupdate -color {Cornflower Blue} -label {OR q-val} -radix decimal /tb_ms/TB_simulation/SR/OR_Q_OP_Q/i_val_a
add wave -noupdate -color {Cornflower Blue} -label {OR op-val} -radix decimal /tb_ms/TB_simulation/SR/OR_Q_OP_Q/i_val_b
add wave -noupdate -color {Cornflower Blue} -label {OR out-val} -radix decimal /tb_ms/TB_simulation/SR/OR_Q_OP_Q/o_val
add wave -noupdate /tb_ms/TB_simulation/SR/QUOTIENT/i_enable
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/QUOTIENT/i_val
add wave -noupdate -divider Q_O
add wave -noupdate -color Gray60 -radix unsigned /tb_ms/TB_simulation/SR/DATA/i_counter
add wave -noupdate -color Gold -radix decimal /tb_ms/TB_simulation/SR/QUOTIENT/o_val
add wave -noupdate -divider COUNTER
add wave -noupdate -radix unsigned /tb_ms/TB_simulation/COUNT/o_counter
add wave -noupdate -divider OUTPUTS
add wave -noupdate /tb_ms/TB_simulation/o_load_y
add wave -noupdate /tb_ms/TB_simulation/o_load_x
add wave -noupdate -divider PRINT
add wave -noupdate -color Salmon /tb_ms/TB_simulation/CTRL/r_control.state
add wave -noupdate -color {Dark Orchid} -radix decimal /tb_ms/TB_simulation/SR/o_root_op
add wave -noupdate -color Gray60 -radix unsigned /tb_ms/TB_simulation/SR/DATA/i_counter
add wave -noupdate -color Gold -label D -radix decimal /tb_ms/TB_simulation/SR/DATA/o_val
add wave -noupdate -color Gold -label R -radix decimal /tb_ms/TB_simulation/SR/REMINDER/o_val
add wave -noupdate -color Gold -label Q -radix decimal /tb_ms/TB_simulation/SR/QUOTIENT/o_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 99
configure wave -valuecolwidth 39
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
WaveRestoreZoom {13 ps} {49 ps}
