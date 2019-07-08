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
use work.snake_package.all;
use work.vga_package.all;

entity code2rgb is 
	port
	(
	pix_x		: in integer;
	pix_y		: in integer;
	mem_code		: in CODE;
	red      	:  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');   -- Frederik큦 version used 7 to 0
    	green    	:  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');   -- Frederik큦 version used 7 to 0
    	blue     	:  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0'));  -- Frederik큦 version used 7 to 0
end code2rgb;


architecture arch of code2rgb is

--***********************************
--*	TYPE DECLARATIONS	    *
--***********************************

--***********************************
--*	COMPONENT DECLARATIONS	    *
--***********************************

component all_maps
	port	
	(
	my_code				: in code;						--data code in memory
	match_map			: out template_map 					--sketch to screen
	);
end component;

--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal mask		: template_map;
signal bound_mask_x  	: signed (31 downto 0);
signal bound_mask_y  	: signed (31 downto 0);


signal mask_index_x	: integer range 0 to 31 := 0;
signal mask_index_y	: integer range 0 to 31 := 0;

signal mask_x   	: std_logic_vector (4 downto 0);
signal mask_y   	: std_logic_vector (4 downto 0);

signal masked_pix : std_logic;

signal r_raw	: std_logic_vector (9 downto 0);   -- Frederik큦 version used 7 to 0
signal g_raw	: std_logic_vector (9 downto 0);   -- Frederik큦 version used 7 to 0
signal b_raw	: std_logic_vector (9 downto 0);   -- Frederik큦 version used 7 to 0


begin

	--*******************************
	--*  COMPONENT INSTANTIATIONS   *
	--*******************************

	converter:	all_maps	port map
					(
					my_code	=> mem_code,
					match_map => mask
					);



	--*******************************
	--*	SIGNAL ASSIGNMENTS	*
	--*******************************
	
	bound_mask_x <= to_signed(pix_x, 32);
	bound_mask_y <= to_signed(pix_y, 32);

	mask_index_x <= pix_x mod 32;
	mask_index_y <= pix_y mod 32;

	masked_pix <= not mask(mask_index_y)(mask_index_x);

	r_raw	<= (others => masked_pix);
	g_raw	<= (others => '1');
	b_raw	<= (others => masked_pix);

	

	--*******************************
	--*	PROCESS DEFINITIONS	*
	--*******************************
	
	--basic process
	process(mask_x, mask_y, r_raw, g_raw, b_raw)
	begin
		if (bound_mask_x < 256) AND (bound_mask_y < 256) then
			if(mask_index_x < 4 or mask_index_y < 4 or mask_index_x > 27 or mask_index_y > 27) then
				red <= (others => '1');
				green <= (others => '0');
				blue <= (others => '0');
		
			else
				red <= r_raw;
				green <= g_raw;
				blue <= b_raw;
			end if;
		else
				red <= (others => '0');
				green <= (others => '0');
				blue <= (others => '0');
		end if;

	end process;
	

end arch;
