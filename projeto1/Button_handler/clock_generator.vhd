--Libraries
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity clock_generator is
	generic
	(

		CLK_PERIOD		: time	:= 10ns

	);
	port
	(

		CLK		: out std_logic

	);
end clock_generator ;

--Architecture
architecture clock_generator_arc of clock_generator is
	begin

	GENERATION : process is
		begin

			CLK <= '1';
			wait for CLK_PERIOD / 2;
			CLK <= '0';
			wait for CLK_PERIOD / 2;

		end process GENERATION;

end architecture clock_generator_arc;
