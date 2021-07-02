library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nora00 is
	port(   clkno: in std_logic;
			functno: in std_logic_vector(5 downto 0);
			inFlagno: in std_logic;
			indatoAno: in std_logic_vector(7 downto 0);
			indatoBno: in std_logic_vector(7 downto 0);
			outno: out std_logic_vector(7 downto 0);
			outFlagno: out std_logic);
end nora00;

architecture nora0 of nora00 is
begin--
  pnor: process(clkno)
  variable auxno: bit:='0';
  begin
    if(clkno'event and clkno='1')then
	  if(functno = "000100") then
	    case inFlagno is
		  when '0' =>
		    outFlagno <= '0';
		  when '1' =>
		    if(auxno = '0')then
		      auxno:='1';
			  outno <= indatoAno nor indatoBno;
			  outFlagno <= '1';
			else
			  outFlagno <= '0';
			end if;
		  when others => null;
		end case;
	  else
	   auxno:='0';
	   outno <= (others => 'Z');
	   outFlagno <= 'Z';
	  end if;
	end if;
  end process pnor;
end nora0;--