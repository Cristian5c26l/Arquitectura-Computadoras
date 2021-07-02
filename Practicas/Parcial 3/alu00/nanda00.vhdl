library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nanda00 is
	port(   clkna: in std_logic;
			functna: in std_logic_vector(5 downto 0);
			inFlagna: in std_logic;
			indatoAna: in std_logic_vector(7 downto 0);
			indatoBna: in std_logic_vector(7 downto 0);
			outna: out std_logic_vector(7 downto 0);
			outFlagna: out std_logic);
end nanda00;

architecture nanda0 of nanda00 is
begin--
  pnand: process(clkna)
  variable auxna: bit:='0';
  begin
    if(clkna'event and clkna='1')then
	  if(functna = "000011") then
	    case inFlagna is
		  when '0' =>
		    outFlagna <= '0';
		  when '1' =>
		    if(auxna = '0')then
		      auxna:='1';
			  outna <= indatoAna nand indatoBna;
			  outFlagna <= '1';
			else
			  outFlagna <= '0';
			end if;
		  when others => null;
		end case;
	  else
	   auxna:='0';
	   outna <= (others => 'Z');
	   outFlagna <= 'Z';
	  end if;
	end if;
  end process pnand;
end nanda0;