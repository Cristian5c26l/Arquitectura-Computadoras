library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity compuertas00 is
	port(
		A: in std_logic_vector(7 downto 0);-- A y B son las entradas de las compuertas
		B: in std_logic_vector(7 downto 0);-- A y B son las entradas de las compuertas
		Y: out std_logic_vector(7 downto 0);
		OP: in std_logic_vector(2 downto 0);--para seleccionar compuerta
		C: in std_logic;--C ES EL SELECTOR DEL MUX.
		C1M: in std_logic_vector(2 downto 0);--CANAL 1 DEL MULTIPLEXOR
		C2M: in std_logic_vector(2 downto 0);--CANAL 2 DEL MULTIPLEXOR
		Z: out std_logic_vector(2 downto 0)
	);
end compuertas00;
	--Y contiene las salidas de las compuertas
	--Z es la salida del multiplexor
architecture compuertas0 of compuertas00 is
begin
	Z <= C1M when (C='0') else
		C2M when (C='1') else
		unaffected;
		
	Y <= (A or B) when (OP="000") else
		  (A and B) when (OP="001") else
		  (A xor B) when (OP="010") else
		  (not (A or B)) when (OP="011") else
		  (not (A and B)) when (OP="100") else
		  (not (A xor B)) when (OP="101") else
		  (not A) when (OP="110") else
		  unaffected;
end compuertas0;