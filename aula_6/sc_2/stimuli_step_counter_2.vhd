library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stimuli_step_counter_2 is
	generic
	(
	CLK_PERIOD		: TIME	:=  10 ns
	);

	port
	(
	clk		: out STD_LOGIC;
	rst		: out STD_LOGIC;
	cnt_rdy	: in STD_LOGIC;    --from counter: indicates max count
	go	: out STD_LOGIC    --to counter: authorizes new counting 
	);

end stimuli_step_counter_2 ;

architecture test of stimuli_step_counter_2 is
	signal clk_s : STD_LOGIC;

	component clock_generator
		generic (
		CLK_PERIOD		: TIME	:= 10 ns
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
	procedure check_routine(go_check,rst_check:in STD_LOGIC ) is
		begin
			rst<=rst_check;
			go<= go_check;
			wait for 20ns;
	end procedure check_routine;
	
	procedure check_counter(go_value	: in STD_LOGIC)	is
		begin
			-- Assign values to estimuli_module´s outputs.
			go <= go_value; 

			wait until rising_edge (clk_s);
			-- Events at the rising edge of next clock cycle
	end procedure check_counter;

	procedure reset_activate is    -- reset activation procedure
		begin
			wait until falling_edge(CLK_s);
			rst <= '1';
			wait for CLK_PERIOD;
			rst <= '0';
	end procedure reset_activate;


		begin
			check_routine('1','0');-- Apply test vectors
			
			check_counter('0');    -- initialize

			reset_activate;   -- counter will start

			while (True)
				loop
				
				wait for 1*CLK_PERIOD;
				check_counter('0');        -- making  go='0'

				while (cnt_rdy /= '1') 
					loop
						wait for 1*CLK_PERIOD;
				end loop;
			
				
				wait for 50*CLK_PERIOD;		
				reset_activate;
				wait for 20ns;
				check_counter('1');     -- forcing go='1' and new count starts		

			end loop;

		end process sim;

end architecture test;