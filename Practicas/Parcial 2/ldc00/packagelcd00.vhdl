library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

package packagelcd00 is

  component osc00
    port(
		cdiv: in std_logic_vector(4 downto 0);
		oscout0: inout std_logic
	);
  end component;
  
  component lcdcontconfig00
    port(
       clkcc: in std_logic;
	   resetcc: in std_logic;
	   inFlagcc: in std_logic;
	   outcontconfigcc: inout std_logic_vector(4 downto 0);
       outFlagcc: out std_logic);
  end component;
  
  component lcdconfig00
    port(
       clkc: in std_logic;
	   resetc: in std_logic;
	   inFlagc: in std_logic;
	   incontc: in std_logic_vector(4 downto 0);
	   outWordc: out std_logic_vector(7 downto 0);
	   outFlagc: out std_logic;
	   RWc: out std_logic;
	   RSc: out std_logic;
       ENc: out std_logic);
  end component;
  
  component lcdContData00
    port(
       clkcd: in std_logic;
	   resetcd: in std_logic;
	   inFlagconfigcd: in std_logic;--viene del módulo de config
	   inFlagdata: in std_logic;-- llega desde el módulo de datos
	   outcontcd: inout std_logic_vector(4 downto 0);
	   RWcd : out std_logic;
	   RScd: out std_logic;
	   ENcd: out std_logic;
       outFlagcd: out std_logic);
  end component;
  
  component lcdData00
    port(
       clkd: in std_logic;
	   resetd: in std_logic;
	   inFlagconfigd: in std_logic;
	   inFlagdc: in std_logic;
	   incontd: in std_logic_vector(4 downto 0);
	   outWordd: out std_logic_vector(7 downto 0);
       outFlagd: out std_logic);
  end component;
  
  component lcdmux00
    port(
       clkmlcd: in std_logic;
	   resetmlcd: in std_logic;
	   inFlagconfigm: in std_logic;
	   RWcd: in std_logic;
	   RScd: in std_logic;
	   ENcd: in std_logic;
	   RWdd: in std_logic;
	   RSdd: in std_logic;
	   ENdd: in std_logic;
	   inWordconfig: in std_logic_vector(7 downto 0);
	   inWordData: in std_logic_vector(7 downto 0);
	   outWordm: out std_logic_vector(7 downto 0);
	   RWm: out std_logic;
	   RSm: out std_logic;
	   ENm: out std_logic);
  end component;

end packagelcd00;