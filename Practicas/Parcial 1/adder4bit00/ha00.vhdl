library ieee;--archivo 4. entidad de nivel superior de xor00, and00 y packageha00. Los primeros 4 archivos son basicos
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageha00.all;

entity ha00 is
	port(
			A0: in std_logic;
			B0: in std_logic;
			S0: out std_logic;
			C0: out std_logic);
end ha00;

architecture ha0 of ha00 is
begin
	--no declaramos logica en la entidad superior, solo las conexiones
	--invocamos componentes. Hasta aqui hemos creado el sumador medio
   H00: xor00 port map(Ax => A0,
						Bx => B0, 
						Yx => S0
						);
   
   H01: and00 port map(Aa => A0,
						Ba => B0, 
						Ya => C0
						);

end ha0;