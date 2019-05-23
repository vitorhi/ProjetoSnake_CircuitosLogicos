library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;

entity tb_button_handler is

GENERIC (	CLK_PERIOD		: TIME	:=  10 ns);

end tb_button_handler;

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
  end component;

  --Intermediate signals
  signal clk_s, res_s, load_regs_s, sys_step_jumper_s : std_logic := '0';
  signal sys_direction_s : std_logic_vector( 3 downto 0 ) := "1000";
  signal direction_sync_s : direction;

  begin

    --Structural
    BLOCK1 : button_handler port map ( clk => clk_s, res => res_s, load_regs => load_regs_s, sys_direction => sys_direction_s,
      sys_step_jumper => sys_step_jumper_s, direction_sync => direction_sync_s );
    BLOCK2 : stimuli_button_handler port map ( clk => clk_s, res => res_s, load_regs => load_regs_s, sys_direction => sys_direction_s,
      sys_step_jumper => sys_step_jumper_s, direction_sync => direction_sync_s, step_jumper_sync => '0');

end tb_button_handler_arc;
