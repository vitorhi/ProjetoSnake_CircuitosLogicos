library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_package.all;

entity tb_fsm_main_seq_2 is

GENERIC (WIDTH: natural :=8);

end tb_fsm_main_seq_2;

architecture test of tb_fsm_main_seq_2 is

	component fsm_main 
		port
		(
		clk				: in STD_LOGIC;			--from system
		res				: in STD_LOGIC;			--from system
		cnt_rdy			: in STD_LOGIC;			--from system
		cmp_food_flag	: in STD_LOGIC;			--from datapath/comparator module
		fsm_i_done		: in STD_LOGIC;			--from fsm_init
		fsm_f_done		: in STD_LOGIC;			--from fsm_food_spawn
		fsm_s_done		: in STD_LOGIC;			--from fsm_step
		fsm_s_game_over	: in STD_LOGIC;			--from fsm_step
		con_sel			: out CONTROL_SELECT;	--to internal
		fsm_i_start		: out STD_LOGIC;		--to fsm_init
		fsm_f_start		: out STD_LOGIC;		--to fsm_food
		fsm_s_start		: out STD_LOGIC			--to fsm_start
		);
	end component;

	component stimuli_fsm_main is
		generic
		(
		WIDTH:         NATURAL := 8;
		CLK_PERIOD		: TIME	:=  10ns
		);

		port
		(
		cnt_rdy		: out STD_LOGIC;			--from system
		cmp_food_flag	: out STD_LOGIC;			--from datapath/comparator module
		fsm_i_done		: out STD_LOGIC;			--from fsm_init
		fsm_f_done		: out STD_LOGIC;			--from fsm_food_spawn
		fsm_s_done		: out STD_LOGIC;			--from fsm_step
		fsm_s_game_over	: out STD_LOGIC	;		--from fsm_step
		clk : out STD_LOGIC;
		rst  : out STD_LOGIC;
		fsm_i_start		: in STD_LOGIC;		--to fsm_init
		fsm_f_start		: in STD_LOGIC;		--to fsm_food
		fsm_s_start		: in STD_LOGIC			--to fsm_start
		);
	end component;

	signal clk_s, rst_s, cnt_rdy_s, cmp_food_flag_s, fsm_i_done_s, fsm_f_done_s, fsm_s_done_s, fsm_s_game_over_s: STD_LOGIC;
	signal fsm_i_start_s, fsm_f_start_s,fsm_s_start_s: STD_LOGIC :='0';
	signal con_sel_s	:CONTROL_SELECT;

begin

	-- Instantiate DUT
	dut : fsm_main 
		port map
		(
		clk				=> clk_s,			
		res				=> rst_s,
		cnt_rdy			=> cnt_rdy_s,			
		cmp_food_flag	=> cmp_food_flag_s,
		fsm_i_done		=> fsm_i_done_s,
		fsm_f_done		=> fsm_f_done_s,
		fsm_s_done		=> fsm_s_done_s,
		fsm_s_game_over	=> fsm_s_game_over_s,
		con_sel			=> con_sel_s,
		fsm_i_start		=> fsm_i_start_s,
		fsm_f_start		=> fsm_f_start_s,
		fsm_s_start		=> fsm_s_start_s
		);

	-- Instantiate stimuli generation module
	test : stimuli_fsm_main
		port map
		(
		cnt_rdy		=> cnt_rdy_s,
		cmp_food_flag	=> cmp_food_flag_s,
		fsm_i_done		=> fsm_i_done_s,
		fsm_f_done		=> fsm_f_done_s,
		fsm_s_done		=> fsm_s_done_s,
		fsm_s_game_over	=> fsm_s_game_over_s,
		clk =>  clk_s,
		rst  => rst_s,
		fsm_i_start		=> fsm_i_start_s,
		fsm_f_start		=> fsm_f_start_s,
		fsm_s_start		=> fsm_s_start_s
		);

end architecture test;