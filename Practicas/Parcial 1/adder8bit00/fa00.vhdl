library ieee;--archivo 7
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagefa00.all;
--esta es una entidad de nivel superior
entity fa00 is
	port(
		C00: in std_logic;
		A00: in std_logic;
		B00: in std_logic;
		S00: out std_logic;
		C01: out std_logic
		);
end fa00;

architecture fa0 of fa00 is
signal Sint1: std_logic;
signal Cint1: std_logic;
signal Cint2: std_logic;
begin
	--lo que entre en A00, se asigna a A0
	--aqui invocamos 3 componentes, que componen a un sumador completo de una columna de 2 bits
	F00: ha00 port map(
						A0 => A00,
						B0 => B00,
						S0 => Sint1,
						C0 => Cint1
						);
	
	F01: ha00 port map(
						A0 => C00,
						B0 => Sint1,
						S0 => S00,
						C0 => Cint2
						);
	
	F02: or00 port map(
						Ao => Cint2,
						Bo => Cint1,
						Yo => C01
						);
	
end fa0;
