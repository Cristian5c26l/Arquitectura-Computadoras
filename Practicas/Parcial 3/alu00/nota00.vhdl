library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nota00 is
	port(   clkn: in std_logic;
			functn: in std_logic_vector(5 downto 0);
			inFlagn: in std_logic;
			indatoAn: in std_logic_vector(7 downto 0);
			indatoBn: in std_logic_vector(7 downto 0);
			outn: out std_logic_vector(7 downto 0);--n de not
			outFlagn: out std_logic);
end nota00;

architecture nota0 of nota00 is
begin--
  pnot: process(clkn)
  variable auxn: bit:='0';
  begin
    if(clkn'event and clkn='1')then
	  if(functn = "000110") then
	    case inFlagn is
		  when '0' =>
		    outFlagn <= '0';
		  when '1' =>
		    if(auxn = '0')then
		      auxn:='1';
			  outn <= not indatoAn;
			  outFlagn <= '1';
			else
			  outFlagn <= '0';
			end if;
		  when others => null;
		end case;
	  else
	   auxn:='0';
	   outn <= (others => 'Z');
	   outFlagn <= 'Z';
	  end if;
	end if;
  end process pnot;
end nota0;