library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity lcdContData00 is
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
end lcdContData00;

architecture lcdContData0 of lcdContData00 is
begin
  pconfig: process(clkcd, resetcd, inFlagconfigcd, inFlagdata)
  begin
    if (clkcd'event and clkcd = '1') then
	  case resetcd is
	    when '0' =>
		  outcontcd <= "00000";
		  outFlagcd <= '0';
		when '1' =>
		  case inFlagconfigcd is
		    when '0' =>
			  outFlagcd <= '0';
			when '1' =>
			  if (inFlagdata = '1') then
			    if (outcontcd < "01111") then--10111
			      outcontcd <= outcontcd + '1';
				  outFlagcd <= '0';
				  RWcd <= '0';
				  RScd <= '1';
				  ENcd <= '1';
				end if;
			  elsif (inFlagdata = '0') then
			    outcontcd <= outcontcd;
				outFlagcd <= '1';
				RWcd <= '0';
				RScd <= '1';
				ENcd <= '0';
			  end if;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pconfig;
end lcdContData0;