-- Copyright (C) 1991-2010 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 9.1 Build 304 01/25/2010 Service Pack 1 SJ Full Version"

-- DATE "05/16/2019 16:24:59"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	fsm_main IS
    PORT (
	clk : IN std_logic;
	res : IN std_logic;
	cnt_rdy : IN std_logic;
	cmp_food_flag : IN std_logic;
	fsm_i_done : IN std_logic;
	fsm_f_done : IN std_logic;
	fsm_s_done : IN std_logic;
	fsm_s_game_over : IN std_logic;
	\con_sel.INIT_CON\ : OUT std_logic;
	\con_sel.FOOD_CON\ : OUT std_logic;
	\con_sel.STEP_CON\ : OUT std_logic;
	fsm_i_start : OUT std_logic;
	fsm_f_start : OUT std_logic;
	fsm_s_start : OUT std_logic
	);
END fsm_main;

-- Design Ports Information
-- con_sel.INIT_CON	=>  Location: PIN_AE15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- con_sel.FOOD_CON	=>  Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- con_sel.STEP_CON	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- fsm_i_start	=>  Location: PIN_AD15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- fsm_f_start	=>  Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- fsm_s_start	=>  Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- res	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- fsm_i_done	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- fsm_f_done	=>  Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- cmp_food_flag	=>  Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- fsm_s_game_over	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- fsm_s_done	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- cnt_rdy	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default

ARCHITECTURE structure OF fsm_main IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_res : std_logic;
SIGNAL ww_cnt_rdy : std_logic;
SIGNAL ww_cmp_food_flag : std_logic;
SIGNAL ww_fsm_i_done : std_logic;
SIGNAL ww_fsm_f_done : std_logic;
SIGNAL ww_fsm_s_done : std_logic;
SIGNAL ww_fsm_s_game_over : std_logic;
SIGNAL \ww_con_sel.INIT_CON\ : std_logic;
SIGNAL \ww_con_sel.FOOD_CON\ : std_logic;
SIGNAL \ww_con_sel.STEP_CON\ : std_logic;
SIGNAL ww_fsm_i_start : std_logic;
SIGNAL ww_fsm_f_start : std_logic;
SIGNAL ww_fsm_s_start : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \res~combout\ : std_logic;
SIGNAL \fsm_f_done~combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \fsm_i_done~combout\ : std_logic;
SIGNAL \STATE~7_combout\ : std_logic;
SIGNAL \STATE.INIT_ATIVATION~regout\ : std_logic;
SIGNAL \cmp_food_flag~combout\ : std_logic;
SIGNAL \STATE~8_combout\ : std_logic;
SIGNAL \fsm_s_game_over~combout\ : std_logic;
SIGNAL \cnt_rdy~combout\ : std_logic;
SIGNAL \fsm_s_done~combout\ : std_logic;
SIGNAL \STATE~13_combout\ : std_logic;
SIGNAL \STATE~14_combout\ : std_logic;
SIGNAL \STATE~15_combout\ : std_logic;
SIGNAL \STATE.IDLE~regout\ : std_logic;
SIGNAL \STATE~11_combout\ : std_logic;
SIGNAL \STATE~12_combout\ : std_logic;
SIGNAL \STATE.STEP_ACTIVATION~regout\ : std_logic;
SIGNAL \STATE~9_combout\ : std_logic;
SIGNAL \STATE~10_combout\ : std_logic;
SIGNAL \STATE.FOOD_ACTIVATION~regout\ : std_logic;
SIGNAL \con_sel~0_combout\ : std_logic;
SIGNAL \ALT_INV_STATE.INIT_ATIVATION~regout\ : std_logic;
SIGNAL \ALT_INV_con_sel~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_res <= res;
ww_cnt_rdy <= cnt_rdy;
ww_cmp_food_flag <= cmp_food_flag;
ww_fsm_i_done <= fsm_i_done;
ww_fsm_f_done <= fsm_f_done;
ww_fsm_s_done <= fsm_s_done;
ww_fsm_s_game_over <= fsm_s_game_over;
\con_sel.INIT_CON\ <= \ww_con_sel.INIT_CON\;
\con_sel.FOOD_CON\ <= \ww_con_sel.FOOD_CON\;
\con_sel.STEP_CON\ <= \ww_con_sel.STEP_CON\;
fsm_i_start <= ww_fsm_i_start;
fsm_f_start <= ww_fsm_f_start;
fsm_s_start <= ww_fsm_s_start;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\ALT_INV_STATE.INIT_ATIVATION~regout\ <= NOT \STATE.INIT_ATIVATION~regout\;
\ALT_INV_con_sel~0_combout\ <= NOT \con_sel~0_combout\;

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\res~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_res,
	combout => \res~combout\);

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\fsm_f_done~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_fsm_f_done,
	combout => \fsm_f_done~combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\fsm_i_done~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_fsm_i_done,
	combout => \fsm_i_done~combout\);

-- Location: LCCOMB_X35_Y35_N24
\STATE~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \STATE~7_combout\ = (!\res~combout\ & ((\STATE.INIT_ATIVATION~regout\) # (\fsm_i_done~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \res~combout\,
	datac => \STATE.INIT_ATIVATION~regout\,
	datad => \fsm_i_done~combout\,
	combout => \STATE~7_combout\);

-- Location: LCFF_X35_Y35_N25
\STATE.INIT_ATIVATION\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \STATE~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \STATE.INIT_ATIVATION~regout\);

-- Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\cmp_food_flag~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_cmp_food_flag,
	combout => \cmp_food_flag~combout\);

-- Location: LCCOMB_X35_Y35_N8
\STATE~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \STATE~8_combout\ = (\fsm_f_done~combout\ & (\fsm_i_done~combout\ & (!\STATE.INIT_ATIVATION~regout\))) # (!\fsm_f_done~combout\ & ((\STATE.FOOD_ACTIVATION~regout\) # ((\fsm_i_done~combout\ & !\STATE.INIT_ATIVATION~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_f_done~combout\,
	datab => \fsm_i_done~combout\,
	datac => \STATE.INIT_ATIVATION~regout\,
	datad => \STATE.FOOD_ACTIVATION~regout\,
	combout => \STATE~8_combout\);

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\fsm_s_game_over~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_fsm_s_game_over,
	combout => \fsm_s_game_over~combout\);

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\cnt_rdy~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_cnt_rdy,
	combout => \cnt_rdy~combout\);

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\fsm_s_done~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_fsm_s_done,
	combout => \fsm_s_done~combout\);

-- Location: LCCOMB_X35_Y35_N16
\STATE~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \STATE~13_combout\ = (\fsm_f_done~combout\ & ((\STATE.FOOD_ACTIVATION~regout\) # ((!\cnt_rdy~combout\ & \STATE.IDLE~regout\)))) # (!\fsm_f_done~combout\ & (!\cnt_rdy~combout\ & (\STATE.IDLE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_f_done~combout\,
	datab => \cnt_rdy~combout\,
	datac => \STATE.IDLE~regout\,
	datad => \STATE.FOOD_ACTIVATION~regout\,
	combout => \STATE~13_combout\);

-- Location: LCCOMB_X35_Y35_N26
\STATE~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \STATE~14_combout\ = (!\cmp_food_flag~combout\ & (!\fsm_s_game_over~combout\ & \STATE.STEP_ACTIVATION~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cmp_food_flag~combout\,
	datac => \fsm_s_game_over~combout\,
	datad => \STATE.STEP_ACTIVATION~regout\,
	combout => \STATE~14_combout\);

-- Location: LCCOMB_X35_Y35_N30
\STATE~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \STATE~15_combout\ = (!\res~combout\ & ((\STATE~13_combout\) # ((\fsm_s_done~combout\ & \STATE~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \res~combout\,
	datab => \fsm_s_done~combout\,
	datac => \STATE~13_combout\,
	datad => \STATE~14_combout\,
	combout => \STATE~15_combout\);

-- Location: LCFF_X35_Y35_N31
\STATE.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \STATE~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \STATE.IDLE~regout\);

-- Location: LCCOMB_X35_Y35_N28
\STATE~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \STATE~11_combout\ = (!\fsm_s_game_over~combout\ & (!\cmp_food_flag~combout\ & (!\fsm_s_done~combout\ & \STATE.STEP_ACTIVATION~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_s_game_over~combout\,
	datab => \cmp_food_flag~combout\,
	datac => \fsm_s_done~combout\,
	datad => \STATE.STEP_ACTIVATION~regout\,
	combout => \STATE~11_combout\);

-- Location: LCCOMB_X35_Y35_N22
\STATE~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \STATE~12_combout\ = (!\res~combout\ & ((\STATE~11_combout\) # ((\cnt_rdy~combout\ & \STATE.IDLE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \res~combout\,
	datab => \cnt_rdy~combout\,
	datac => \STATE.IDLE~regout\,
	datad => \STATE~11_combout\,
	combout => \STATE~12_combout\);

-- Location: LCFF_X35_Y35_N23
\STATE.STEP_ACTIVATION\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \STATE~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \STATE.STEP_ACTIVATION~regout\);

-- Location: LCCOMB_X35_Y35_N18
\STATE~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \STATE~9_combout\ = (!\fsm_s_game_over~combout\ & \STATE.STEP_ACTIVATION~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fsm_s_game_over~combout\,
	datad => \STATE.STEP_ACTIVATION~regout\,
	combout => \STATE~9_combout\);

-- Location: LCCOMB_X35_Y35_N10
\STATE~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \STATE~10_combout\ = (!\res~combout\ & ((\STATE~8_combout\) # ((\cmp_food_flag~combout\ & \STATE~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \res~combout\,
	datab => \cmp_food_flag~combout\,
	datac => \STATE~8_combout\,
	datad => \STATE~9_combout\,
	combout => \STATE~10_combout\);

-- Location: LCFF_X35_Y35_N11
\STATE.FOOD_ACTIVATION\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \STATE~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \STATE.FOOD_ACTIVATION~regout\);

-- Location: LCCOMB_X35_Y35_N12
\con_sel~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \con_sel~0_combout\ = (\STATE.FOOD_ACTIVATION~regout\) # (!\STATE.INIT_ATIVATION~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \STATE.FOOD_ACTIVATION~regout\,
	datad => \STATE.INIT_ATIVATION~regout\,
	combout => \con_sel~0_combout\);

-- Location: PIN_AE15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\con_sel.INIT_CON~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_STATE.INIT_ATIVATION~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_con_sel.INIT_CON\);

-- Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\con_sel.FOOD_CON~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STATE.FOOD_ACTIVATION~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_con_sel.FOOD_CON\);

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\con_sel.STEP_CON~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_con_sel~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_con_sel.STEP_CON\);

-- Location: PIN_AD15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\fsm_i_start~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_STATE.INIT_ATIVATION~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_fsm_i_start);

-- Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\fsm_f_start~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STATE.FOOD_ACTIVATION~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_fsm_f_start);

-- Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\fsm_s_start~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STATE.STEP_ACTIVATION~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_fsm_s_start);
END structure;


