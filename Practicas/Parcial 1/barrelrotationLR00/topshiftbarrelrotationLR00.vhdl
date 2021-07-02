library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageshiftRL00.all;

entity topshiftbarrelrotationLR00 is
	port(
		clk0: inout std_logic;--led
		cdiv0: in std_logic_vector(4 downto 0);--controlador de frecuencia
		en0: in std_logic;--carga de registro y desplazamiento
		in0: in std_logic_vector(7 downto 0);--bits de prueba
		controls0: in std_logic_vector(2 downto 0);--ver si esto esta bien
		out0: out std_logic_vector(7 downto 0)--bits de salida
	);
end topshiftbarrelrotationLR00;
--
architecture topshiftbarrelrotationLR0 of topshiftbarrelrotationLR00 is
begin
	SH00: osc00 port map(oscout0 => clk0,
						cdiv => cdiv0
					);
	
	SH01: shiftbarrelrotationLR00 port map(clks => clk0,
						ens => en0,
						ins => in0,
						controls => controls0,
						outs => out0
					);
end topshiftbarrelrotationLR0;
