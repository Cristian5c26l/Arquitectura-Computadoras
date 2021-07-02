library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity shiftbarrelrotationLR00 is
port(
	clks: in std_logic;
	ens: in std_logic;--
	controls: in std_logic_vector(2 downto 0);
	ins: in std_logic_vector(7 downto 0);
	outs: out std_logic_vector(7 downto 0)
);
end shiftbarrelrotationLR00;
--
architecture shiftbarrelrotationLR0 of shiftbarrelrotationLR00 is
signal sshift: std_logic_vector (7 downto 0);
signal scont: std_logic_vector (3 downto 0);--
begin
	pshift: process(clks)
	begin
		if(clks'event and clks ='1')then
			case ens is
				when '0' =>
					outs <= (others => '0');
					sshift <= ins;
					scont <= (others => '0');
				when '1' =>
					if(scont < controls)then
						scont <= scont + '1';
						sshift(7) <= sshift(0);--sshift0
						sshift(6 downto 0) <= sshift(7 downto 1);
						outs <= sshift;
					else
						scont <= scont;
					end if;
				when others => null;
			end case;
		
		end if;
	end process pshift;

end shiftbarrelrotationLR0;