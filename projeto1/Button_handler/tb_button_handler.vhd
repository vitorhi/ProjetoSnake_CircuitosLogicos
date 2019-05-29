--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

--Entity
entity tb_button_handler is
  generic(

    CLK_PERIOD		: TIME	:=  10 ns

  );
end tb_button_handler;

--Architecture
architecture tb_button_handler_arc of tb_button_handler is
  --Component declarations
  component button_handler is
    port

  	(
  	clk					: in STD_LOGIC;
  	res					: in STD_LOGIC;
  	load_regs			: in STD_LOGIC;
  	sys_direction		: in STD_LOGIC_VECTOR(3 downto 0);
  	sys_step_jumper		: in STD_LOGIC;
  	direction_sync		: out direction;
  	step_jumper_sync	: out STD_LOGIC

  	);
  end component;

  component stimuli_button_handler is
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
  end component;

  --Intermediate signals
  signal clk_s, res_s, load_regs_s, sys_step_jumper_s : std_logic;
  signal sys_direction_s : std_logic_vector( 3 downto 0 );

  begin

    --Structural
    BLOCK1 : stimuli_button_handler port map ( CLK => clk_s, RES => res_s, LOAD_REGS => load_regs_s, SYS_DIRECTION => sys_direction_s,
      SYS_STEP_JUMPER => sys_step_jumper_s );
    BLOCK2 : button_handler port map ( clk => clk_s, res => res_s, load_regs => load_regs_s, sys_direction => sys_direction_s,
      sys_step_jumper => sys_step_jumper_s );

end tb_button_handler_arc;
