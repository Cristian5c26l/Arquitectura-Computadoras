library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageosc00.all;

entity osc00 is
port(
	cdiv: in std_logic_vector(4 downto 0);
	oscout0: inout std_logic
);
end osc00;
--
architecture osc0 of osc00 is
signal sclk: std_logic;
begin
	OSC00: oscint00 port map(osc_int => sclk);
	
	OSC01: div00 port map(
						clkdiv => sclk,
						indiv => cdiv,
						oscout => oscout0
	);

end osc0;