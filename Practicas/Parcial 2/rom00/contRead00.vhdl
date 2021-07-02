library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;--en simulacion no funciona esta libreria
use lattice.all;

entity contRead00 is
	port(
			clkc: in std_logic;
			enc: in std_logic;
			outc: inout std_logic_vector(4 downto 0)
			);
end contRead00;

architecture contRead0 of contRead00 isbegin--
	pcont: process(clkc)
	begin
		if(clkc'event and clkc='1')then
			case enc is--dipswitch
				when '0' =>
					outc <= (others => '0');
				when '1' =>
					if(outc < "10000")then
						outc <= outc + '1';--el mas solo se usa cuando usamos contadores
					else
						outc <= outc;
					end if;
				when others => null;
			end case;
		end if;
	end process pcont;
end contRead0;
