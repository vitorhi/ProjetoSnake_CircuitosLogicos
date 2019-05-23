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


entity num_gen_direct is
	generic
	(
	WIDTH	: natural := 6
	);
	
	port
	(
	pos_neg			: in STD_LOGIC;
	one_num_gen		: in STD_LOGIC;
	number			: out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
	);
end num_gen_direct;


architecture arch of num_gen_direct is


--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal pos_neg_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);
signal one_gen_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);
signal rand_num_direct: UNSIGNED (WIDTH-1 downto 0);


begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	rand_num_direct <= (to_unsigned(9344921, number'length));    
	--	Meu numero usp, em decimal, eh  9344921 ****COMPLETAR*** 
    --  Meu numero usp mod 64, em decimal eh  25 ****COMPLETAR***

	pos_neg_s	<=	std_logic_vector (to_unsigned(1, pos_neg_s'length))	when (pos_neg = '0') else	
				std_logic_vector (to_signed(-1, pos_neg_s'length))	when (pos_neg = '1') else
				  (others => 'X' );
	
	one_gen_s	<=	pos_neg_s	when (one_num_gen = '0') else
				std_logic_vector (rand_num_direct)		when (one_num_gen = '1') else
				(others => 'X' );
	
	number		<= 	one_gen_s ;
	
	
end arch;
