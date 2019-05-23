library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_mem_2_port is

GENERIC (WIDTH: natural :=8);

end testbench_mem_2_port;

architecture test of testbench_mem_2_port is

	component mem_2_port
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		byteena_a		: IN STD_LOGIC_VECTOR (0 DOWNTO 0) :=  (OTHERS => '1');
		clock		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;

	component stimuli_mem_2_port is
		generic
		(
		WIDTH:         NATURAL := 8;
		CLK_PERIOD		: TIME	:=  10ns
		);

		port
		(
		address_a		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
		address_b		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
		byteena_a		: OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
		clk				: OUT STD_LOGIC ;
		data_a			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a			: OUT STD_LOGIC ;
		wren_b			: OUT STD_LOGIC ;
		q_a				: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b				: IN STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;

	signal address_a_s, address_b_s: STD_LOGIC_VECTOR (5 DOWNTO 0);
	signal byteena_a_s: STD_LOGIC_VECTOR (0 DOWNTO 0);
	signal clk_s, wren_a_s, wren_b_s:  STD_LOGIC ;
	signal data_a_s, data_b_s, q_a_s, q_b_s: STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

	-- Instantiate mem_2-port
	dut : mem_2_port
		port map
		(address_a		=>address_a_s,
		address_b		=>address_b_s,
		byteena_a		=>byteena_a_s,
		clock				=>clk_s ,
		data_a			=>data_a_s,
		data_b			=>data_b_s,
		wren_a			=>wren_a_s,
		wren_b			=>wren_b_s,
		q_a				=>q_a_s,
		q_b				=>q_b_s
		
			);

	-- Instantiate stimuli generation module
	stim: stimuli_mem_2_port
		port map
		(address_a		=>address_a_s,
		address_b		=>address_b_s,
		byteena_a		=>byteena_a_s,
		clk				=>clk_s ,
		data_a			=>data_a_s,
		data_b			=>data_b_s,
		wren_a			=>wren_a_s,
		wren_b			=>wren_b_s,
		q_a				=>q_a_s,
		q_b				=>q_b_s
		
		);

end architecture test;