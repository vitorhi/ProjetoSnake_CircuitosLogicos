--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

--Entity
entity tb_fsm_step is
  generic(

    CLK_PERIOD		: TIME	:=  10 ns

  );
end tb_fsm_step;

--Architecture
architecture tb_fsm_step_arc of tb_fsm_step is
  --Component declarations
  component fsm_step is
    port
    (

      clk				: in STD_LOGIC;						--from system
      res				: in STD_LOGIC;						--from system
      fsm_m_start		: in STD_LOGIC;						--from fsm main
      cmp_food_flag	: in STD_LOGIC;						--from datapath/comparator module
      cmp_body_flag	: in STD_LOGIC;						--from datapath/comparator module
      sys_direction	: in direction;						--from system
      dp_ctrl 		: out datapath_ctrl_flags;				--to datapath
      fsm_m_done		: out STD_LOGIC;					--to fsm main
      fsm_m_game_over	: out STD_LOGIC						--to fsm main

    );
  end component;

  component stimuli_fsm_step is
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
  end component;

  --Intermediate signals
  signal clk_s, res_s, fsm_m_start_s, cmp_food_flag_s, cmp_body_flag_s, sys_direction_s : std_logic;

  begin

    --Structural
    BLOCK1 : stimuli_fsm_step port map ( CLK => clk_s, RES => res_s, FSM_M_START => fsm_m_start_s,
      CMP_FOOD_FLAG => cmp_food_flag_s, CMP_BODY_FLAG => cmp_body_flag_s, SYS_DIRECTION => sys_direction_s );
    BLOCK2 : fsm_step port map ( CLK => clk_s, RES => res_s, FSM_M_START => fsm_m_start_s,
      CMP_FOOD_FLAG => cmp_food_flag_s, CMP_BODY_FLAG => cmp_body_flag_s, SYS_DIRECTION => sys_direction_s );

end tb_fsm_step_arc;
