library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageosc00.all;

entity osc00 is
port(
	indiv0: in std_logic_vector(4 downto 0);
       oscout0: inout std_logic;
       indiv01: in std_logic_vector(4 downto 0);
       oscout01: inout std_logic);
end osc00;
--
architecture osc0 of osc00 is
signal sclk: std_logic;
begin
  
  UD00: oscint00 port map(osc_int => sclk);
  
  UD01: div00 port map(clkdiv => sclk,
                       indiv => indiv0,
                       oscout => oscout0);

  UD02: div01 port map(clkdiv => sclk,
                       indiv => indiv01,
                       oscout => oscout01);

end osc0;