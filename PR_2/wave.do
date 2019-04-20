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
add wave -noupdate -label In-ALU -radix decimal -childformat {{{/tb_ms/TB_simulation/SR/REMINDER/i_val[31]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[30]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[29]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[28]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[27]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[26]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[25]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[24]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[23]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[22]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[21]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[20]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[19]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[18]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[17]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[16]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[15]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[14]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[13]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[12]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[11]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[10]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[9]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[8]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[7]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[6]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[5]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[4]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[3]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[2]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[1]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/i_val[0]} -radix decimal}} -subitemconfig {{/tb_ms/TB_simulation/SR/REMINDER/i_val[31]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[30]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[29]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[28]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[27]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[26]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[25]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[24]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[23]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[22]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[21]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[20]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[19]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[18]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[17]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[16]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[15]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[14]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[13]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[12]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[11]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[10]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[9]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[8]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[7]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[6]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[5]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[4]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[3]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[2]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[1]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/i_val[0]} {-height 15 -radix decimal}} /tb_ms/TB_simulation/SR/REMINDER/i_val
add wave -noupdate -color Gold -label R -radix decimal -childformat {{{/tb_ms/TB_simulation/SR/REMINDER/o_val[31]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[30]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[29]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[28]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[27]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[26]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[25]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[24]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[23]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[22]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[21]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[20]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[19]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[18]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[17]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[16]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[15]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[14]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[13]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[12]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[11]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[10]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[9]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[8]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[7]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[6]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[5]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[4]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[3]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[2]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[1]} -radix decimal} {{/tb_ms/TB_simulation/SR/REMINDER/o_val[0]} -radix decimal}} -subitemconfig {{/tb_ms/TB_simulation/SR/REMINDER/o_val[31]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[30]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[29]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[28]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[27]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[26]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[25]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[24]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[23]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[22]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[21]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[20]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[19]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[18]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[17]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[16]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[15]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[14]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[13]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[12]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[11]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[10]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[9]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[8]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[7]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[6]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[5]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[4]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[3]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[2]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[1]} {-color Gold -height 15 -radix decimal} {/tb_ms/TB_simulation/SR/REMINDER/o_val[0]} {-color Gold -height 15 -radix decimal}} /tb_ms/TB_simulation/SR/REMINDER/o_val
add wave -noupdate -label RD-OR -radix decimal /tb_ms/TB_simulation/SR/OR_R_D_ALU/o_val
add wave -noupdate -color {Dark Orchid} -radix decimal /tb_ms/TB_simulation/SR/o_root_op
add wave -noupdate -color Gray60 -radix unsigned /tb_ms/TB_simulation/SR/DATA/i_counter
add wave -noupdate -color Gold -label D -radix decimal /tb_ms/TB_simulation/SR/DATA/o_val
add wave -noupdate -label ALU-R -radix decimal -childformat {{{/tb_ms/TB_simulation/ALU/o_val[31]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[30]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[29]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[28]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[27]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[26]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[25]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[24]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[23]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[22]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[21]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[20]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[19]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[18]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[17]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[16]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[15]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[14]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[13]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[12]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[11]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[10]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[9]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[8]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[7]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[6]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[5]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[4]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[3]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[2]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[1]} -radix decimal} {{/tb_ms/TB_simulation/ALU/o_val[0]} -radix decimal}} -subitemconfig {{/tb_ms/TB_simulation/ALU/o_val[31]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[30]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[29]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[28]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[27]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[26]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[25]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[24]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[23]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[22]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[21]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[20]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[19]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[18]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[17]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[16]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[15]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[14]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[13]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[12]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[11]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[10]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[9]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[8]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[7]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[6]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[5]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[4]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[3]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[2]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[1]} {-height 15 -radix decimal} {/tb_ms/TB_simulation/ALU/o_val[0]} {-height 15 -radix decimal}} /tb_ms/TB_simulation/ALU/o_val
add wave -noupdate -color Gold -label Q -radix decimal /tb_ms/TB_simulation/SR/QUOTIENT/o_val
add wave -noupdate -divider ALU
add wave -noupdate -radix decimal /tb_ms/TB_simulation/ALU/i_val_a
add wave -noupdate -radix decimal /tb_ms/TB_simulation/ALU/i_val_b
add wave -noupdate -radix decimal /tb_ms/TB_simulation/ALU/i_sltr
add wave -noupdate -radix decimal /tb_ms/TB_simulation/ALU/i_init
add wave -noupdate -divider OP-CALC
add wave -noupdate /tb_ms/TB_simulation/SR/OPCALCROOT/i_alu_msb
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/OPCALCROOT/o_or_q
add wave -noupdate -divider OR-Q
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/OR_Q_OP_Q/i_val_a
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/OR_Q_OP_Q/i_val_b
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/OR_Q_OP_Q/o_val
add wave -noupdate -divider QUOTIENT
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/QUOTIENT/i_val
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/QUOTIENT/i_enable
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/QUOTIENT/o_val
add wave -noupdate -divider Results
add wave -noupdate -color Salmon /tb_ms/TB_simulation/CTRL/r_control.state
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/REM_QUO/o_reminder
add wave -noupdate -radix decimal /tb_ms/TB_simulation/SR/REM_QUO/o_quotient
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 99
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
WaveRestoreZoom {28 ps} {60 ps}
