library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity buffera00 is
	port(   clkb: in std_logic;
			functb: in std_logic_vector(5 downto 0);
			inFlagb: in std_logic;
			indatoAb: in std_logic_vector(7 downto 0);
			indatoBb: in std_logic_vector(7 downto 0);
			outb: out std_logic_vector(7 downto 0);--b de buffer
			outFlagb: out std_logic);
end buffera00;

architecture buffera0 of buffera00 is
begin--
  pbuffer: process(clkb)
  variable auxb: bit:='0';
  begin
    if(clkb'event and clkb='1')then
	  if(functb = "000111") then
	    case inFlagb is
		  when '0' =>
		    outFlagb <= '0';
		  when '1' =>
		    if(auxb = '0')then
		      auxb:='1';
			  outb <= indatoAb;
			  outFlagb <= '1';
			else
			  outFlagb <= '0';
			end if;
		  when others => null;
		end case;
	  else
	   auxb:='0';
	   outb <= (others => 'Z');
	   outFlagb <= 'Z';
	  end if;
	end if;
  end process pbuffer;
end buffera0;