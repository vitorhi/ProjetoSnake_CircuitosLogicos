--***************************************************************
--*								*
--*	Title	:						*
--*	Design	:						*
--*	Author	:						*
--*	Email	:						*
--*								*
--***************************************************************
--*								*
--*	Description :						*
--*								*
--***************************************************************
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity mem_addr_gen is 
	generic
	(
	POS_BIT_SIZE		: NATURAL 	:= 5;
	MEM_ADDR_WIDTH		: NATURAL	:= 3
	);

	port
	(
	pix_x		: in integer;
	pix_y		: in integer;
	mem_x		: out STD_LOGIC_VECTOR(MEM_ADDR_WIDTH-1 downto 0) := (others => '0');
	mem_y		: out STD_LOGIC_VECTOR(MEM_ADDR_WIDTH-1  downto 0) := (others => '0')
	);
end mem_addr_gen;


architecture arch of mem_addr_gen is

constant msb_mem : natural := MEM_ADDR_WIDTH + POS_BIT_SIZE - 1;


signal 	pix_x_vec : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal 	pix_y_vec : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin

	pix_x_vec <= std_logic_vector(to_signed(pix_x, pix_x_vec'LENGTH));
	pix_y_vec <= std_logic_vector(to_signed(pix_y, pix_y_vec'LENGTH));
	
	mem_x(MEM_ADDR_WIDTH-1 downto 0) <= pix_x_vec(msb_mem downto POS_BIT_SIZE);
	mem_y(MEM_ADDR_WIDTH-1 downto 0) <= pix_y_vec(msb_mem downto POS_BIT_SIZE);


	

end arch;
