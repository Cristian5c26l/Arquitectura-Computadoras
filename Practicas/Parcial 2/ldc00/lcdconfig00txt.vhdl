library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity lcdconfig00 is
  port(--
       clkc: in std_logic;
	   resetc: in std_logic;
	   inFlagc: in std_logic;
	   incontc: in std_logic_vector(4 downto 0);
	   outWordc: out std_logic_vector(7 downto 0);
	   outFlagc: out std_logic;
	   RWc: out std_logic;
	   RSc: out std_logic;
       ENc: out std_logic);
end lcdconfig00;

architecture lcdconfig0 of lcdconfig00 is
begin
  pconfig: process(clkc, resetc, inFlagc, incontc)
  begin
  if (clkc'event and clkc = '1') then
    case resetc is
	  when '0' =>
	    outWordc <= "00000001";
		outFlagc <= '0';
		RWc <= '0';
		RSc <= '0';
		ENc <= '0';
	  when '1' =>
	    case inFlagc is
		  when '1' =>
            case incontc is
			  when "00000" =>
			    outFlagc <= '0';
			    outWordc <= "00000001";--Clear display
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
			  when "00001" =>
			    outFlagc <= '0';
			    outWordc <= "00000001";--Clear display
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
			  when "00010" =>
			    outFlagc <= '0';
			    outWordc <= "00000011";--DDRAM Addres = 0
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
			  when "00011" =>
			    outFlagc <= '0';
			    outWordc <= "00000011";--DDRAM Addres = 0
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
			  when "00100" =>
			    outFlagc <= '0';
			    outWordc <= "00000110";--Set direction cursor --INPUT SET (SI EL BIT MENOS SIGNIFICATIVO ES 1, SE DESPLAZA HACIA LA IZQUIERDA. SI EL BIT MENOS SIGNIFICATIVO ES 0, SE DESPLAZA HACIA LA DERECHA )
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
			  when "00101" =>
			    outFlagc <= '0';
			    outWordc <= "00000110";--Set direction cursor --INPUT SET (SI EL BIT MENOS SIGNIFICATIVO ES 1, SE DESPLAZA HACIA LA IZQUIERDA. SI EL BIT MENOS SIGNIFICATIVO ES 0, SE DESPLAZA HACIA LA DERECHA )
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
			  when "00110" =>
			    outFlagc <= '0';
			    outWordc <= "00001111";--Blink cursor
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
			  when "00111" =>
			    outFlagc <= '0';
			    outWordc <= "00001111";--Blink cursor
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
			  when "01000" =>
			    outFlagc <= '0';
			    outWordc <= "00011100";--DDRAM Changeless 00011100--
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
			  when "01001" =>
			    outFlagc <= '0';
			    outWordc <= "00011100";--DDRAM Changeless 00011100
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
			  when "01010" =>
			    outFlagc <= '0';
			    outWordc <= "10101000";--Set DDRAM Address, posision 40 (101000) (desde esa posicion se comienza a escribir)
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
			  when "01011" =>
			    outFlagc <= '0';
			    outWordc <= "10101000";--Set DDRAM Address, posision 40 (101000) (desde esa posicion se comienza a escribir)
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
			  when "01100" =>
			    outFlagc <= '0';
			    outWordc <= "00111111";--Set DL,display line font--
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
			  when "01101" =>
			    outFlagc <= '0';
			    outWordc <= "00111111"; --Set DL,display line font
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
			  when "01110" =>
			    outFlagc <= '0';
			    outWordc <= "00111111";--Set DL,display line font
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
			  when "01111" =>
			    outFlagc <= '1';
			    outWordc <= "00111111"; --Set DL,display line font
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
			  when others => null;
			end case;
		  when others => null;
		end case;
	  when others => null;
	end case;
  end if;
  end process pconfig;
end lcdconfig0;