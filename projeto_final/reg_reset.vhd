library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.all;

-- Criando um registrador com reset
entity reg_reset is

	port
	(
	clk  : in  STD_LOGIC;
	load : in  STD_LOGIC;
	reset : in STD_LOGIC;
	d   	: in  STD_LOGIC;
	q	: out STD_LOGIC
	);

end reg_reset;

architecture arch_reg of reg_reset is

--signal q_s	: STD_LOGIC_VECTOR(WIDTH-1 downto 0)	:= (others => '0');

component reg is
	generic
	(
	WIDTH	: natural  := 8
	);

	port
    (
  	clk  : in  STD_LOGIC;
  	load : in  STD_LOGIC;
  	clr : in STD_LOGIC;
  	d   	: in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
  	q	: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
  	);
end component;

signal d_or:STD_LOGIC_VECTOR(0 downto 0);


begin


	REG_1:reg
		generic map (WIDTH => 1)
		port map(
			clk => clk,
			load => load,
      clr => '0',
			d(0) => d_or(0),
			q(0) =>  q);

	d_or(0) <= reset or d ;



end arch_reg;
