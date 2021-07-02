library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;


entity contRead00 is
	port(
		clkre: in std_logic;
		resetre: in std_logic;
		rwre: in std_logic;
		incontWritere: in std_logic_vector(5 downto 0);--sirve como tope para el contador de lectura
		outcontRead: inout std_logic_vector(5 downto 0)
		);
end contRead00;

architecture contRead0 of contRead00 is
signal scontrol: std_logic_vector(1 downto 0);
begin
scontrol <= (resetre)&(rwre);
	pcontRead: process(clkre)
	begin
		if(clkre'event and clkre = '1')then
			case scontrol is
				when "00" =>
					outcontRead <= "000000";
				when "01" =>
					outcontRead <= "000000";
				when "10" =>
					outcontRead <= "000000";
				when "11" =>
					if(outcontRead < incontWritere)then
						outcontRead  <= outcontRead  + '1';
					else
						outcontRead  <= outcontRead ;
					end if;
				when others => null;
			end case;
		end if;
	end process pcontRead;
end contRead0;