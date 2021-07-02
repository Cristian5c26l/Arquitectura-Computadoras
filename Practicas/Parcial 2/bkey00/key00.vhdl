library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagekey00.all;

entity key00 is
	port(
		cdiv0: in std_logic_vector(4 downto 0);
		clk0: inout std_logic;
		en0: in std_logic;
		inkey0: in std_logic_vector(3 downto 0);--teclas
		outr0: inout std_logic_vector(3 downto 0);--teclado
		outtransist: out std_logic_vector(3 downto 0);
		outcoder0: out std_logic_vector(6 downto 0)--salida a los displays
	);
end key00;

architecture key0 of key00 is 
begin
	outtransist <= "0111";
	K00: osc00 port map(oscout0 => clk0,--la salida generada por lo de abajo se asigna a clk0, que es un led exterior clk0 es un led
						cdiv => cdiv0--cdiv se conecta a lo que asignamos como entrada, cdiv0 es un switch de 5 interruptores
					);
					
	K01: contring00 port map(enr => en0,
							  clkr => clk0,--clkr se conecta con el valor que este en clk0 en clk0
							  outr => outr0--la salida que se genera en outr se asigna a outr0
							);
	
	k02: coder00 port map(inkeyc => inkey0,
							incontc => outr0,--incontc es una entrada que se conecta con lo que hay en outr0
							clkc => clk0,
							outcoderc => outcoder0--la salida asignada a outcoderc se conecta a outcoder0 
								);
end key0;
