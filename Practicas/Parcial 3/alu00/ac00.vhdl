library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ac00 is
  port(
       clkac: in std_logic;
	   enac: in std_logic;
	   inac: in std_logic_vector(7 downto 0);
       inFlagac: in std_logic;
	   outac: out std_logic_vector(7 downto 0);
       outFlagac: out std_logic);
end ac00;

architecture ac0 of ac00 is
signal scontrolac: std_logic_vector(1 downto 0);
begin
scontrolac <= (enac)&(inFlagac);
  pac: process(clkac)
  variable auxac: bit:='0';
  begin
    if(clkac'event and clkac='1')then
	  auxac:='0';
      case scontrolac is
	    when "00" =>
	      outac <= (others => '0');
	      outFlagac <= '0';
	    when "10" =>
	      if(auxac='0')then
		    auxac:='1';
		    outac <= inac;
		    outFlagac <= '1';
		  end if;
	    when "11" =>
	      if(auxac='1')then
		    auxac:='0';
		    outac <= inac;
		    outFlagac <= '1';
		  end if;
	    when others => null;

	  end case;
    end if;
  end process pac;
end ac0;