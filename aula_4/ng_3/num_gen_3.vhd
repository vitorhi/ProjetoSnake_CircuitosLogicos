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


entity num_gen_with_function is
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
end num_gen_with_function ;


architecture arch of num_gen_with_function is


--***********************************
--*	SIMPLIFIED FUNTION DECLARATION		*
--***********************************

function rand_num_f(width : NATURAL) return std_logic_vector is
  
	variable res_v : std_logic_vector(WIDTH - 1 downto 0);
	--	Meu numero usp, em decimal, eh 9344921  ****COMPLETAR*** 
    --    	Meu numero usp mod 64, em decimal eh 25 ****COMPLETAR***

	variable n_usp_mod :  unsigned (WIDTH - 1 downto 0);
	


begin
  n_usp_mod:=(to_unsigned(25, number'length));
  res_v := std_logic_vector (n_usp_mod);
  return res_v;
end function;


--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal pos_neg_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);
signal one_gen_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);


begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	

	pos_neg_s	<=	std_logic_vector (to_unsigned(1, pos_neg_s'length))	when (pos_neg = '0') else	
				std_logic_vector (to_signed(-1, pos_neg_s'length))	when (pos_neg = '1') else
				  (others => 'X' );
													
	one_gen_s	<=	pos_neg_s				when (one_num_gen = '0') else
				rand_num_f(WIDTH) AFTER 8ns	 when (one_num_gen = '1') else
				(others => 'X' );
	
	number		<= 	one_gen_s ;
	
	
end arch;
