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

PACKAGE procedure_pack IS
	PROCEDURE rand_num_p(width : IN NATURAL; signal res_v: OUT std_logic_vector) ;
END procedure_pack;

PACKAGE BODY procedure_pack IS
	
	PROCEDURE rand_num_p(width:IN NATURAL; signal res_v : OUT std_logic_vector) IS
			variable n_usp_mod :  unsigned (WIDTH - 1 downto 0);
	BEGIN    -- this function can return a carry
			
			n_usp_mod:=(to_unsigned(25,width));
			res_v <= std_logic_vector (n_usp_mod);
	END rand_num_p;
END procedure_pack;


