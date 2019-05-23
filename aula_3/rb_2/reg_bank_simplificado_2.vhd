--***************************************************************
--*																*
--*	Title	:													*
--*	Design	:													*
--*	Author	:													*
--*	Email	:													*
--*																*
--***************************************************************
--*																*
--*	Description :												*
--*																*
--***************************************************************
package my_package is

	 type RB_SEL is	(
					HEAD_OUT,
					REG2_OUT,
					FIFO_OUT
					);
					
end package;



library IEEE;
use IEEE.std_logic_1164.all;

use work.my_package.all;



entity reg_bank is 
	generic
	(
	WIDTH		: NATURAL	:= 8
	);

	port
	(
	out_sel		: in RB_SEL;
	rb_out		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
end reg_bank;


architecture process_case of reg_bank is


--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal head_out_s	: STD_LOGIC_VECTOR(WIDTH-1 downto 0) 	:= "11111111";
signal reg2_out_s	: STD_LOGIC_VECTOR(WIDTH-1 downto 0)	:= "00000000";
signal fifo_out_s	: STD_LOGIC_VECTOR(WIDTH-1 downto 0)	:= "01010101";

begin


process (out_sel)
			begin
				case out_sel 	is
					when HEAD_OUT	=> 	rb_out	<= 	head_out_s;
												
					when REG2_OUT 	=>  	rb_out	<= 	reg2_out_s;
												
					when FIFO_OUT 	=>  rb_out	<= 	fifo_out_s;
									
					when others	=> null;
			
				end case;
			end process;

				

end process_case;
