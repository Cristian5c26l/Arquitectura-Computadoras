library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity memram00 is
	port(
		clkra: in std_logic;
		resetra: in std_logic;
		rwra: in std_logic;
		inFlagra: in std_logic;--bandera para control de escritura
		inwordra: in std_logic_vector(6 downto 0);--7 segmentos
		incontWritera: in std_logic_vector(5 downto 0);
		incontReadra: in std_logic_vector(5 downto 0);--contador de lectura
		outwordra: out std_logic_vector(6 downto 0)--7 segmentos
		);
end memram00;

architecture memram0 of memram00 is
type arrayram is array(0 to 63) of std_logic_vector(6 downto 0);
signal sword: arrayram;--apagamos displays con 1's, manera interna, no sale al exterior
signal scontrol: std_logic_vector(1 downto 0); 
begin--
scontrol <= (resetra)&(rwra);--concatenamos los bits de control, sigue el proceso
	pram: process(clkra)
	begin
		if(clkra'event and clkra ='1')then
			case scontrol is
				when "00" =>
					outwordra <= "1111111";
				when "01" =>
					outwordra <= "1111111";
				when "10" =>
					if(inFlagra = '1')then
						sword(conv_integer(incontWritera)) <= inwordra;
					end if;
				when "11" =>
					outwordra <= sword(conv_integer(incontReadra));
				when others => null;
			end case;
		end if;
	end process pram;

end memram0;