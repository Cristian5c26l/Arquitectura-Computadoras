library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity anda00 is
	port(   clka: in std_logic;
			functa: in std_logic_vector(5 downto 0);
			inFlaga: in std_logic;
			indatoAa: in std_logic_vector(7 downto 0);
			indatoBa: in std_logic_vector(7 downto 0);
			outa: out std_logic_vector(7 downto 0);
			outFlaga: out std_logic);
end anda00;

architecture anda0 of anda00 is
begin--
  pand: process(clka)
  variable auxa: bit:='0';
  begin
    if(clka'event and clka='1')then
	  if(functa = "000000") then
	    case inFlaga is
		  when '0' =>
		    outFlaga <= '0';
		  when '1' =>
		    if(auxa = '0')then
		      auxa:='1';
			  outa <= indatoAa and indatoBa;
			  outFlaga <= '1';
			else
			  outFlaga <= '0';
			end if;
		  when others => null;
		end case;
	  else
	   auxa:='0';
	   outa <= (others => 'Z');
	   outFlaga <= 'Z';
	  end if;
	end if;
  end process pand;
end anda0;