library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageshifts.all;

entity topshift00 is
	port(
		clk0: inout std_logic;--led. Del OSC00 Y Del RegistroU00
		cdiv0: in std_logic_vector(4 downto 0);--controlador de frecuencia
		en0: in std_logic;--ejecucion del registro
		in0: in std_logic_vector(7 downto 0);--bits de prueba
		controls0: in std_logic_vector(2 downto 0);--Para indicar cuantas posiciones vamos a mover el vector (barrels)
		rul0:in std_logic_vector(2 downto 0);--para elegir que registro o shift queremos ver
		out0: out std_logic_vector(7 downto 0)--bits de salida
	);
end topshift00;
--
architecture topshift0 of topshift00 is
begin
	
	--osc00-
	SH00: osc00 port map(oscout0 => clk0,
						cdiv => cdiv0
					);
	--registro u
	SH01: RegistroU00 port map(
						clks => clk0,
						rul => rul0,
						ens => en0,
						ins => in0,
						controls => controls0,
						outs => out0
	);
	
end topshift0;
