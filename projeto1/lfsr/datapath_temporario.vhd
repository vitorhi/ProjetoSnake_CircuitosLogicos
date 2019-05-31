--***************************************************************
--*																*
--*	Title	:													*
--*	Design	:													*
--*	Author	:													*
--*	Email	:													*
--*																*
--***************************************************************
--*																*
--*	Description :												*
--*																*
--***************************************************************
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.snake_package.all;



entity datapath_temporario is
	generic
	(
	WIDTH	: natural := 8
	);
	
	port
	(
	clk				: in STD_LOGIC;
	res				: in STD_LOGIC;
	ctrl_ctrl		: in datapath_ctrl_flags;
	ng_2_alu			: out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
	);
end datapath_temporario ;


architecture arch of datapath_temporario is


component num_gen is 
   
	generic
	(
	WIDTH	: natural := 8
	);
	
	port
	(
	clk				: in STD_LOGIC;
	set				: in STD_LOGIC;
	pos_neg			: in STD_LOGIC;
	one_num_gen		: in STD_LOGIC;
	number			: out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
	);
end component;

--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal ng_pos_neg_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);
signal ng_one_gen_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);
signal ng_2_alu_s: STD_LOGIC_VECTOR(7 downto 0);
signal res_s: STD_LOGIC;

begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	

	INSTANCIA_NUM_GEN: num_gen port map(clk,res_s,ctrl_ctrl.ng_pos_neg,ctrl_ctrl.ng_one_gen,ng_2_alu);
	res_s <= NOT  res;
	

	

	
	
end arch;
