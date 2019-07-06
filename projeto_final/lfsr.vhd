

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.all;

entity lfsr is 
   
	port
	(
	clk  : in  STD_LOGIC;
	res : in  STD_LOGIC;
	out_bits   	: out  STD_LOGIC_VECTOR(7 downto 0)
	);
end lfsr;

architecture arch of lfsr is

--signal q_s	: STD_LOGIC_VECTOR(WIDTH-1 downto 0)	:= (others => '0');

component reg_reset is 
	port
	(
	clk  : in  STD_LOGIC;
	load : in  STD_LOGIC;
	reset : in STD_LOGIC;
	d   	: in  STD_LOGIC;
	q	: out STD_LOGIC
	);
end component;

signal q_sig	: STD_LOGIC_VECTOR(11 downto 0);
signal xor_sig	: STD_LOGIC_VECTOR(11 downto 0);

begin

GENERATE_XOR: for ii in 0 to 11 generate
	XOR_SIGNALS: if (ii=1) or (ii=4) or (ii=5) or (ii=8) or (ii=9) or (ii=10) or (ii=11) generate
		xor_sig(ii) <= q_sig(ii-1) xor q_sig(11);
	end generate XOR_SIGNALS;
end generate GENERATE_XOR;

LFSR: for I in 0 to 11 generate
	
	

    PRIMEIRO_FLIP: if I=0 generate
      U0: reg_reset port map
         (clk,'1',res,q_sig(11),q_sig(I));
    end generate PRIMEIRO_FLIP;

    ULTIMO_FLIP: if I=11 generate
      U11: reg_reset 	
      	port map(
      		clk=>clk,
      		load=>'1',
      		reset=>res,
      		d=>xor_sig(11),
      		q=>q_sig(11)
      		);
    end generate ULTIMO_FLIP;


    FLIP_XOR: if (I=1) or (I=4) or (I=5) or (I=8) or (I=9) or (I=10) generate
      UX: reg_reset
      	port map(
      		clk=>clk,
      		load=>'1',
      		reset=>res,
      		d=>xor_sig(I),
      		q=>q_sig(I)
      		);
    end generate FLIP_XOR;

    FLIP_NO_XOR: if (I/=1) and (I/=4) and (I/=5) and (I/=8) and (I/=9) and (I/=10) and (I/=0) and (I/=11) generate
      UNX: reg_reset
      	port map(
      		clk=>clk,
      		load=>'1',
      		reset=>res,
      		d=>q_sig(I-1),
      		q=>q_sig(I)
      		);
    end generate FLIP_NO_XOR;

    out_bits(0) <= q_sig(0);
    out_bits(1) <= q_sig(1);
    out_bits(2) <= q_sig(2);
    out_bits(3) <= '0';
    out_bits(4) <= q_sig(3);
    out_bits(5) <= q_sig(4);
    out_bits(6) <= q_sig(5);
    out_bits(7) <= '0';
   

end generate LFSR;

	
   
end arch;