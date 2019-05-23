library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stimuli_fsm_main is
	generic
	(
	WIDTH:         NATURAL := 8;
	CLK_PERIOD		: TIME	:=  10ns
	);

	port
	(
	cnt_rdy		: out STD_LOGIC;				--from counter to fsms
	cmp_food_flag	: out STD_LOGIC;			--from datapath/comparator module
	fsm_i_done		: out STD_LOGIC;			--to fsm_init
	fsm_f_done		: out STD_LOGIC;			--to fsm_food
	fsm_s_done		: out STD_LOGIC;			--to fsm_step
	fsm_s_game_over	: out STD_LOGIC	;			--to fsm_step
	clk : out STD_LOGIC;
	rst	: out STD_LOGIC;
	fsm_i_start		: in STD_LOGIC;		--to fsm_init
	fsm_f_start		: in STD_LOGIC;		--to fsm_food
	fsm_s_start		: in STD_LOGIC			--to fsm_start
	);

end stimuli_fsm_main ;

architecture test of stimuli_fsm_main is
	signal clk_s : STD_LOGIC;

	component clock_generator
		generic (
		CLK_PERIOD		: TIME	:= 10ns
		);

		port (	
		clk		: out STD_LOGIC
		);

end component ;

begin


	clk <=clk_s;

	clock: clock_generator
		port map
		(
		clk		=> clk_s
		);


	sim : process
		
procedure check_fsm(fsm_i_done_value, fsm_f_done_value, fsm_s_done_value, fsm_s_game_over_value, cmp_food_flag_value	: in STD_LOGIC)	is
		begin
			-- Assign values to estimuli_module´s outputs.
			fsm_i_done <= fsm_i_done_value; 
			fsm_f_done <= fsm_f_done_value;
			fsm_s_done <= fsm_s_done_value;
			fsm_s_game_over <= fsm_s_game_over_value; 
			cmp_food_flag <= cmp_food_flag_value;

			wait until rising_edge (clk_s);
			-- Events at the rising edge of next clock cycle
			end procedure check_fsm;

		procedure reset_activate is    -- reset activation procedure
		begin
			wait until falling_edge(CLK_s);
			rst <= '1';
			wait for CLK_PERIOD;
			rst <= '0';
		end procedure reset_activate;


	begin
		-- Apply test vectors
		
		check_fsm('0','0','0','0','0');    -- analyze state transitions
		reset_activate;
		
	-- **initialization state** protocol
		
		while (fsm_i_start /= '1') 
			loop
			check_fsm('0','0','0','0','0');    -- guaranteeing fsm_i_done='0'		
		end loop;
		
		-- emulate some action 
		
		wait for 50*CLK_PERIOD;		

		-- forcing fsm_i_done='1'

		check_fsm('1','0','0','0','0');     -- forcing fsm_i_done='1' and fsm_f_done='0'		

	-- **food state** protocol
		
		while (fsm_f_start /= '1') 
			loop
			check_fsm('1','0','0','0','0');  -- maintaining fsm_i_done='1' and fsm_f_done='0'		
		end loop;
		
		-- emulate some action 
		
		wait for 50*CLK_PERIOD;		

		check_fsm('0','1','0','0','0');    -- forcing fsm_f_done='1' and fsm_s_done='0'

	-- **step state** protocol
		
		while (fsm_s_start /= '1') 
			loop
			check_fsm('0','1','0','0','0');  -- maintaining fsm_f_done='1' and fsm_s_done='0'		
		end loop;
		
		-- emulate some action 
		
		wait for 50*CLK_PERIOD;		

		check_fsm('0','0','0','0','1');    -- forcing fsm_f_done='0', fsm_s_game_over='0' and cmp_food_flag='1', making fsm_main to return to food state	

	-- **food state 2nd time** protocol
		
		while (fsm_f_start /= '1') 
			loop
		check_fsm('0','0','0','0','1');    -- maintaining fsm_f_done='0', fsm_s_game_over='0' and cmp_food_flag='1', making fsm_main to return to food state		
		end loop;
		
		-- emulate some action 
		
		wait for 50*CLK_PERIOD;		

		check_fsm('0','1','0','0','0');    -- forcing fsm_f_done='1' and fsm_s_done='0'

	-- **step state 2nd time** protocol
		
		while (fsm_s_start /= '1') 
			loop
			check_fsm('0','1','0','0','0');  -- maintaining fsm_f_done='1' and fsm_s_done='0'		
		end loop;
		
		-- emulate some action 
		
		wait for 50*CLK_PERIOD;		

		check_fsm('0','0','0','0','0');    -- forcing fsm_f_done='0', fsm_s_game_over='0' and cmp_food_flag='0', making fsm_main to stay in step state

	-- **step state again** protocol
		
		while (fsm_s_start /= '1') 
			loop
			check_fsm('0','0','0','0','0');  -- maintaining fsm_f_done='0', fsm_s_game_over='0' and cmp_food_flag='0'		
		end loop;
		
		-- emulate some action 
		
		wait for 50*CLK_PERIOD;		

		check_fsm('0','0','0','1','0');    -- forcing fsm_s_game_over='1', making fsm_main to go to state game over
		
				
		-- forcing signal: any force on fsm_i, fsm_f, fsm_s, game_over, cmp_food should be useless- fsm must stay in game over.

		check_fsm('1','0','1','0','0');  
		check_fsm('1','0','1','0','0');  
		check_fsm('1','0','1','0','0');  
		check_fsm('0','1','1','0','0');  

		wait;
	end process sim;
end architecture test;