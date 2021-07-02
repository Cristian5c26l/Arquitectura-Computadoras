library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity lcdcontconfig00 is
  port(
       clkcc: in std_logic;
	   resetcc: in std_logic;
	   inFlagcc: in std_logic;
	   outcontconfigcc: inout std_logic_vector(4 downto 0);
       outFlagcc: out std_logic);
end lcdcontconfig00;

architecture lcdcontconfig0 of lcdcontconfig00 is
begin
  pcontconfig: process(clkcc, resetcc, inFlagcc)
  begin
    if (clkcc'event and clkcc = '1') then
	  case resetcc is
	    when '0' =>
		  outFlagcc <= '0';
		  outcontconfigcc <= "00000";
		when '1' =>
		  if (inFlagcc = '0')then
		    outcontconfigcc <= outcontconfigcc + '1';
			outFlagcc <= '1';
		  elsif (inFlagcc = '1') then
		    outcontconfigcc <= outcontconfigcc;
			outFlagcc <= '0';
		  end if;
		when others => null;
	  end case;
	end if;
  end process pcontconfig;
end lcdcontconfig0;