library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageshiftRL00.all;--PACKAGESHIFTROTATIONLR00

entity topshiftrotationLR00 is
	port(
		clk0: inout std_logic;--led
		cdiv0: in std_logic_vector(4 downto 0);--controlador de frecuencia
		en0: in std_logic;--carga de registro y desplazamiento
		in0: in std_logic_vector(7 downto 0);--bits de prueba
		out0: out std_logic_vector(7 downto 0)--bits de salida
	);
end topshiftrotationLR00;
--
architecture topshiftrotationLR0 of topshiftrotationLR00 is
begin
	SH00: osc00 port map(oscout0 => clk0,
						cdiv => cdiv0
					);
	
	SH01: shiftrotationLR00 port map(clks => clk0,
						ens => en0,
						ins => in0,
						outs => out0
					);
end topshiftrotationLR0;
