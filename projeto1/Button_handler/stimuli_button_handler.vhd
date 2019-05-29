--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

--Entity
entity stimuli_button_handler is
	generic
	(

		CLK_PERIOD		: time	:=  10ns

	);
	port
	(

	  --Stimulis
		CLK					: out std_logic;
		RES					: out std_logic;
		LOAD_REGS			: out std_logic;
		SYS_DIRECTION		: out std_logic_vector(3 downto 0);
		SYS_STEP_JUMPER		: out std_logic

	);
end stimuli_button_handler;

--Architecture
architecture stimuli_button_handler_arc of stimuli_button_handler is
  --Intermediate signals
  signal clk_s : std_logic;

  --Component Declarations
  component clock_generator is
		generic
		(

			CLK_PERIOD		: time	:= 10ns

		);
		port
		(

			CLK		: out std_logic

		);
  end component;

  begin

    --Data-flow
    clk <= clk_s;

    --Structural
    BLOCK1 : clock_generator port map ( clk => clk_s );

    --Behavioral
    STIMULI : process is
			--PROCEDURES
			procedure initial_values is
				--Set the initial values
				begin

					res <= '0';
					load_regs <= '1';
					sys_step_jumper <= '0';
					sys_direction <= "0001"; --Right
					wait for CLK_PERIOD;

			end procedure initial_values;

			procedure opposite_dir is
				--Test the responsive to an opposite direction input
				begin

					sys_direction <= "0001"; --Right
					wait for CLK_PERIOD;
					sys_direction <= "0010"; --left
					wait for CLK_PERIOD;

			end procedure opposite_dir;

			procedure all_dirs is
				--Test the inputs of the directions set
				begin

					sys_direction <= "1000"; --Down
					wait for CLK_PERIOD;
					sys_direction <= "0001"; --Right
					wait for CLK_PERIOD;
					sys_direction <= "0100"; --Up
					wait for CLK_PERIOD;
					sys_direction <= "0010"; --Left
					wait for CLK_PERIOD;

			end all_dirs;

			procedure reset_active is
				--Test the output to a reset input
				begin

					res <= '1';
					wait for CLK_PERIOD;
					res <= '0';

			end procedure reset_active;

			procedure step_jumper is
				--Test the output to a step jumper input
				begin

					sys_step_jumper <= '1';
					wait for CLK_PERIOD;
					sys_step_jumper <= '0';

			end procedure step_jumper;

			procedure wrong_input_dirs is
				--Test the responsive to wrong directions inputs
				begin

					sys_direction <= "1111";
					wait for CLK_PERIOD;
					sys_direction <= "0000";
					wait for CLK_PERIOD;
					sys_direction <= "1010";
					wait for CLK_PERIOD;

			end procedure wrong_input_dirs;

			begin

				initial_values;
				wait for 2*CLK_PERIOD; --Is it keeping the same direction if there isn't any button input?
				opposite_dir;
				all_dirs;
				reset_active;
				step_jumper;
				wrong_input_dirs;
				wait for CLK_PERIOD;

    end process STIMULI;

end stimuli_button_handler_arc;
