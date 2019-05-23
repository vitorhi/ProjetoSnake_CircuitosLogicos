--***************************************************************
--*																*
--*	Title	:	Step Counter									*
--*	Design	:	snake_hw										*
--*	Author	:	Frederik Luehrs									*
--*	Email	:	luehrs.fred@gmail.com							*
--*																*
--***************************************************************
--*																*
--*	Description :												*
--*																*
--***************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity step_counter_2 is 
	generic
	(
	COUNT_MAX	: UNSIGNED	:= x"3C"    -- 60 decimal
	);

	port
	(
	clk		: in STD_LOGIC;
	res		: in STD_LOGIC;
	go		: in STD_LOGIC;
	cnt_rdy	: out STD_LOGIC;
	cnt_value	: out UNSIGNED(7 downto 0)
	);
end step_counter_2;


architecture arch of step_counter_2 is

--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal cnt_s	: UNSIGNED (7 downto 0)	:= x"00";


begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	cnt_rdy	<= 	'1' when (cnt_s = COUNT_MAX) else
				'0';	
	
	--*******************************
	--*	PROCESS DEFINITIONS			*
	--*******************************
				
	--increment counter each cycle
	--reset if max reached or clr is set
	process(clk, res)
	begin
		if clk'event and clk = '1' then
			if(res = '1') then
				cnt_s <= x"00";
			elsif(cnt_s /= COUNT_MAX) then
				cnt_s <= cnt_s + 1;
			elsif (go = '1') then
				cnt_s <= x"00";
			else
				cnt_s <= cnt_s; 		
			end if;
		end if;
	end process;

	cnt_value <= cnt_s;
end arch;
