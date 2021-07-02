library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shiftLR00 is
port(
	clks: in std_logic;
	ens: in std_logic;--
	ins: in std_logic_vector(7 downto 0);
	outs: out std_logic_vector(7 downto 0)
);
end shiftLR00;
--
architecture shiftLR0 of shiftLR00 is
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
					sshift(7) <= '0';
					sshift(6 downto 0) <= sshift(7 downto 1);
					outs <= sshift;
				when others => null;
			end case;
		
		end if;
	end process pshift;

end shiftLR0;