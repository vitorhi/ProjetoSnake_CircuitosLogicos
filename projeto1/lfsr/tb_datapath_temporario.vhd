--Libraries and packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.snake_package.all;
library work;
use work.all;

--Entity
entity tb_datapath_temporario is
  
end tb_datapath_temporario;

--Architecture
architecture tb_datapath_arc of tb_datapath_temporario is
  --Component declarations
  component datapath_temporario is 
   
      generic
      (
      WIDTH : natural := 8
      );
      
      port
      (
      clk       : in STD_LOGIC;
      res       : in STD_LOGIC;
      ctrl_ctrl   : in datapath_ctrl_flags;
      ng_2_alu      : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
      );
  end component;
  
  component stimuli_datapath_temporario is
    generic
    (

      CLK_PERIOD    : time  :=  10ns

    );
    port
    (

      CLK       : out std_logic;            --from system
      RES       : out std_logic;            --from system
      CTRL_CTRL   : out datapath_ctrl_flags         --from datapath/overflow module

    );
  end component;

  ----Intermediate signals
  signal clk_s, res_s : std_logic;
  signal ctrl_ctrl_s : datapath_ctrl_flags;
  signal ng_2_alu_s : STD_LOGIC_VECTOR(7 downto 0);

  begin

    BLOCK1: datapath_temporario port map(clk_s,res_s,ctrl_ctrl_s,ng_2_alu_s);
    BLOCK2: stimuli_datapath_temporario port map(clk_s,res_s,ctrl_ctrl_s);
    

end tb_datapath_arc;
