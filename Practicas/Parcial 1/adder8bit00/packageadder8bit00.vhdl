library ieee;--archivo 9
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageadder8bit00 is
	--basta con crear un componente a pesar de que se emplean 4 xor
	--lo mismo se aplica para los demas componentes que estan en el circuito sumador restador
	component xor00 is
	port(
		Ax: in std_logic;
		Bx: in std_logic;
		Yx: out std_logic);
	end component;
	
	component fa00 is
		port(
		C00: in std_logic;
		A00: in std_logic;
		B00: in std_logic;
		S00: out std_logic;
		C01: out std_logic
		);
	end component;
	
	component and00 
	port(
		Aa: in std_logic;
		Ba: in std_logic;
		Ya: out std_logic);
	end component;
	
	component xnor00 
	port(
	  Anx: in std_logic;
	  Bnx: in std_logic;
	  Ynx: out std_logic);
	end component;
end packageadder8bit00;