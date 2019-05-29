--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

--Entity
entity tb_fsm_init is
  generic(

    CLK_PERIOD		: TIME	:=  10 ns

  );
end tb_fsm_init;

--Architecture
architecture tb_fsm_init_arc of tb_fsm_init is
  --Component declarations
  component fsm_init is
    port(

    	clk				: in STD_LOGIC;						--from system
    	res				: in STD_LOGIC;						--from system
    	fsm_m_start		: in STD_LOGIC;						--from fsm main
    	ofc_of_x		: in STD_LOGIC;						--from datapath/overflow module
    	ofc_of_y		: in STD_LOGIC;						--from datapath/overflow module
    	dp_ctrl 		: out datapath_ctrl_flags;				--to datapath
    	fsm_m_done		: out STD_LOGIC						--to fsm main

  	);
  end component;

  component stimuli_fsm_init is
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
  end component;

  --Intermediate signals
  signal clk_s, res_s, fsm_m_start_s, ofc_of_x_s, ofc_of_y_s : std_logic;

  begin

    --Structural
    BLOCK1 : stimuli_fsm_init port map ( CLK => clk_s, RES => res_s, FSM_M_START => fsm_m_start_s,
      OFC_OF_X => ofc_of_x_s, OFC_OF_Y => ofc_of_y_s );
    BLOCK2 : fsm_init port map ( clk => clk_s, res => res_s, fsm_m_start => fsm_m_start_s,
      ofc_of_x => ofc_of_x_s, ofc_of_y => ofc_of_y_s );

end tb_fsm_init_arc;
