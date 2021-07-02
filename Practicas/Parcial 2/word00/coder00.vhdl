library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
port(
	incont: in std_logic_vector(3 downto 0);
	outcoder: out std_logic_vector(6 downto 0)
);
end coder00;

architecture coder0 of coder00 is
begin
	with incont select
		outcoder <= "1001000" when "0111",--H
					"0000001" when "1011",--O
					"1110001" when "1101",--L
					"0001000" when "1110",--A
					"1111111" when others;
end coder0;