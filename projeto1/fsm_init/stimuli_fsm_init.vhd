--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

--Entity
entity stimuli_fsm_init is
	generic
	(

		CLK_PERIOD		: time	:=  10ns

	);
	port
	(

    CLK				: out std_logic;						--from system
  	RES				: out std_logic;						--from system
  	FSM_M_START		: out std_logic;						--from fsm main
  	OFC_OF_X		: out std_logic;						--from datapath/overflow module
  	OFC_OF_Y		: out std_logic						--from datapath/overflow module

	);
end stimuli_fsm_init;

--Architecture
architecture stimuli_fsm_init_arc of stimuli_fsm_init is
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
				--GO TO RESET_ROW
				begin

					RES <= '1';
					wait for 5*CLK_PERIOD;
					RES <= '0';

			end procedure reset_active;

			procedure loop1 is
				--RESET_ROW -> JUMP_ROW -> WRITE_HEAD -> READY -> RESET_ROW
				begin

					FSM_M_START <= '1';
					OFC_OF_X <= '1';
					OFC_OF_Y <= '1';
					wait for 5*CLK_PERIOD;

			end procedure loop1;

			procedure loop2 is
				--RESET_ROW -> JUMP_ROW -> RESET_ROW
				begin

					FSM_M_START <= '1';
					OFC_OF_X <= '1';
					OFC_OF_Y <= '0';
					wait for 3*CLK_PERIOD;

			end procedure loop2;

			procedure loop3 is
				--RESET_ROW -> RESET_ROW
				begin

					FSM_M_START <= '1';
					OFC_OF_X <= '0';
					OFC_OF_Y <= '1';
					wait for 2*CLK_PERIOD;

			end procedure loop3;

			procedure loop4 is
				--RESET_ROW -> JUMP_ROW -> WRITE_HEAD -> READY -> READY
				begin

					FSM_M_START <= '1';
					OFC_OF_X <= '1';
					OFC_OF_Y <= '1';
					wait for 4*CLK_PERIOD;
					FSM_M_START <= '0';
					wait for CLK_PERIOD;

			end procedure loop4;

			begin

				reset_active;
				loop1;
				reset_active;
				loop2;
				reset_active;
				loop3;
				reset_active;
				loop4;

    end process STIMULI;

end stimuli_fsm_init_arc;
