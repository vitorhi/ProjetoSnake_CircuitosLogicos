library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.all;

entity lfsr is 
   
	port
	(
	clk  : in  STD_LOGIC;
	res : in  STD_LOGIC;
	out_bits   	: out  STD_LOGIC_VECTOR(11 downto 0)
	);
end lfsr;

architecture arch of lfsr is

--signal q_s	: STD_LOGIC_VECTOR(WIDTH-1 downto 0)	:= (others => '0');

component reg is 
	generic
	(
	WIDTH	: natural  := 1
	);
   
	port
	(
	clk  : in  STD_LOGIC;
	load : in  STD_LOGIC;
	d   	: in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	q	: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
end component;


begin

	
   
end arch;