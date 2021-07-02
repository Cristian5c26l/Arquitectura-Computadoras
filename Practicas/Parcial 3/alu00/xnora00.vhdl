library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xnora00 is
	port(   clkxnor: in std_logic;
			functxnor: in std_logic_vector(5 downto 0);
			inFlagxnor: in std_logic;
			indatoAxnor: in std_logic_vector(7 downto 0);
			indatoBxnor: in std_logic_vector(7 downto 0);
			outxnor: out std_logic_vector(7 downto 0);
			outFlagxnor: out std_logic);
end xnora00;--

architecture xnora0 of xnora00 is
begin--
  pxnor: process(clkxnor)
  variable auxxnor: bit:='0';
  begin
    if(clkxnor'event and clkxnor='1')then
	  if(functxnor = "000101") then
	    case inFlagxnor is
		  when '0' =>
		    outFlagxnor <= '0';
		  when '1' =>
		    if(auxxnor = '0')then
		      auxxnor:='1';
			  outxnor <= indatoAxnor xnor indatoBxnor;
			  outFlagxnor <= '1';
			else
			  outFlagxnor <= '0';
			end if;
		  when others => null;
		end case;
	  else
	   auxxnor:='0';
	   outxnor <= (others => 'Z');
	   outFlagxnor <= 'Z';
	  end if;
	end if;
  end process pxnor;
end xnora0;