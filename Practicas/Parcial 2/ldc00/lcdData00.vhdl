library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity lcdData00 is
  port(
       clkd: in std_logic;
	   resetd: in std_logic;
	   inFlagconfigd: in std_logic;
	   inFlagdc: in std_logic;
	   incontd: in std_logic_vector(4 downto 0);
	   outWordd: out std_logic_vector(7 downto 0);
       outFlagd: out std_logic);
end lcdData00;

architecture lcdData0 of lcdData00 is
type arrayRom is array(0 to 63) of std_logic_vector(7 downto 0);
constant dataWord: arrayRom:=("00100000",--ESPACIO
								"00100001",--SIGNO ADMIRACION
								"00100000",--ESPACIO
								"01001000",--H
								"01001111",--O
								"01001100",--L
								"01000001",--A
								"00100000",--ESPACIO
								"01001101",--M
								"01010101",--U
								"01001110",--N
								"01000100",--D
								"01001111",--O
								"00100000",--ESPACIO
								"00100001",--SIGNO ADMIRACION
                             others => "00100001");
begin
 pd: process(clkd, resetd, inFlagconfigd, inFlagdc)
 begin
   if (clkd'event and clkd = '1') then
     case resetd is
	   when '0' =>
	     outWordd <= "00111100";
		 outFlagd <= '0';
	   when '1' =>
	      case inFlagconfigd is
		    when '0' =>-- se est? configurando
	          outWordd <= "00111100";
		      outFlagd <= '0';
			when '1' =>
			  if (incontd < "01111") then--10111
			    if (inFlagdc = '0') then
			      outWordd <= dataWord(conv_integer(incontd));
				  outFlagd <= '1';
			    elsif(inFlagdc = '1') then
			      outFlagd <= '0';
			    end if;
			  end if;
			when others => null;
		  end case;
	   when others => null;
	 end case;
   end if;
 end process pd;
end lcdData0;