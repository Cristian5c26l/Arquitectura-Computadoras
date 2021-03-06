library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
--archivo con estilo funcional, aqui van declarados procesos
entity div01 is
port(
	clkdiv: in std_logic;
	indiv: in std_logic_vector(4 downto 0);
	oscout: inout std_logic
);
end div01;
--
architecture div0 of div01 is
signal sdiv: std_logic_vector(21 downto 0);--se?al para contador
begin
	pdiv: process(clkdiv)
	begin
		if(clkdiv'event and clkdiv = '1')then--si hay un flanco de reloj y es positivo
			case indiv is
				when "00000" =>
					if(sdiv > "1000000000000000000000")then
						oscout <= not(oscout);
						sdiv <= (others => '0'); --reiniciamos la se?al
					else
						oscout <= oscout;
						sdiv <= sdiv + '1'; --reiniciamos la se?al
					end if;
				-------------------------------------------------------------------------
				when "00001" =>
					if(sdiv > "0100000000000000000000")then
						oscout <= not(oscout);
						sdiv <= (others => '0'); --reiniciamos la se?al
					else
						oscout <= oscout;
						sdiv <= sdiv + '1'; --reiniciamos la se?al
					end if;
				-------------------------------------------------------------------------
				when "00011" =>
					if(sdiv > "0010000000000000000000")then
						oscout <= not(oscout);
						sdiv <= (others => '0'); --reiniciamos la se?al
					else
						oscout <= oscout;
						sdiv <= sdiv + '1'; --reiniciamos la se?al
					end if;
				-------------------------------------------------------------------------
				when "00111" =>
					if(sdiv > "0001000000000000000000")then
						oscout <= not(oscout);
						sdiv <= (others => '0'); --reiniciamos la se?al
					else
						oscout <= oscout;
						sdiv <= sdiv + '1'; --reiniciamos la se?al
					end if;
				-------------------------------------------------------------------------
				when "01111" =>
					if(sdiv > "0000100000000000000000")then
						oscout <= not(oscout);
						sdiv <= (others => '0'); --reiniciamos la se?al
					else
						oscout <= oscout;
						sdiv <= sdiv + '1'; --reiniciamos la se?al
					end if;
				-------------------------------------------------------------------------
				when "11111" =>
					if(sdiv > "0000010000000000000000")then
						oscout <= not(oscout);
						sdiv <= (others => '0'); --reiniciamos la se?al
					else
						oscout <= oscout;
						sdiv <= sdiv + '1'; --reiniciamos la se?al
					end if;
				-------------------------------------------------------------------------
				when "11110" =>
					if(sdiv > "0000000100000000000000")then
						oscout <= not(oscout);
						sdiv <= (others => '0'); --reiniciamos la se?al
					else
						oscout <= oscout;
						sdiv <= sdiv + '1'; --reiniciamos la se?al
					end if;
				-------------------------------------------------------------------------
				when "11100" =>
					if(sdiv > "0000000001000000000000")then
						oscout <= not(oscout);
						sdiv <= (others => '0'); --reiniciamos la se?al
					else
						oscout <= oscout;
						sdiv <= sdiv + '1'; --reiniciamos la se?al
					end if;
				-------------------------------------------------------------------------
				when "11000" =>
					if(sdiv > "0000000000010000000000")then
						oscout <= not(oscout);
						sdiv <= (others => '0'); --reiniciamos la se?al
					else
						oscout <= oscout;
						sdiv <= sdiv + '1'; --reiniciamos la se?al
					end if;
				-------------------------------------------------------------------------
				when others => null;
			end case;
		end if;
	end process pdiv;
end div0;