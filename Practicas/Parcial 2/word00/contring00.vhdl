library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
port(
		clkc: in std_logic;
		enc: in std_logic;
		outc: out std_logic_vector(3 downto 0)--ya que tengo 4 displays

);
end contring00;

architecture contring0 of contring00 is
signal sshift: std_logic_vector(3 downto 0);
begin
	prot: process(clkc)
	begin
		if(clkc'event and clkc='1')then
			case enc is
				when '0' =>
					outc <= "1111";--anodo comun. Se apagan con unos y se apagan con ceros
					sshift <= "0111";--anodo comun. Se apagan con unos y se apagan con ceros
				when '1' =>
				sshift(3)<=sshift(0);
				sshift(2 downto 0)<=sshift(3 downto 1);
				outc <= sshift;
				when others => null;
			end case;
		end if;
	end process prot;
end contring0;