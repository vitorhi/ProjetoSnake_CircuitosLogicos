--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

--Entity
entity stimuli_fsm_food is
	generic
	(

		CLK_PERIOD		: time	:=  10ns

	);
	port
	(

		CLK				: out STD_LOGIC;
		RES				: out STD_LOGIC;
		FSM_M_START		: out STD_LOGIC;
		CMP_BODY_FLAG	: out STD_LOGIC

	);
end stimuli_fsm_food;

--Architecture
architecture stimuli_fsm_food_arc of stimuli_fsm_food is
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
			procedure reset_active is
				--GO TO READY
				begin

					RES <= '1';
					wait for 2*CLK_PERIOD;
					RES <= '0';

			end procedure reset_active;

			procedure loop1 is
				--READY -> GEN_NUM -> GEN_NUM -> ...
				begin

					FSM_M_START <= '1';
					CMP_BODY_FLAG <= '1';
					wait for 3*CLK_PERIOD;

			end procedure loop1;

			procedure loop2 is
				--READY -> READY -> ...
				begin

					FSM_M_START <= '0';
					wait for 2*CLK_PERIOD;

			end procedure loop2;

			procedure loop3 is
				--READY -> GEN_NUM -> FOOD_OK -> READY -> ...
				begin

					FSM_M_START <= '1';
					CMP_BODY_FLAG <= '0';
					wait for 3*CLK_PERIOD;

			end procedure loop3;

			begin

				reset_active;
				loop1;
				reset_active;
				loop2;
				reset_active;
				loop3;

    end process STIMULI;

end stimuli_fsm_food_arc;
