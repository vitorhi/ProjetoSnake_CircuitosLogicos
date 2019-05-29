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
    	begin

    end process STIMULI;

end stimuli_fsm_init_arc;
