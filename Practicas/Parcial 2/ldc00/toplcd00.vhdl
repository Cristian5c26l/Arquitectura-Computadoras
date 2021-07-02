library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;
use packagelcd00.all;

entity toplcd00 is
  port(
       clk0: inout std_logic;
	   reset0: in std_logic;
	   cdiv0: in std_logic_vector(4 downto 0);--estaba 3
	   soutFlagconfig0: inout std_logic;
	   soutFlagContConfig0: inout std_logic;
	   soutFlagContData0: inout std_logic;
	   soutFlagData0: inout std_logic;
	   soutContConfig0: inout std_logic_vector(4 downto 0);
	   soutContData0: inout std_logic_vector(4 downto 0);
	   outWordlcd0: out std_logic_vector(7 downto 0);
	   RW0: out std_logic;
	   RS0: out std_logic;
       EN0: out std_logic);
end toplcd00;

architecture toplcd0 of toplcd00 is
signal soutWordConfig, soutWordData: std_logic_vector(7 downto 0);
signal sRWc, sRSc, sENc: std_logic;
signal sRWd, sRSd, sENd: std_logic;
begin
  LC00: osc00 port map(oscout0 => clk0,
                          cdiv => cdiv0);
  
  LC001: lcdContConfig00 port map(clkcc => clk0,
                                 resetcc => reset0,
								 inFlagcc => soutFlagconfig0,
								 outcontconfigcc => soutContConfig0,
                                 outFlagcc => soutFlagContConfig0);
  
  LC02: lcdConfig00 port map(clkc => clk0,
                            resetc => reset0,
							inFlagc => soutFlagContConfig0,
							incontc => soutContConfig0,
							outWordc => soutWordConfig,
							outFlagc => soutFlagconfig0,
							RWc => sRWc,
							RSc => sRWc,
                            ENc => sEnc);
  
  LC03: lcdContData00 port map(clkcd => clk0,
                               resetcd => reset0,
							   inFlagconfigcd => soutFlagconfig0,
							   inFlagdata => soutFlagData0,
							   outcontcd => soutContData0,
							   RWcd => sRWd,
							   RScd => sRSd,
                               ENcd => sENd,
							   outFlagcd => soutFlagContData0);
  
  LC04: lcdData00 port map(clkd => clk0,
                           resetd => reset0,
						   inFlagconfigd => soutFlagConfig0,
						   inFlagdc => soutFlagContData0,
						   incontd => soutContData0,
						   outWordd => soutWordData,
                           outFlagd => soutFlagData0);
  
  LC05: lcdmux00 port map(clkmlcd => clk0,
                          resetmlcd => reset0,
						  inFlagconfigm => soutFlagConfig0,
						  RWcd => sRWc,
						  RScd => sRSc,
						  ENcd => sENc,
						  RWdd => sRWd,
						  RSdd => sRSd,
						  ENdd => sENd,
						  RWm => RW0,
						  RSm => RS0,
						  ENm => EN0,
						  inWordconfig => soutWordConfig,
						  inWordData => soutWordData,
                          outWordm => outWordlcd0);--
end toplcd0;