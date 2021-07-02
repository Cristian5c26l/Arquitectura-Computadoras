library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ora00 is
	port(   clko: in std_logic;
			functo: in std_logic_vector(5 downto 0);
			inFlago: in std_logic;
			indatoAo: in std_logic_vector(7 downto 0);
			indatoBo: in std_logic_vector(7 downto 0);
			outo: out std_logic_vector(7 downto 0);
			outFlago: out std_logic);
end ora00;

architecture ora0 of ora00 is
begin--
  por: process(clko)
  variable auxo: bit:='0';
  begin
    if(clko'event and clko='1')then
	  if(functo = "000001") then
	    case inFlago is
		  when '0' =>
		    outFlago <= '0';
		  when '1' =>
		    if(auxo = '0')then
		      auxo:='1';
			  outo <= indatoAo or indatoBo;
			  outFlago <= '1';
			else
			  outFlago <= '0';
			end if;
		  when others => null;
		end case;
	  else
	   auxo:='0';
	   outo <= (others => 'Z');
	   outFlago <= 'Z';
	  end if;
	end if;
  end process por;
end ora0;