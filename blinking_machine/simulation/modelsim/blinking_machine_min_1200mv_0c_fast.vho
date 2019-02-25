-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

-- DATE "02/24/2019 19:50:16"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	TOP_blinking_machine IS
    PORT (
	i_clk : IN std_logic;
	i_rst : IN std_logic;
	i_start : IN std_logic;
	o_out : BUFFER std_logic;
	o_clk_1hz : BUFFER std_logic
	);
END TOP_blinking_machine;

-- Design Ports Information
-- o_out	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_clk_1hz	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_start	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_rst	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clk	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF TOP_blinking_machine IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_clk : std_logic;
SIGNAL ww_i_rst : std_logic;
SIGNAL ww_i_start : std_logic;
SIGNAL ww_o_out : std_logic;
SIGNAL ww_o_clk_1hz : std_logic;
SIGNAL \i_clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CD|l_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \o_out~output_o\ : std_logic;
SIGNAL \o_clk_1hz~output_o\ : std_logic;
SIGNAL \i_clk~input_o\ : std_logic;
SIGNAL \i_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \CD|Add0~0_combout\ : std_logic;
SIGNAL \i_rst~input_o\ : std_logic;
SIGNAL \CD|Add0~1\ : std_logic;
SIGNAL \CD|Add0~2_combout\ : std_logic;
SIGNAL \CD|Add0~3\ : std_logic;
SIGNAL \CD|Add0~4_combout\ : std_logic;
SIGNAL \CD|Add0~5\ : std_logic;
SIGNAL \CD|Add0~6_combout\ : std_logic;
SIGNAL \CD|Add0~7\ : std_logic;
SIGNAL \CD|Add0~8_combout\ : std_logic;
SIGNAL \CD|Add0~9\ : std_logic;
SIGNAL \CD|Add0~10_combout\ : std_logic;
SIGNAL \CD|Add0~11\ : std_logic;
SIGNAL \CD|Add0~12_combout\ : std_logic;
SIGNAL \CD|counter~11_combout\ : std_logic;
SIGNAL \CD|Add0~13\ : std_logic;
SIGNAL \CD|Add0~14_combout\ : std_logic;
SIGNAL \CD|Add0~15\ : std_logic;
SIGNAL \CD|Add0~16_combout\ : std_logic;
SIGNAL \CD|Add0~17\ : std_logic;
SIGNAL \CD|Add0~18_combout\ : std_logic;
SIGNAL \CD|Add0~19\ : std_logic;
SIGNAL \CD|Add0~20_combout\ : std_logic;
SIGNAL \CD|Equal0~5_combout\ : std_logic;
SIGNAL \CD|Equal0~7_combout\ : std_logic;
SIGNAL \CD|Equal0~6_combout\ : std_logic;
SIGNAL \CD|Add0~21\ : std_logic;
SIGNAL \CD|Add0~22_combout\ : std_logic;
SIGNAL \CD|counter~10_combout\ : std_logic;
SIGNAL \CD|Add0~23\ : std_logic;
SIGNAL \CD|Add0~24_combout\ : std_logic;
SIGNAL \CD|counter~9_combout\ : std_logic;
SIGNAL \CD|Add0~25\ : std_logic;
SIGNAL \CD|Add0~26_combout\ : std_logic;
SIGNAL \CD|counter~8_combout\ : std_logic;
SIGNAL \CD|Add0~27\ : std_logic;
SIGNAL \CD|Add0~28_combout\ : std_logic;
SIGNAL \CD|counter~7_combout\ : std_logic;
SIGNAL \CD|Add0~29\ : std_logic;
SIGNAL \CD|Add0~30_combout\ : std_logic;
SIGNAL \CD|Add0~31\ : std_logic;
SIGNAL \CD|Add0~32_combout\ : std_logic;
SIGNAL \CD|counter~6_combout\ : std_logic;
SIGNAL \CD|Add0~33\ : std_logic;
SIGNAL \CD|Add0~34_combout\ : std_logic;
SIGNAL \CD|Add0~35\ : std_logic;
SIGNAL \CD|Add0~36_combout\ : std_logic;
SIGNAL \CD|counter~5_combout\ : std_logic;
SIGNAL \CD|Add0~37\ : std_logic;
SIGNAL \CD|Add0~38_combout\ : std_logic;
SIGNAL \CD|counter~4_combout\ : std_logic;
SIGNAL \CD|Add0~39\ : std_logic;
SIGNAL \CD|Add0~40_combout\ : std_logic;
SIGNAL \CD|counter~3_combout\ : std_logic;
SIGNAL \CD|Add0~41\ : std_logic;
SIGNAL \CD|Add0~42_combout\ : std_logic;
SIGNAL \CD|counter~2_combout\ : std_logic;
SIGNAL \CD|Add0~43\ : std_logic;
SIGNAL \CD|Add0~44_combout\ : std_logic;
SIGNAL \CD|counter~1_combout\ : std_logic;
SIGNAL \CD|Equal0~1_combout\ : std_logic;
SIGNAL \CD|Equal0~3_combout\ : std_logic;
SIGNAL \CD|Equal0~2_combout\ : std_logic;
SIGNAL \CD|Add0~45\ : std_logic;
SIGNAL \CD|Add0~46_combout\ : std_logic;
SIGNAL \CD|Add0~47\ : std_logic;
SIGNAL \CD|Add0~48_combout\ : std_logic;
SIGNAL \CD|counter~0_combout\ : std_logic;
SIGNAL \CD|Add0~49\ : std_logic;
SIGNAL \CD|Add0~50_combout\ : std_logic;
SIGNAL \CD|Equal0~0_combout\ : std_logic;
SIGNAL \CD|Equal0~4_combout\ : std_logic;
SIGNAL \CD|Equal0~8_combout\ : std_logic;
SIGNAL \CD|l_clk~0_combout\ : std_logic;
SIGNAL \CD|l_clk~feeder_combout\ : std_logic;
SIGNAL \CD|l_clk~q\ : std_logic;
SIGNAL \CD|l_clk~clkctrl_outclk\ : std_logic;
SIGNAL \i_start~input_o\ : std_logic;
SIGNAL \SM|state.OFF_2~feeder_combout\ : std_logic;
SIGNAL \SM|state.OFF_2~q\ : std_logic;
SIGNAL \SM|state.ON_3~feeder_combout\ : std_logic;
SIGNAL \SM|state.ON_3~q\ : std_logic;
SIGNAL \SM|state.OFF_3~q\ : std_logic;
SIGNAL \SM|o_count_ena[2]~5_combout\ : std_logic;
SIGNAL \COUNT|l_counter~2_combout\ : std_logic;
SIGNAL \SM|o_count_ena[2]~6_combout\ : std_logic;
SIGNAL \COUNT|LessThan0~2_combout\ : std_logic;
SIGNAL \COUNT|LessThan0~3_combout\ : std_logic;
SIGNAL \COUNT|l_counter~1_combout\ : std_logic;
SIGNAL \COUNT|l_counter~0_combout\ : std_logic;
SIGNAL \SM|Selector0~0_combout\ : std_logic;
SIGNAL \SM|Selector0~1_combout\ : std_logic;
SIGNAL \SM|state.IDLE~q\ : std_logic;
SIGNAL \SM|Selector1~0_combout\ : std_logic;
SIGNAL \SM|Selector1~1_combout\ : std_logic;
SIGNAL \SM|state.ON_1~q\ : std_logic;
SIGNAL \SM|state.OFF_1~feeder_combout\ : std_logic;
SIGNAL \SM|state.OFF_1~q\ : std_logic;
SIGNAL \SM|state.ON_2~feeder_combout\ : std_logic;
SIGNAL \SM|state.ON_2~q\ : std_logic;
SIGNAL \SM|o_count_ena[1]~4_combout\ : std_logic;
SIGNAL \COUNT|l_counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \CD|counter\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \ALT_INV_i_rst~input_o\ : std_logic;

BEGIN

ww_i_clk <= i_clk;
ww_i_rst <= i_rst;
ww_i_start <= i_start;
o_out <= ww_o_out;
o_clk_1hz <= ww_o_clk_1hz;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\i_clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_clk~input_o\);

\CD|l_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CD|l_clk~q\);
\ALT_INV_i_rst~input_o\ <= NOT \i_rst~input_o\;

-- Location: IOOBUF_X69_Y73_N16
\o_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SM|o_count_ena[1]~4_combout\,
	devoe => ww_devoe,
	o => \o_out~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\o_clk_1hz~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CD|l_clk~q\,
	devoe => ww_devoe,
	o => \o_clk_1hz~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\i_clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clk,
	o => \i_clk~input_o\);

-- Location: CLKCTRL_G4
\i_clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X91_Y20_N6
\CD|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~0_combout\ = \CD|counter\(0) $ (VCC)
-- \CD|Add0~1\ = CARRY(\CD|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(0),
	datad => VCC,
	combout => \CD|Add0~0_combout\,
	cout => \CD|Add0~1\);

-- Location: IOIBUF_X115_Y14_N8
\i_rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_rst,
	o => \i_rst~input_o\);

-- Location: FF_X91_Y20_N7
\CD|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~0_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(0));

-- Location: LCCOMB_X91_Y20_N8
\CD|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~2_combout\ = (\CD|counter\(1) & (!\CD|Add0~1\)) # (!\CD|counter\(1) & ((\CD|Add0~1\) # (GND)))
-- \CD|Add0~3\ = CARRY((!\CD|Add0~1\) # (!\CD|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(1),
	datad => VCC,
	cin => \CD|Add0~1\,
	combout => \CD|Add0~2_combout\,
	cout => \CD|Add0~3\);

-- Location: FF_X91_Y20_N9
\CD|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~2_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(1));

-- Location: LCCOMB_X91_Y20_N10
\CD|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~4_combout\ = (\CD|counter\(2) & (\CD|Add0~3\ $ (GND))) # (!\CD|counter\(2) & (!\CD|Add0~3\ & VCC))
-- \CD|Add0~5\ = CARRY((\CD|counter\(2) & !\CD|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(2),
	datad => VCC,
	cin => \CD|Add0~3\,
	combout => \CD|Add0~4_combout\,
	cout => \CD|Add0~5\);

-- Location: FF_X91_Y20_N11
\CD|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~4_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(2));

-- Location: LCCOMB_X91_Y20_N12
\CD|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~6_combout\ = (\CD|counter\(3) & (!\CD|Add0~5\)) # (!\CD|counter\(3) & ((\CD|Add0~5\) # (GND)))
-- \CD|Add0~7\ = CARRY((!\CD|Add0~5\) # (!\CD|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(3),
	datad => VCC,
	cin => \CD|Add0~5\,
	combout => \CD|Add0~6_combout\,
	cout => \CD|Add0~7\);

-- Location: FF_X91_Y20_N13
\CD|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~6_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(3));

-- Location: LCCOMB_X91_Y20_N14
\CD|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~8_combout\ = (\CD|counter\(4) & (\CD|Add0~7\ $ (GND))) # (!\CD|counter\(4) & (!\CD|Add0~7\ & VCC))
-- \CD|Add0~9\ = CARRY((\CD|counter\(4) & !\CD|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(4),
	datad => VCC,
	cin => \CD|Add0~7\,
	combout => \CD|Add0~8_combout\,
	cout => \CD|Add0~9\);

-- Location: FF_X91_Y20_N15
\CD|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~8_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(4));

-- Location: LCCOMB_X91_Y20_N16
\CD|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~10_combout\ = (\CD|counter\(5) & (!\CD|Add0~9\)) # (!\CD|counter\(5) & ((\CD|Add0~9\) # (GND)))
-- \CD|Add0~11\ = CARRY((!\CD|Add0~9\) # (!\CD|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(5),
	datad => VCC,
	cin => \CD|Add0~9\,
	combout => \CD|Add0~10_combout\,
	cout => \CD|Add0~11\);

-- Location: FF_X91_Y20_N17
\CD|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~10_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(5));

-- Location: LCCOMB_X91_Y20_N18
\CD|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~12_combout\ = (\CD|counter\(6) & (\CD|Add0~11\ $ (GND))) # (!\CD|counter\(6) & (!\CD|Add0~11\ & VCC))
-- \CD|Add0~13\ = CARRY((\CD|counter\(6) & !\CD|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(6),
	datad => VCC,
	cin => \CD|Add0~11\,
	combout => \CD|Add0~12_combout\,
	cout => \CD|Add0~13\);

-- Location: LCCOMB_X91_Y20_N2
\CD|counter~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~11_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|Add0~12_combout\,
	combout => \CD|counter~11_combout\);

-- Location: FF_X91_Y20_N3
\CD|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~11_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(6));

-- Location: LCCOMB_X91_Y20_N20
\CD|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~14_combout\ = (\CD|counter\(7) & (!\CD|Add0~13\)) # (!\CD|counter\(7) & ((\CD|Add0~13\) # (GND)))
-- \CD|Add0~15\ = CARRY((!\CD|Add0~13\) # (!\CD|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(7),
	datad => VCC,
	cin => \CD|Add0~13\,
	combout => \CD|Add0~14_combout\,
	cout => \CD|Add0~15\);

-- Location: FF_X91_Y20_N21
\CD|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~14_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(7));

-- Location: LCCOMB_X91_Y20_N22
\CD|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~16_combout\ = (\CD|counter\(8) & (\CD|Add0~15\ $ (GND))) # (!\CD|counter\(8) & (!\CD|Add0~15\ & VCC))
-- \CD|Add0~17\ = CARRY((\CD|counter\(8) & !\CD|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(8),
	datad => VCC,
	cin => \CD|Add0~15\,
	combout => \CD|Add0~16_combout\,
	cout => \CD|Add0~17\);

-- Location: FF_X91_Y20_N23
\CD|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~16_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(8));

-- Location: LCCOMB_X91_Y20_N24
\CD|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~18_combout\ = (\CD|counter\(9) & (!\CD|Add0~17\)) # (!\CD|counter\(9) & ((\CD|Add0~17\) # (GND)))
-- \CD|Add0~19\ = CARRY((!\CD|Add0~17\) # (!\CD|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(9),
	datad => VCC,
	cin => \CD|Add0~17\,
	combout => \CD|Add0~18_combout\,
	cout => \CD|Add0~19\);

-- Location: FF_X91_Y20_N25
\CD|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~18_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(9));

-- Location: LCCOMB_X91_Y20_N26
\CD|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~20_combout\ = (\CD|counter\(10) & (\CD|Add0~19\ $ (GND))) # (!\CD|counter\(10) & (!\CD|Add0~19\ & VCC))
-- \CD|Add0~21\ = CARRY((\CD|counter\(10) & !\CD|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(10),
	datad => VCC,
	cin => \CD|Add0~19\,
	combout => \CD|Add0~20_combout\,
	cout => \CD|Add0~21\);

-- Location: FF_X91_Y20_N27
\CD|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~20_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(10));

-- Location: LCCOMB_X91_Y20_N4
\CD|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Equal0~5_combout\ = (!\CD|counter\(8) & (!\CD|counter\(7) & (!\CD|counter\(10) & !\CD|counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(8),
	datab => \CD|counter\(7),
	datac => \CD|counter\(10),
	datad => \CD|counter\(9),
	combout => \CD|Equal0~5_combout\);

-- Location: LCCOMB_X92_Y20_N20
\CD|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Equal0~7_combout\ = (\CD|counter\(1) & \CD|counter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(1),
	datad => \CD|counter\(2),
	combout => \CD|Equal0~7_combout\);

-- Location: LCCOMB_X91_Y20_N0
\CD|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Equal0~6_combout\ = (\CD|counter\(3) & (\CD|counter\(5) & (\CD|counter\(4) & !\CD|counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(3),
	datab => \CD|counter\(5),
	datac => \CD|counter\(4),
	datad => \CD|counter\(6),
	combout => \CD|Equal0~6_combout\);

-- Location: LCCOMB_X91_Y20_N28
\CD|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~22_combout\ = (\CD|counter\(11) & (!\CD|Add0~21\)) # (!\CD|counter\(11) & ((\CD|Add0~21\) # (GND)))
-- \CD|Add0~23\ = CARRY((!\CD|Add0~21\) # (!\CD|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(11),
	datad => VCC,
	cin => \CD|Add0~21\,
	combout => \CD|Add0~22_combout\,
	cout => \CD|Add0~23\);

-- Location: LCCOMB_X92_Y19_N0
\CD|counter~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~10_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CD|Equal0~8_combout\,
	datad => \CD|Add0~22_combout\,
	combout => \CD|counter~10_combout\);

-- Location: FF_X92_Y19_N1
\CD|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~10_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(11));

-- Location: LCCOMB_X91_Y20_N30
\CD|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~24_combout\ = (\CD|counter\(12) & (\CD|Add0~23\ $ (GND))) # (!\CD|counter\(12) & (!\CD|Add0~23\ & VCC))
-- \CD|Add0~25\ = CARRY((\CD|counter\(12) & !\CD|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(12),
	datad => VCC,
	cin => \CD|Add0~23\,
	combout => \CD|Add0~24_combout\,
	cout => \CD|Add0~25\);

-- Location: LCCOMB_X92_Y19_N24
\CD|counter~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~9_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CD|Equal0~8_combout\,
	datac => \CD|Add0~24_combout\,
	combout => \CD|counter~9_combout\);

-- Location: FF_X92_Y19_N25
\CD|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~9_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(12));

-- Location: LCCOMB_X91_Y19_N0
\CD|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~26_combout\ = (\CD|counter\(13) & (!\CD|Add0~25\)) # (!\CD|counter\(13) & ((\CD|Add0~25\) # (GND)))
-- \CD|Add0~27\ = CARRY((!\CD|Add0~25\) # (!\CD|counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(13),
	datad => VCC,
	cin => \CD|Add0~25\,
	combout => \CD|Add0~26_combout\,
	cout => \CD|Add0~27\);

-- Location: LCCOMB_X92_Y19_N18
\CD|counter~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~8_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CD|Equal0~8_combout\,
	datac => \CD|Add0~26_combout\,
	combout => \CD|counter~8_combout\);

-- Location: FF_X92_Y19_N19
\CD|counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~8_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(13));

-- Location: LCCOMB_X91_Y19_N2
\CD|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~28_combout\ = (\CD|counter\(14) & (\CD|Add0~27\ $ (GND))) # (!\CD|counter\(14) & (!\CD|Add0~27\ & VCC))
-- \CD|Add0~29\ = CARRY((\CD|counter\(14) & !\CD|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(14),
	datad => VCC,
	cin => \CD|Add0~27\,
	combout => \CD|Add0~28_combout\,
	cout => \CD|Add0~29\);

-- Location: LCCOMB_X92_Y19_N22
\CD|counter~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~7_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|Add0~28_combout\,
	combout => \CD|counter~7_combout\);

-- Location: FF_X92_Y19_N23
\CD|counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~7_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(14));

-- Location: LCCOMB_X91_Y19_N4
\CD|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~30_combout\ = (\CD|counter\(15) & (!\CD|Add0~29\)) # (!\CD|counter\(15) & ((\CD|Add0~29\) # (GND)))
-- \CD|Add0~31\ = CARRY((!\CD|Add0~29\) # (!\CD|counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(15),
	datad => VCC,
	cin => \CD|Add0~29\,
	combout => \CD|Add0~30_combout\,
	cout => \CD|Add0~31\);

-- Location: FF_X91_Y19_N5
\CD|counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~30_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(15));

-- Location: LCCOMB_X91_Y19_N6
\CD|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~32_combout\ = (\CD|counter\(16) & (\CD|Add0~31\ $ (GND))) # (!\CD|counter\(16) & (!\CD|Add0~31\ & VCC))
-- \CD|Add0~33\ = CARRY((\CD|counter\(16) & !\CD|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(16),
	datad => VCC,
	cin => \CD|Add0~31\,
	combout => \CD|Add0~32_combout\,
	cout => \CD|Add0~33\);

-- Location: LCCOMB_X91_Y19_N26
\CD|counter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~6_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|Add0~32_combout\,
	combout => \CD|counter~6_combout\);

-- Location: FF_X91_Y19_N27
\CD|counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~6_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(16));

-- Location: LCCOMB_X91_Y19_N8
\CD|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~34_combout\ = (\CD|counter\(17) & (!\CD|Add0~33\)) # (!\CD|counter\(17) & ((\CD|Add0~33\) # (GND)))
-- \CD|Add0~35\ = CARRY((!\CD|Add0~33\) # (!\CD|counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(17),
	datad => VCC,
	cin => \CD|Add0~33\,
	combout => \CD|Add0~34_combout\,
	cout => \CD|Add0~35\);

-- Location: FF_X91_Y19_N9
\CD|counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~34_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(17));

-- Location: LCCOMB_X91_Y19_N10
\CD|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~36_combout\ = (\CD|counter\(18) & (\CD|Add0~35\ $ (GND))) # (!\CD|counter\(18) & (!\CD|Add0~35\ & VCC))
-- \CD|Add0~37\ = CARRY((\CD|counter\(18) & !\CD|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(18),
	datad => VCC,
	cin => \CD|Add0~35\,
	combout => \CD|Add0~36_combout\,
	cout => \CD|Add0~37\);

-- Location: LCCOMB_X91_Y19_N28
\CD|counter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~5_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|Add0~36_combout\,
	combout => \CD|counter~5_combout\);

-- Location: FF_X91_Y19_N29
\CD|counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~5_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(18));

-- Location: LCCOMB_X91_Y19_N12
\CD|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~38_combout\ = (\CD|counter\(19) & (!\CD|Add0~37\)) # (!\CD|counter\(19) & ((\CD|Add0~37\) # (GND)))
-- \CD|Add0~39\ = CARRY((!\CD|Add0~37\) # (!\CD|counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(19),
	datad => VCC,
	cin => \CD|Add0~37\,
	combout => \CD|Add0~38_combout\,
	cout => \CD|Add0~39\);

-- Location: LCCOMB_X92_Y19_N12
\CD|counter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~4_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|Add0~38_combout\,
	combout => \CD|counter~4_combout\);

-- Location: FF_X92_Y19_N13
\CD|counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~4_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(19));

-- Location: LCCOMB_X91_Y19_N14
\CD|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~40_combout\ = (\CD|counter\(20) & (\CD|Add0~39\ $ (GND))) # (!\CD|counter\(20) & (!\CD|Add0~39\ & VCC))
-- \CD|Add0~41\ = CARRY((\CD|counter\(20) & !\CD|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(20),
	datad => VCC,
	cin => \CD|Add0~39\,
	combout => \CD|Add0~40_combout\,
	cout => \CD|Add0~41\);

-- Location: LCCOMB_X92_Y19_N6
\CD|counter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~3_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|Add0~40_combout\,
	combout => \CD|counter~3_combout\);

-- Location: FF_X92_Y19_N7
\CD|counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~3_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(20));

-- Location: LCCOMB_X91_Y19_N16
\CD|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~42_combout\ = (\CD|counter\(21) & (!\CD|Add0~41\)) # (!\CD|counter\(21) & ((\CD|Add0~41\) # (GND)))
-- \CD|Add0~43\ = CARRY((!\CD|Add0~41\) # (!\CD|counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(21),
	datad => VCC,
	cin => \CD|Add0~41\,
	combout => \CD|Add0~42_combout\,
	cout => \CD|Add0~43\);

-- Location: LCCOMB_X91_Y19_N30
\CD|counter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~2_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|Add0~42_combout\,
	combout => \CD|counter~2_combout\);

-- Location: FF_X91_Y19_N31
\CD|counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~2_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(21));

-- Location: LCCOMB_X91_Y19_N18
\CD|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~44_combout\ = (\CD|counter\(22) & (\CD|Add0~43\ $ (GND))) # (!\CD|counter\(22) & (!\CD|Add0~43\ & VCC))
-- \CD|Add0~45\ = CARRY((\CD|counter\(22) & !\CD|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(22),
	datad => VCC,
	cin => \CD|Add0~43\,
	combout => \CD|Add0~44_combout\,
	cout => \CD|Add0~45\);

-- Location: LCCOMB_X92_Y19_N30
\CD|counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~1_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|Add0~44_combout\,
	combout => \CD|counter~1_combout\);

-- Location: FF_X92_Y19_N31
\CD|counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~1_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(22));

-- Location: LCCOMB_X92_Y19_N10
\CD|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Equal0~1_combout\ = (\CD|counter\(19) & (\CD|counter\(21) & (\CD|counter\(22) & \CD|counter\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(19),
	datab => \CD|counter\(21),
	datac => \CD|counter\(22),
	datad => \CD|counter\(20),
	combout => \CD|Equal0~1_combout\);

-- Location: LCCOMB_X92_Y19_N4
\CD|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Equal0~3_combout\ = (\CD|counter\(14) & (\CD|counter\(13) & (\CD|counter\(12) & \CD|counter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(14),
	datab => \CD|counter\(13),
	datac => \CD|counter\(12),
	datad => \CD|counter\(11),
	combout => \CD|Equal0~3_combout\);

-- Location: LCCOMB_X92_Y19_N14
\CD|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Equal0~2_combout\ = (!\CD|counter\(17) & (!\CD|counter\(15) & (\CD|counter\(16) & \CD|counter\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(17),
	datab => \CD|counter\(15),
	datac => \CD|counter\(16),
	datad => \CD|counter\(18),
	combout => \CD|Equal0~2_combout\);

-- Location: LCCOMB_X91_Y19_N20
\CD|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~46_combout\ = (\CD|counter\(23) & (!\CD|Add0~45\)) # (!\CD|counter\(23) & ((\CD|Add0~45\) # (GND)))
-- \CD|Add0~47\ = CARRY((!\CD|Add0~45\) # (!\CD|counter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(23),
	datad => VCC,
	cin => \CD|Add0~45\,
	combout => \CD|Add0~46_combout\,
	cout => \CD|Add0~47\);

-- Location: FF_X91_Y19_N21
\CD|counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~46_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(23));

-- Location: LCCOMB_X91_Y19_N22
\CD|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~48_combout\ = (\CD|counter\(24) & (\CD|Add0~47\ $ (GND))) # (!\CD|counter\(24) & (!\CD|Add0~47\ & VCC))
-- \CD|Add0~49\ = CARRY((\CD|counter\(24) & !\CD|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CD|counter\(24),
	datad => VCC,
	cin => \CD|Add0~47\,
	combout => \CD|Add0~48_combout\,
	cout => \CD|Add0~49\);

-- Location: LCCOMB_X92_Y19_N26
\CD|counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|counter~0_combout\ = (!\CD|Equal0~8_combout\ & \CD|Add0~48_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|Add0~48_combout\,
	combout => \CD|counter~0_combout\);

-- Location: FF_X92_Y19_N27
\CD|counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|counter~0_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(24));

-- Location: LCCOMB_X91_Y19_N24
\CD|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Add0~50_combout\ = \CD|Add0~49\ $ (\CD|counter\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \CD|counter\(25),
	cin => \CD|Add0~49\,
	combout => \CD|Add0~50_combout\);

-- Location: FF_X91_Y19_N25
\CD|counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|Add0~50_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|counter\(25));

-- Location: LCCOMB_X92_Y19_N20
\CD|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Equal0~0_combout\ = (\CD|counter\(24) & (!\CD|counter\(25) & (\CD|counter\(0) & !\CD|counter\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|counter\(24),
	datab => \CD|counter\(25),
	datac => \CD|counter\(0),
	datad => \CD|counter\(23),
	combout => \CD|Equal0~0_combout\);

-- Location: LCCOMB_X92_Y19_N16
\CD|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Equal0~4_combout\ = (\CD|Equal0~1_combout\ & (\CD|Equal0~3_combout\ & (\CD|Equal0~2_combout\ & \CD|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|Equal0~1_combout\,
	datab => \CD|Equal0~3_combout\,
	datac => \CD|Equal0~2_combout\,
	datad => \CD|Equal0~0_combout\,
	combout => \CD|Equal0~4_combout\);

-- Location: LCCOMB_X92_Y19_N8
\CD|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|Equal0~8_combout\ = (\CD|Equal0~5_combout\ & (\CD|Equal0~7_combout\ & (\CD|Equal0~6_combout\ & \CD|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CD|Equal0~5_combout\,
	datab => \CD|Equal0~7_combout\,
	datac => \CD|Equal0~6_combout\,
	datad => \CD|Equal0~4_combout\,
	combout => \CD|Equal0~8_combout\);

-- Location: LCCOMB_X92_Y19_N28
\CD|l_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|l_clk~0_combout\ = \CD|Equal0~8_combout\ $ (\CD|l_clk~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|Equal0~8_combout\,
	datad => \CD|l_clk~q\,
	combout => \CD|l_clk~0_combout\);

-- Location: LCCOMB_X92_Y19_N2
\CD|l_clk~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \CD|l_clk~feeder_combout\ = \CD|l_clk~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CD|l_clk~0_combout\,
	combout => \CD|l_clk~feeder_combout\);

-- Location: FF_X92_Y19_N3
\CD|l_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \CD|l_clk~feeder_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CD|l_clk~q\);

-- Location: CLKCTRL_G9
\CD|l_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CD|l_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CD|l_clk~clkctrl_outclk\);

-- Location: IOIBUF_X115_Y13_N1
\i_start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_start,
	o => \i_start~input_o\);

-- Location: LCCOMB_X106_Y13_N6
\SM|state.OFF_2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|state.OFF_2~feeder_combout\ = \SM|state.ON_2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SM|state.ON_2~q\,
	combout => \SM|state.OFF_2~feeder_combout\);

-- Location: FF_X106_Y13_N7
\SM|state.OFF_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	d => \SM|state.OFF_2~feeder_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	ena => \COUNT|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SM|state.OFF_2~q\);

-- Location: LCCOMB_X106_Y13_N30
\SM|state.ON_3~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|state.ON_3~feeder_combout\ = \SM|state.OFF_2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SM|state.OFF_2~q\,
	combout => \SM|state.ON_3~feeder_combout\);

-- Location: FF_X106_Y13_N31
\SM|state.ON_3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	d => \SM|state.ON_3~feeder_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	ena => \COUNT|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SM|state.ON_3~q\);

-- Location: FF_X106_Y13_N21
\SM|state.OFF_3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	asdata => \SM|state.ON_3~q\,
	clrn => \ALT_INV_i_rst~input_o\,
	sload => VCC,
	ena => \COUNT|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SM|state.OFF_3~q\);

-- Location: LCCOMB_X106_Y13_N26
\SM|o_count_ena[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|o_count_ena[2]~5_combout\ = (!\SM|state.OFF_2~q\ & (!\SM|state.OFF_3~q\ & !\SM|state.OFF_1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM|state.OFF_2~q\,
	datab => \SM|state.OFF_3~q\,
	datad => \SM|state.OFF_1~q\,
	combout => \SM|o_count_ena[2]~5_combout\);

-- Location: LCCOMB_X106_Y13_N14
\COUNT|l_counter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \COUNT|l_counter~2_combout\ = (!\COUNT|LessThan0~3_combout\ & (\COUNT|l_counter\(2) $ (((\COUNT|l_counter\(1) & \COUNT|l_counter\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \COUNT|l_counter\(1),
	datab => \COUNT|l_counter\(0),
	datac => \COUNT|l_counter\(2),
	datad => \COUNT|LessThan0~3_combout\,
	combout => \COUNT|l_counter~2_combout\);

-- Location: LCCOMB_X106_Y13_N18
\SM|o_count_ena[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|o_count_ena[2]~6_combout\ = (\SM|state.ON_3~q\) # ((\SM|state.ON_2~q\) # ((\SM|state.ON_1~q\) # (!\SM|o_count_ena[2]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM|state.ON_3~q\,
	datab => \SM|state.ON_2~q\,
	datac => \SM|o_count_ena[2]~5_combout\,
	datad => \SM|state.ON_1~q\,
	combout => \SM|o_count_ena[2]~6_combout\);

-- Location: FF_X106_Y13_N15
\COUNT|l_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	d => \COUNT|l_counter~2_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	ena => \SM|o_count_ena[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COUNT|l_counter\(2));

-- Location: LCCOMB_X106_Y13_N24
\COUNT|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \COUNT|LessThan0~2_combout\ = (\COUNT|l_counter\(0) & (!\COUNT|l_counter\(1) & !\SM|o_count_ena[1]~4_combout\)) # (!\COUNT|l_counter\(0) & ((!\SM|o_count_ena[1]~4_combout\) # (!\COUNT|l_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \COUNT|l_counter\(0),
	datac => \COUNT|l_counter\(1),
	datad => \SM|o_count_ena[1]~4_combout\,
	combout => \COUNT|LessThan0~2_combout\);

-- Location: LCCOMB_X106_Y13_N8
\COUNT|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \COUNT|LessThan0~3_combout\ = (\COUNT|l_counter\(2) & (((!\SM|o_count_ena[2]~5_combout\ & !\SM|o_count_ena[1]~4_combout\)) # (!\COUNT|LessThan0~2_combout\))) # (!\COUNT|l_counter\(2) & (!\SM|o_count_ena[2]~5_combout\ & (!\SM|o_count_ena[1]~4_combout\ & 
-- !\COUNT|LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM|o_count_ena[2]~5_combout\,
	datab => \SM|o_count_ena[1]~4_combout\,
	datac => \COUNT|l_counter\(2),
	datad => \COUNT|LessThan0~2_combout\,
	combout => \COUNT|LessThan0~3_combout\);

-- Location: LCCOMB_X106_Y13_N12
\COUNT|l_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \COUNT|l_counter~1_combout\ = (!\COUNT|l_counter\(0) & !\COUNT|LessThan0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \COUNT|l_counter\(0),
	datad => \COUNT|LessThan0~3_combout\,
	combout => \COUNT|l_counter~1_combout\);

-- Location: FF_X106_Y13_N13
\COUNT|l_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	d => \COUNT|l_counter~1_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	ena => \SM|o_count_ena[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COUNT|l_counter\(0));

-- Location: LCCOMB_X106_Y13_N22
\COUNT|l_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \COUNT|l_counter~0_combout\ = (!\COUNT|LessThan0~3_combout\ & (\COUNT|l_counter\(0) $ (\COUNT|l_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \COUNT|l_counter\(0),
	datac => \COUNT|l_counter\(1),
	datad => \COUNT|LessThan0~3_combout\,
	combout => \COUNT|l_counter~0_combout\);

-- Location: FF_X106_Y13_N23
\COUNT|l_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	d => \COUNT|l_counter~0_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	ena => \SM|o_count_ena[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COUNT|l_counter\(1));

-- Location: LCCOMB_X106_Y13_N20
\SM|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|Selector0~0_combout\ = (\SM|state.OFF_3~q\ & ((\COUNT|l_counter\(2)) # ((\COUNT|l_counter\(1) & \COUNT|l_counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \COUNT|l_counter\(1),
	datab => \COUNT|l_counter\(2),
	datac => \SM|state.OFF_3~q\,
	datad => \COUNT|l_counter\(0),
	combout => \SM|Selector0~0_combout\);

-- Location: LCCOMB_X107_Y13_N18
\SM|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|Selector0~1_combout\ = (!\SM|Selector0~0_combout\ & ((\i_start~input_o\) # (\SM|state.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_start~input_o\,
	datac => \SM|state.IDLE~q\,
	datad => \SM|Selector0~0_combout\,
	combout => \SM|Selector0~1_combout\);

-- Location: FF_X107_Y13_N19
\SM|state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	d => \SM|Selector0~1_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SM|state.IDLE~q\);

-- Location: LCCOMB_X106_Y13_N28
\SM|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|Selector1~0_combout\ = (\SM|state.ON_1~q\ & (((!\COUNT|l_counter\(1) & !\COUNT|l_counter\(0))) # (!\COUNT|l_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \COUNT|l_counter\(1),
	datab => \COUNT|l_counter\(0),
	datac => \COUNT|l_counter\(2),
	datad => \SM|state.ON_1~q\,
	combout => \SM|Selector1~0_combout\);

-- Location: LCCOMB_X107_Y13_N24
\SM|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|Selector1~1_combout\ = (\SM|Selector1~0_combout\) # ((!\SM|state.IDLE~q\ & \i_start~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SM|state.IDLE~q\,
	datac => \i_start~input_o\,
	datad => \SM|Selector1~0_combout\,
	combout => \SM|Selector1~1_combout\);

-- Location: FF_X107_Y13_N25
\SM|state.ON_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	d => \SM|Selector1~1_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SM|state.ON_1~q\);

-- Location: LCCOMB_X106_Y13_N10
\SM|state.OFF_1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|state.OFF_1~feeder_combout\ = \SM|state.ON_1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SM|state.ON_1~q\,
	combout => \SM|state.OFF_1~feeder_combout\);

-- Location: FF_X106_Y13_N11
\SM|state.OFF_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	d => \SM|state.OFF_1~feeder_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	ena => \COUNT|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SM|state.OFF_1~q\);

-- Location: LCCOMB_X106_Y13_N16
\SM|state.ON_2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|state.ON_2~feeder_combout\ = \SM|state.OFF_1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SM|state.OFF_1~q\,
	combout => \SM|state.ON_2~feeder_combout\);

-- Location: FF_X106_Y13_N17
\SM|state.ON_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CD|l_clk~clkctrl_outclk\,
	d => \SM|state.ON_2~feeder_combout\,
	clrn => \ALT_INV_i_rst~input_o\,
	ena => \COUNT|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SM|state.ON_2~q\);

-- Location: LCCOMB_X106_Y13_N0
\SM|o_count_ena[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \SM|o_count_ena[1]~4_combout\ = (\SM|state.ON_2~q\) # ((\SM|state.ON_3~q\) # (\SM|state.ON_1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SM|state.ON_2~q\,
	datac => \SM|state.ON_3~q\,
	datad => \SM|state.ON_1~q\,
	combout => \SM|o_count_ena[1]~4_combout\);

ww_o_out <= \o_out~output_o\;

ww_o_clk_1hz <= \o_clk_1hz~output_o\;
END structure;


