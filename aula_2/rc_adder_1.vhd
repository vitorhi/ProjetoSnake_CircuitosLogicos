Library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rc_adder_1 is
	generic
	(
	WIDTH	: natural := 4
	);
	port
	(
	a_i, b_i		:	in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
	z_out		:	out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
	c_i			:	in STD_LOGIC;
	c_o			:	out STD_LOGIC
	);
	
end rc_adder_1;


architecture structural of rc_adder_1 is





end structural;

