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
library procedure_lib;
use procedure_lib.procedure_pack.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity num_gen_with_procedure_2 is
	generic
	(
	WIDTH	: natural := 8
	);
	
	port
	(
	pos_neg			: in STD_LOGIC;
	one_num_gen		: in STD_LOGIC;
	number			: out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
	);
end num_gen_with_procedure_2 ;


architecture arch of num_gen_with_procedure_2 is





--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal pos_neg_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);
signal one_gen_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);

signal rand_num_pa	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);

begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	

	rand_num_p(WIDTH,rand_num_pa);
	
	pos_neg_s	<=	std_logic_vector (to_unsigned(1, pos_neg_s'length))	when (pos_neg = '0') else	
				std_logic_vector (to_signed(-1, pos_neg_s'length))	when (pos_neg = '1') else
				  (others => 'X' );
													
	one_gen_s	<=	pos_neg_s				when (one_num_gen = '0') else
				 rand_num_pa AFTER 8ns	 when (one_num_gen = '1') else
				(others => 'X' );
	
	number		<= 	one_gen_s ;
	
	
end arch;
