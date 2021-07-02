library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageram00.all;

entity ram00 is
	port(
		 outFlag0: inout std_logic;--**
		 clk0: inout std_logic;
		 cdiv0: in std_logic_vector(4 downto 0);
		 re0: in std_logic;
		 rw0: in std_logic;
		 inkey0: in std_logic_vector(3 downto 0);--teclas
		 outr0: inout std_logic_vector(3 downto 0);--se deja al exterior,barrido del teclado
		 outcontWrite0: inout std_logic_vector(5 downto 0);--leds
		 outcontRead0: inout std_logic_vector(5 downto 0);--leds
		 outword0: out std_logic_vector(6 downto 0);--salida al display desde el coder
		 outtransist0: out std_logic_vector(3 downto 0)--solo utilizamos un display de los 4
		 );
end ram00;

architecture ram0 of ram00 is
signal swordCoder,swordRam: std_logic_vector(6 downto 0);
begin
outtransist0 <= "0111";--encendido con 0 porque es display de anodo comun
	RA00: osc00 port map(cdiv => cdiv0,--cdiv se conecta con cdiv0
							oscout0 => clk0);--oscout0 se asigna a clk0
	
	RA01: contring00 port map(clkr => clk0,
								enr => re0,
								outr => outr0--outr se asigna a outr0
								);
	
	RA02: coder00 port map(clkc => clk0,
							resetc => re0,
							rwc => rw0,
							inkeyc => inkey0,
							incontc => outr0,
							outcontwritec => outcontWrite0,
							outcoderc => swordCoder,--bien
							outFlagc => outFlag0 -- parece que si va cuando se presiona outflagc obtiene su valor, y se lo asigna a outflag0
							);
	--------------------------------------------------------------------------------						--bien
	
	RA03: memram00 port map(clkra =>clk0,--in
							resetra =>re0,--in
							rwra =>rw0,--in
							inFlagra => outFlag0,--in 1 bit ?
							incontWritera => outcontWrite0,--in
							incontReadra => outcontRead0,--in
							inwordra => swordCoder,--in 7 bits ?
							outwordra => swordRam --out ?
							);
	
	RA04: contRead00 port map(----
								clkre => clk0,--in
								resetre => re0,--in
								rwre => rw0,--in
								incontWritere => outcontWrite0,--in 6 bits
								outcontRead => outcontRead0--inout 6 bits
								);--
	
	RA05: muxram00 port map(
							resetmux => re0,
							rwmux => rw0,
							inwordcoder => swordCoder,--in 7 bits (palabra que viene del coder) ?
							inwordram =>  swordRam,--in 7 bits (palabra que viene de la ram) ?
							outwordmux => outword0 --out 7 bits
							);--

end ram0;--