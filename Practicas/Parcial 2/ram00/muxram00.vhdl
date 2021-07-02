library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity muxram00 is
	port(
		resetmux: in std_logic;
		rwmux: in std_logic;
		inwordcoder: in std_logic_vector(6 downto 0);--palabra que viene del coder
		inwordram: in std_logic_vector(6 downto 0);-- palabra que viene de la ram
		outwordmux: out std_logic_vector(6 downto 0)
		);
end muxram00;

architecture muxram0 of muxram00 is
signal scontrol: std_logic_vector(1 downto 0);
begin
scontrol <= (resetmux)&(rwmux);--usamos la senial scontrol
	with scontrol select
		outwordmux <= "1111111" when "00",
						"1111111" when "01",
						inwordcoder when "10",
						inwordram when "11",
						"1111111"when others;
end muxram0;