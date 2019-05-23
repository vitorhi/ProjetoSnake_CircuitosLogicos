Library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity full_adder_4 is
	port
	(
	a_in, b_in, c_in	:	in STD_LOGIC;
	z_out, c_out		:	out STD_LOGIC
	);
	
end full_adder_4;


architecture behaviour of full_adder_4 is

begin


	process(a_in, b_in, c_in)
	
	variable aux_xor, aux_and_1, aux_and_2, aux_and_3, c_out_aux, z_out_aux : STD_LOGIC;
	begin

    aux_xor := a_in xor b_in ;
    aux_and_1 := a_in and b_in ; 
    aux_and_2 := a_in and c_in ; 
	aux_and_3 := b_in and c_in ;
	c_out_aux := aux_and_1 or aux_and_2 or aux_and_3 ;
	z_out_aux := aux_xor xor c_in ;
	
	c_out <= c_out_aux AFTER 6 ns;
	z_out <= z_out_aux AFTER 8 ns;
	
	
	end process;
	
	end behaviour;