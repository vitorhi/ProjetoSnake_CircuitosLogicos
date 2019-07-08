--***************************************************************
--*								*
--*	Title	:						*
--*	Design	:						*
--*	Author	:						*
--*	Email	:						*
--*								*
--***************************************************************
--*								*
--*	Description :						*
--*								*
--***************************************************************
library IEEE;
use IEEE.std_logic_1164.all;
use work.snake_package.all;

entity vga_interface is 
	generic
	(
	COR_WIDTH		: NATURAL	:= 3	--Width of one coordinate space addresing ( square of (2 ^ COR_WIDTH) x (2 ^ COR_WIDTH) )
	);
	port
	(
	clk		: in std_logic;
	reset_n	: in std_logic;
	-- for memory access
	mem_code		: in CODE;
	mem_x		: out STD_LOGIC_VECTOR(COR_WIDTH-1 downto 0);
	mem_y		: out STD_LOGIC_VECTOR(COR_WIDTH-1  downto 0);
	--for vga module rgb	
	red      	: OUT STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');  -- Frederik큦 version used 7 to 0
    	green    	: OUT STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');  -- Frederik큦 version used 7 to 0
    	blue     	: OUT STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');  -- Frederik큦 version used 7 to 0
	--for vga module from controler
	h_sync		: out std_logic;
	v_sync		: out std_logic; 
	n_blank		: out std_logic;
	n_sync		: out std_logic;
	vga_clk		: out std_logic
	);
end vga_interface;


architecture arch of vga_interface is

--***********************************
--*	TYPE DECLARATIONS				*
--***********************************



--***********************************
--*	COMPONENT DECLARATIONS			*
--***********************************

component vga_controller
  GENERIC(
    h_pulse  :  INTEGER   := 96;   --horiztonal sync pulse width in pixels
    h_bp     :  INTEGER   := 48;   --horiztonal back porch width in pixels
    h_pixels :  INTEGER   := 640;  --horiztonal display width in pixels
    h_fp     :  INTEGER   := 16;   --horiztonal front porch width in pixels
    h_pol    :  STD_LOGIC := '0';   --horizontal sync pulse polarity (1 = positive, 0 = negative)
    v_pulse  :  INTEGER   := 2;     --vertical sync pulse width in rows
    v_bp     :  INTEGER   := 33;    -- or 31 (example of altera!!!)vertical back porch width in rows
    v_pixels :  INTEGER   := 480;  --vertical display width in rows
    v_fp     :  INTEGER   := 10;     --or 11 (example of altera!!!) vertical front porch width in rows
    v_pol    :  STD_LOGIC := '0');  --vertical sync pulse polarity (1 = positive, 0 = negative)
  PORT(
    pixel_clk :  IN   STD_LOGIC;  --pixel clock at frequency of VGA mode being used
    reset_n   :  IN   STD_LOGIC;  --active low asycnchronous reset
    h_sync    :  OUT  STD_LOGIC;  --horiztonal sync pulse
    v_sync    :  OUT  STD_LOGIC;  --vertical sync pulse
    disp_ena  :  OUT  STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    column    :  OUT  INTEGER;    --horizontal pixel coordinate
    row       :  OUT  INTEGER;    --vertical pixel coordinate
    n_blank   :  OUT  STD_LOGIC;  --direct blacking output to DAC
    n_sync    :  OUT  STD_LOGIC; --sync-on-green output to DAC
    vga_clk   :  OUT  STD_LOGIC);  --clock DAC

END component;

component mem_addr_gen 
	generic
	(
	POS_BIT_SIZE		: NATURAL 	:= 5;
	MEM_ADDR_WIDTH		: NATURAL	:= 3
	);

	port
	(
	pix_x		: in integer;
	pix_y		: in integer;
	mem_x		: out STD_LOGIC_VECTOR(COR_WIDTH-1  downto 0);
	mem_y		: out  STD_LOGIC_VECTOR(COR_WIDTH-1  downto 0)	
	);
end component;

component code2rgb 
	port
	(
	pix_x		: in integer;
	pix_y		: in integer;
	mem_code		: in    CODE;
	red      	:  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');   -- Frederik큦 version used 7 to 0
    	green    	:  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');   -- Frederik큦 version used 7 to 0
    	blue     	:  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0'));  -- Frederik큦 version used 7 to 0
end component;

--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal pix_clk_s	: std_logic;
signal disp_en_s	: std_logic;
signal pix_x_s		: integer;
signal pix_y_s		: integer;






begin

	--*******************************
	--*  COMPONENT INSTANTIATIONS	*
	--*******************************


	
	vga_control:	vga_controller	port map
					(
    					pixel_clk => clk,
					reset_n   => reset_n,
					h_sync    => h_sync,
					v_sync    => v_sync,
					disp_ena  => disp_en_s,
					column    => pix_x_s,
					row       => pix_y_s,
					n_blank   => n_blank,
					n_sync    => n_sync,
					vga_clk   => vga_clk
					);

	m_add_gen:	mem_addr_gen	generic map (MEM_ADDR_WIDTH => COR_WIDTH) 
					port map
					(
					pix_x => pix_x_s,
					pix_y => pix_y_s,
					mem_x => mem_x,
					mem_y => mem_y
					);
	

	img_gen:	code2rgb	port map
					(
					pix_x	=> pix_x_s,
					pix_y	=> pix_y_s,
					mem_code	=> mem_code,
					red	=> red,
				    	green	=> green,
				    	blue	=> blue
					);

	

end arch;
