--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

--Entity
entity stimuli_datapath_temporario is
	generic
	(

		CLK_PERIOD		: time	:=  10ns

	);
	port
	(

    CLK				: out std_logic;						--from system
  	RES				: out std_logic;						--from system
  	CTRL_CTRL		: out datapath_ctrl_flags					--from datapath/overflow module

	);
end stimuli_datapath_temporario;

--Architecture
architecture stimuli_datapath_temporario_arc of stimuli_datapath_temporario is
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
    STIMULI: process is
	    begin
	    	--setando para numero numero +1
		    res <= '1';
		    CTRL_CTRL.ng_pos_neg <= '0';
		    CTRL_CTRL.ng_one_gen <= '0';
		    wait for 2*CLK_PERIOD;

		    --setando para numero numero -1
		    CTRL_CTRL.ng_pos_neg <= '1'; 
		    CTRL_CTRL.ng_one_gen <= '0'; 
		    wait for 2*CLK_PERIOD;

		    --setando para numero randomico pelo lfsr
		    CTRL_CTRL.ng_one_gen <= '1'; 
		    res <= '0';
		    wait for CLK_PERIOD;
		    CTRL_CTRL.ng_one_gen <= '1'; 
		    res <= '1';
	    	wait for CLK_PERIOD*20;
	    	
	    end process STIMULI;

end stimuli_datapath_temporario_arc;
