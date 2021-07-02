library ieee;
use ieee.std_logic_1164.all;
library lattice;--en simulacion no funciona esta libreria
use lattice.all;

package packagerom00 is
	component osc00 is
		port(
	cdiv: in std_logic_vector(4 downto 0);
	oscout0: inout std_logic
);
	end component;
	
	component contRead00 is
		port(
			clkc: in std_logic;
			enc: in std_logic;
			outc: inout std_logic_vector(4 downto 0)
			);
	end component;
	
	component memrom00 is
		port(
		clkro: in std_logic;
		enro: in std_logic;
		incontro: in std_logic_vector(4 downto 0);
		outro: out std_logic_vector(6 downto 0)--displays
	);
	end component;

end packagerom00;