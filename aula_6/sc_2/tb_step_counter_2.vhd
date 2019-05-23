library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_step_counter_2 is

GENERIC (	CLK_PERIOD		: TIME	:=  10 ns);

end tb_step_counter_2 ;

architecture test of tb_step_counter_2 is

	component step_counter_2  
	generic
	(
	COUNT_MAX	: UNSIGNED	:= x"3C"    -- 60 decimal
	);

	port
	(
	clk		: in STD_LOGIC;
	res		: in STD_LOGIC;
	go		: in STD_LOGIC;
	cnt_rdy	: out STD_LOGIC;
	cnt_value	: out UNSIGNED(7 downto 0)
	);
	end component;

	component stimuli_step_counter_2
	generic
	(
	CLK_PERIOD		: TIME	:=  10 ns
	);

	port
	(
	clk		: out STD_LOGIC;
	rst		: out STD_LOGIC;
	cnt_rdy	: in STD_LOGIC;    --from counter: indicates max count
	go	: out STD_LOGIC    --to counter: authorizes new counting 
	);
	end component;

	signal clk_s, rst_s, cnt_rdy_s, go_s: STD_LOGIC :='0';
	signal cnt_value_s	:  UNSIGNED(7 downto 0);

begin

	-- Instantiate DUT
	dut : step_counter_2 
		port map
		(
		clk				=> clk_s,			
		res				=> rst_s,
		go				=> go_s,
		cnt_rdy			=> cnt_rdy_s,	
		cnt_value   		=> cnt_value_s		
				);

	-- Instantiate stimuli generation module
	stim : stimuli_step_counter_2
		generic map ( CLK_PERIOD => CLK_PERIOD)
		port map
		(
		clk				=> clk_s,			
		rst				=> rst_s,
		go				=> go_s,
		cnt_rdy			=> cnt_rdy_s
		);

end architecture test;