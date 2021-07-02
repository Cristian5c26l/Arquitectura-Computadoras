library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shiftrotationLR00 is
port(
	clks: in std_logic;
	ens: in std_logic;--
	ins: in std_logic_vector(7 downto 0);
	outs: out std_logic_vector(7 downto 0)
);
end shiftrotationLR00;
--
architecture shiftrotationLR0 of shiftrotationLR00 is
signal sshift: std_logic_vector (7 downto 0);
begin
	pshift: process(clks)
	begin
		if(clks'event and clks ='1')then
			case ens is
				when '0' =>
					outs <= (others => '0');
					sshift <= ins;
				when '1' =>
					sshift(7) <= sshift(0);
					sshift(6 downto 0) <= sshift(7 downto 1);
					outs <= sshift;
				when others => null;
			end case;
		
		end if;
	end process pshift;

end shiftrotationLR0;