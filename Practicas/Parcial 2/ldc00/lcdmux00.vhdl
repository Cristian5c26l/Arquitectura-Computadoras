library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity lcdmux00 is
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
end lcdmux00;

architecture lcdmux0 of lcdmux00 is
begin
  pm: process(clkmlcd, resetmlcd, inFlagconfigm)
  begin
    if (clkmlcd'event and clkmlcd = '1') then
	  case resetmlcd is
	    when '0' =>
		  outWordm <= "00111000";
		  RWm <= '0';
		  RSm <= '0';
		  ENm <= '0';
		when '1' =>
		  case inFlagconfigm is
		    when '0' =>
			  outWordm <= inWordconfig;
			  RWm <= RWcd;
			  RSm <= RScd;
			  ENm <= ENcd;
			when '1' =>
			  outWordm <= inWordData;
			  RWm <= RWdd;
			  RSm <= RSdd;
			  ENm <= ENdd;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pm;
end lcdmux0;