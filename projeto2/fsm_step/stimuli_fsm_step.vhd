--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

--Entity
entity stimuli_fsm_step is
	generic
	(

		CLK_PERIOD		: time	:=  10ns

	);
	port
	(

		CLK				: out STD_LOGIC;
		RES				: out STD_LOGIC;
		FSM_M_START		: out STD_LOGIC;
		CMP_FOOD_FLAG	: out STD_LOGIC;
		CMP_BODY_FLAG	: out STD_LOGIC;
	  SYS_DIRECTION	: out direction

	);
end stimuli_fsm_step;

--Architecture
architecture stimuli_fsm_step_arc of stimuli_fsm_step is
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
					wait for 1*CLK_PERIOD;
					RES <= '0';

			end procedure reset_active;

			procedure loop1 is
				--READY -> READY -> ...
				begin

					FSM_M_START <= '0';
					wait for 2*CLK_PERIOD;

			end procedure loop1;

			procedure loop2 is
				--READY -> NEW_POSITION(S_LEFT) -> CHECK('00')(S_DOWN) -> POP_WRITE_TAIL -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_LEFT;
					CMP_FOOD_FLAG <= '0';
					CMP_BODY_FLAG <= '0';
					SYS_DIRECTION <= S_DOWN;
					wait for 4*CLK_PERIOD;

			end procedure loop2;

			procedure loop3 is
				--READY -> NEW_POSITION(S_LEFT) -> CHECK('00')(S_UP) -> POP_WRITE_TAIL -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_LEFT;
					CMP_FOOD_FLAG <= '0';
					CMP_BODY_FLAG <= '0';
					SYS_DIRECTION <= S_UP;
					wait for 4*CLK_PERIOD;

			end procedure loop3;

			procedure loop4 is
				--READY -> NEW_POSITION(S_LEFT) -> CHECK('00')(S_RIGHT) -> POP_WRITE_TAIL -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_LEFT;
					CMP_FOOD_FLAG <= '0';
					CMP_BODY_FLAG <= '0';
					SYS_DIRECTION <= S_RIGHT;
					wait for 4*CLK_PERIOD;

			end procedure loop4;

			procedure loop5 is
				--READY -> NEW_POSITION(S_LEFT) -> CHECK('00')(S_LEFT) -> POP_WRITE_TAIL -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_LEFT;
					CMP_FOOD_FLAG <= '0';
					CMP_BODY_FLAG <= '0';
					SYS_DIRECTION <= S_LEFT;
					wait for 4*CLK_PERIOD;

			end procedure loop5;

			procedure loop6 is
				--READY -> NEW_POSITION(S_LEFT) -> CHECK('10')(S_LEFT) -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_LEFT;
					CMP_FOOD_FLAG <= '1';
					CMP_BODY_FLAG <= '0';
					SYS_DIRECTION <= S_LEFT;
					wait for 4*CLK_PERIOD;

			end procedure loop6;

			procedure loop7 is
				--READY -> NEW_POSITION(S_LEFT) -> CHECK('11')(S_LEFT) -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_LEFT;
					CMP_FOOD_FLAG <= '1';
					CMP_BODY_FLAG <= '1';
					SYS_DIRECTION <= S_LEFT;
					wait for 4*CLK_PERIOD;

			end procedure loop7;

			procedure loop8 is
				--READY -> NEW_POSITION(S_LEFT) -> CHECK('01')(S_LEFT) -> POP_WRITE_TAIL -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_LEFT;
					CMP_FOOD_FLAG <= '0';
					CMP_BODY_FLAG <= '1';
					SYS_DIRECTION <= S_LEFT;
					wait for 4*CLK_PERIOD;

			end procedure loop8;

			procedure loop9 is
				--READY -> NEW_POSITION(S_RIGHT) -> CHECK('01')(S_LEFT) -> POP_WRITE_TAIL -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_RIGHT;
					CMP_FOOD_FLAG <= '0';
					CMP_BODY_FLAG <= '1';
					SYS_DIRECTION <= S_LEFT;
					wait for 4*CLK_PERIOD;

			end procedure loop9;

			procedure loop10 is
				--READY -> NEW_POSITION(S_UP) -> CHECK('01')(S_LEFT) -> POP_WRITE_TAIL -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_UP;
					CMP_FOOD_FLAG <= '0';
					CMP_BODY_FLAG <= '1';
					SYS_DIRECTION <= S_LEFT;
					wait for 4*CLK_PERIOD;

			end procedure loop10;

			procedure loop11 is
				--READY -> NEW_POSITION(S_DOWN) -> CHECK('11')(S_LEFT) -> READY
				begin

					FSM_M_START <= '1';
					SYS_DIRECTION <= S_UP;
					CMP_FOOD_FLAG <= '1';
					CMP_BODY_FLAG <= '1';
					SYS_DIRECTION <= S_LEFT;
					wait for 4*CLK_PERIOD;

			end procedure loop11;

			begin

				reset_active;
				loop1;
				reset_active;
				loop2;
				reset_active;
				loop3;
				reset_active;
				loop4;
				reset_active;
				loop5;
				reset_active;
				loop6;
				reset_active;
				loop7;
				reset_active;
				loop8;
				reset_active;
				loop9;
				reset_active;
				loop10;
				reset_active;
				loop11;

    end process STIMULI;

end stimuli_fsm_step_arc;
