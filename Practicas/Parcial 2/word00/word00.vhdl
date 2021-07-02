library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageword00.all;

entity word00 is
	port(
		clk0: inout std_logic;--del contring00 y el osc00
		cdiv0: in std_logic_vector(4 downto 0);
		en0: in std_logic;
		outcoder0: out std_logic_vector(6 downto 0);
		outtransist0: inout std_logic_vector(3 downto 0)
		
	);

end word00;

architecture word0 of word00 is
begin
	--osc00-
	W00: osc00 port map(oscout0 => clk0,--la salida generada por lo de abajo se asigna a clk0, que es un led exterior clk0 es un led
						cdiv => cdiv0--cdiv se conecta a lo que asignamos como entrada, cdiv0 es un switch de 5 interruptores
					);
	
	--contring00
	W01: contring00 port map(
							clkc => clk0,--a su vez, clkc se alimenta de lo que hay en clk0 que esta en el exterior
							enc => en0,--se toma la ejecucion del exterior. enc 'jala el valor' de en0. en0 es un interrumptor de un switch
							outc => outtransist0--la salida outc se asigna directamente a la salida exterior outtransist0 
	);
	
	--
	W02: coder00 port map(
						incont => outtransist0,--incont se conecta con el valor exterior que esta en los transistores
						outcoder => outcoder0--la salida outcoder se asigna a la salida exterior outcoder0 , outcode0 son los displays de 7 segmentos
	);

end word0;