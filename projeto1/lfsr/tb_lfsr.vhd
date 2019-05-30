--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;

--Entity
entity tb_lfsr is
  
end tb_lfsr;

--Architecture
architecture tb_lfsr_arc of tb_lfsr is
  --Component declarations
  component lfsr is 
   
      port
      (
      clk  : in  STD_LOGIC;
      res : in  STD_LOGIC;
      out_bits    : out  STD_LOGIC_VECTOR(11 downto 0)
      );
  end component;

  component clock_generator is
    generic
    (

      CLK_PERIOD    : time  := 10ns

    );
    port
    (

      CLK   : out std_logic

    );
  end component;
  --Intermediate signals
  signal clk_s : STD_LOGIC;
  signal res_s : STD_LOGIC;
  signal out_bits_s    : STD_LOGIC_VECTOR(11 downto 0);

  
  --component stimuli_lfsr is
  --  generic
  --	(

  --		CLK_PERIOD		: time	:=  10ns

  --	);
  --	port
  --	(

  --	  --Stimulis
  --		CLK					: out std_logic;
  --		RES					: out std_logic;
  --		LOAD_REGS			: out std_logic;
  --		SYS_DIRECTION		: out std_logic_vector(3 downto 0);
  --		SYS_STEP_JUMPER		: out std_logic

  --	);
  --end component;

  ----Intermediate signals
  --signal clk_s, res_s, load_regs_s, sys_step_jumper_s : std_logic;
  --signal sys_direction_s : std_logic_vector( 3 downto 0 );

  begin

    UUT: lfsr port map(clk_s,res_s,out_bits_s);
    CLOCK_INSTANCE: clock_generator port map(clk_s);
    res_s <= '0' , '1' after 40 ns, '0' after 60 ns;
    ----Structural
    --BLOCK1 : stimuli_button_handler port map ( CLK => clk_s, RES => res_s, LOAD_REGS => load_regs_s, SYS_DIRECTION => sys_direction_s,
    --  SYS_STEP_JUMPER => sys_step_jumper_s );
    --BLOCK2 : button_handler port map ( clk => clk_s, res => res_s, load_regs => load_regs_s, sys_direction => sys_direction_s,
    --  sys_step_jumper => sys_step_jumper_s );

end tb_lfsr_arc;
