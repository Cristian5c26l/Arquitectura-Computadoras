library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageram00 is
	component osc00
		port(
	cdiv: in std_logic_vector(4 downto 0);
	oscout0: inout std_logic
);
	end component;
	
	component contring00
		port(
		  clkr: in std_logic;
		  enr: in std_logic;
		  outr: out std_logic_vector(3 downto 0)--ya que tengo 4 displays
		  );
	end component;
	
	component coder00
		port(
		clkc: in std_logic;
		resetc: in std_logic;--
		rwc: in std_logic;--
		incontc: in std_logic_vector(3 downto 0);
		inkeyc: in std_logic_vector(3 downto 0);
		outcoderc: out std_logic_vector(6 downto 0);--7 segmentos
		outcontwritec: inout std_logic_vector(5 downto 0);--
		outFlagc: out std_logic--
		);
	end component;
	
	component memram00
		port(
		clkra: in std_logic;
		resetra: in std_logic;
		rwra: in std_logic;
		inFlagra: in std_logic;--bandera para control de escritura
		inwordra: in std_logic_vector(6 downto 0);--7 segmentos
		incontWritera: in std_logic_vector(5 downto 0);
		incontReadra: in std_logic_vector(5 downto 0);--contador de lectura
		outwordra: out std_logic_vector(6 downto 0)--7 segmentos
		);
	end component;
	
	component contRead00
		port(
		clkre: in std_logic;
		resetre: in std_logic;
		rwre: in std_logic;
		incontWritere: in std_logic_vector(5 downto 0);--sirve como tope para el contador de lectura
		outcontRead: inout std_logic_vector(5 downto 0)
		);
	end component;
	
	component muxram00
		port(
		resetmux: in std_logic;
		rwmux: in std_logic;
		inwordcoder: in std_logic_vector(6 downto 0);--palabra que viene del coder
		inwordram: in std_logic_vector(6 downto 0);-- palabra que viene de la ram
		outwordmux: out std_logic_vector(6 downto 0)
		);
	end component;
end packageram00 ;