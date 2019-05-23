--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

entity stimuli_button_handler is
  --Clock_generator
	generic
	(

	CLK_PERIOD		: TIME	:=  10ns

	);
  --button_handler port
  port
	(

  --Outs
	clk					: out STD_LOGIC;
	res					: out STD_LOGIC;
	load_regs			: out STD_LOGIC;
	sys_direction		: out STD_LOGIC_VECTOR(3 downto 0);
	sys_step_jumper		: out STD_LOGIC;

  --Ins
	direction_sync		: in direction;
	step_jumper_sync	: in STD_LOGIC

	);
end stimuli_button_handler;

architecture stimuli_button_handler_arc of stimuli_button_handler is
  --Intermediate signals
  signal clk_s : std_logic;

  --Component Declarations
    --Clock_generator declaration
  component clock_generator is
    generic
  	(

  	CLK_PERIOD		: TIME	:= 10ns

    );
  	port
  	(

    clk		: out STD_LOGIC

    );
  end component;

  begin

    --Data-flow
    clk <= clk_s;

    --Structural
    BLOCK1 : clock_generator port map ( clk => clk_s );

    --Behavioral
    SIM : process is

		--PROCEDURES
		procedure check_direction( sys_direction_value : in std_logic_vector ( 3 downto 0 ) ) is
			begin

				sys_direction <= sys_direction_value;
				wait until rising_edge ( clk_s );

		end procedure check_direction;

		procedure reset_activate is
			begin

				wait until falling_edge(CLK_s);
				res <= '1';
				wait for CLK_PERIOD;
				res <= '0';

		end procedure reset_activate;

		procedure check_load_regs( load_regs_value : in std_logic ) is
		begin

			load_regs <= load_regs_value;
			wait until rising_edge ( clk_s );

		end procedure check_load_regs;

		begin

			reset_activate;
			check_direction("1000");
			wait for 2*CLK_PERIOD;
			check_direction("1001");
			wait for 2*CLK_PERIOD;
			check_direction("0001");
			wait for CLK_PERIOD;

    end process SIM;

end stimuli_button_handler_arc;
