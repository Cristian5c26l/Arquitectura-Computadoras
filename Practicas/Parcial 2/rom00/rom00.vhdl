library ieee;
use ieee.std_logic_1164.all;
library lattice;--en simulacion no funciona esta libreria
use lattice.all;
use packagerom00.all;

entity rom00 is
	port(clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		en0: in std_logic;
		outc0: inout std_logic_vector(4 downto 0);--salida del contador (leds)
		outro0: out std_logic_vector(6 downto 0);--salida de la memoria (displays)
		outtransist0: out std_logic_vector(3 downto 0)
	);
end rom00;

architecture rom0 of rom00 is
begin
	outtransist0 <= "0111";--
	
	MRO00: osc00 port map(cdiv => cdiv0,--cdiv se conecta con cdiv0
							oscout0 => clk0);--oscout0 se asigna a clk0
							
	MRO01: contRead00 port map(clkc => clk0,--clkc trae el valor de clk0
								 enc => en0,--enc se conecta a en0
								 outc => outc0);--outc se asigna a la salida outc0
								 
	MRO02: memrom00 port map(clkro => clk0,--entrada
							   enro => en0,--entrada
							   incontro => outc0,--entrada
							   outro => outro0--salida de los displays
							   );
end rom0;