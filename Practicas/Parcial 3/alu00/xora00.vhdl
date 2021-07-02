library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xora00 is
	port(   clkxor: in std_logic;
			functxor: in std_logic_vector(5 downto 0);
			inFlagxor: in std_logic;
			indatoAxor: in std_logic_vector(7 downto 0);
			indatoBxor: in std_logic_vector(7 downto 0);
			outxor: out std_logic_vector(7 downto 0);
			outFlagxor: out std_logic);
end xora00;

architecture xora0 of xora00 is
begin--
  pxor: process(clkxor)
  variable auxxor: bit:='0';
  begin
    if(clkxor'event and clkxor='1')then
	  if(functxor = "000010") then
	    case inFlagxor is
		  when '0' =>
		    outFlagxor <= '0';
		  when '1' =>
		    if(auxxor = '0')then
		      auxxor:='1';
			  outxor <= indatoAxor xor indatoBxor;
			  outFlagxor <= '1';
			else
			  outFlagxor <= '0';
			end if;
		  when others => null;
		end case;
	  else
	   auxxor:='0';
	   outxor <= (others => 'Z');
	   outFlagxor <= 'Z';
	  end if;
	end if;
  end process pxor;
end xora0;