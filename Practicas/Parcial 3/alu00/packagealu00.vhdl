library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagealu00 is
  component osc00
		port(
	cdiv: in std_logic_vector(4 downto 0);
	oscout0: inout std_logic
		);
  end component;
  
  component anda00 is
    port(   clka: in std_logic;
			functa: in std_logic_vector(5 downto 0);
			inFlaga: in std_logic;
			indatoAa: in std_logic_vector(7 downto 0);
			indatoBa: in std_logic_vector(7 downto 0);
			outa: out std_logic_vector(7 downto 0);
			outFlaga: out std_logic);
  end component;
  
  component ora00 is
    port(   clko: in std_logic;
			functo: in std_logic_vector(5 downto 0);
			inFlago: in std_logic;
			indatoAo: in std_logic_vector(7 downto 0);
			indatoBo: in std_logic_vector(7 downto 0);
			outo: out std_logic_vector(7 downto 0);
			outFlago: out std_logic);
  end component;
  
  component xora00 is
	port(   clkxor: in std_logic;
			functxor: in std_logic_vector(5 downto 0);
			inFlagxor: in std_logic;
			indatoAxor: in std_logic_vector(7 downto 0);
			indatoBxor: in std_logic_vector(7 downto 0);
			outxor: out std_logic_vector(7 downto 0);
			outFlagxor: out std_logic);
  end component;
  
  component nanda00 is
	port(   clkna: in std_logic;
			functna: in std_logic_vector(5 downto 0);
			inFlagna: in std_logic;
			indatoAna: in std_logic_vector(7 downto 0);
			indatoBna: in std_logic_vector(7 downto 0);
			outna: out std_logic_vector(7 downto 0);
			outFlagna: out std_logic);
  end component;
  
  component nora00 is
	port(   clkno: in std_logic;
			functno: in std_logic_vector(5 downto 0);
			inFlagno: in std_logic;
			indatoAno: in std_logic_vector(7 downto 0);
			indatoBno: in std_logic_vector(7 downto 0);
			outno: out std_logic_vector(7 downto 0);
			outFlagno: out std_logic);
  end component;
  
  component xnora00 is
	port(   clkxnor: in std_logic;
			functxnor: in std_logic_vector(5 downto 0);
			inFlagxnor: in std_logic;
			indatoAxnor: in std_logic_vector(7 downto 0);
			indatoBxnor: in std_logic_vector(7 downto 0);
			outxnor: out std_logic_vector(7 downto 0);
			outFlagxnor: out std_logic);
  end component;--
  
  component nota00 is
	port(   clkn: in std_logic;
			functn: in std_logic_vector(5 downto 0);
			inFlagn: in std_logic;
			indatoAn: in std_logic_vector(7 downto 0);
			indatoBn: in std_logic_vector(7 downto 0);
			outn: out std_logic_vector(7 downto 0);--n de not
			outFlagn: out std_logic);
  end component;
  
  component buffera00 is
	port(   clkb: in std_logic;
			functb: in std_logic_vector(5 downto 0);
			inFlagb: in std_logic;
			indatoAb: in std_logic_vector(7 downto 0);
			indatoBb: in std_logic_vector(7 downto 0);
			outb: out std_logic_vector(7 downto 0);--b de buffer
			outFlagb: out std_logic);
  end component;
  
  component ac00 is
    port(
       clkac: in std_logic;
	   enac: in std_logic;
	   inac: in std_logic_vector(7 downto 0);
       inFlagac: in std_logic;
	   outac: out std_logic_vector(7 downto 0);
       outFlagac: out std_logic);
  end component;
  
end packagealu00;