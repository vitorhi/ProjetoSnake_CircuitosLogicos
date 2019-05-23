library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;


entity lsfr is 
   
	port
	(
	clk  : in  STD_LOGIC;
	res : in  STD_LOGIC;
	out_bits   	: out  STD_LOGIC_VECTOR(11 downto 0);
	);
end lsr;

architecture arch of lfsr is

signal q_s	: STD_LOGIC_VECTOR(WIDTH-1 downto 0)	:= (others => '0');

begin

	q <= q_s;

-- Register with active-high clock & asynchronous clear
	process(clk)
	begin
		if clk'EVENT AND clk = '1' then
			if (load = '1') then
				q_s <= d;
			end if;
		end if;
	end process;
   
end arch;