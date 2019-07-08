library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.ALL;

package vga_package is	


subtype word_t is std_logic_vector(31 downto 0);
type template_map is array(0 to 31) of word_t;

end vga_package ; 
