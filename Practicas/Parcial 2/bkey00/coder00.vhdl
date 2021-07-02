library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		incontc: in std_logic_vector(3 downto 0);
		inkeyc: in std_logic_vector(3 downto 0);
		outcoderc: out std_logic_vector(6 downto 0)--7 segmentos
		);
end coder00;
--incontc es una entrada de control
architecture coder0 of coder00 is
begin
	pcoder: process(clkc)
	variable aux1: bit:='0';
	variable aux2: bit:='0';
	variable aux3: bit:='0';
	variable aux4: bit:='0';
	begin
		if(clkc'event and clkc='1')then
			case incontc is
				when "1000" =>
---------------------------------------------------				
					case inkeyc is
						when "0000" =>
							aux1:='0';
						when "0001" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux1:='1';
								outcoderc <="1001111";--1
							end if;
						when "0010" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux1:='1';
								outcoderc <="0010010";--2
							end if;
						when "0100" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux1:='1';
								outcoderc <="0000110";--3
							end if;
						when "1000" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux1:='1';
								outcoderc <="0001000";--A
							end if;
						when others => null;
					end case;
---------------------------------------------------
				when "0100" =>
					case inkeyc is
						when "0000" =>
							aux2:='0';
						when "0001" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux2:='1';
								outcoderc <="1001100";--4
							end if;
						when "0010" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux2:='1';
								outcoderc <="0100100";--5
							end if;
						when "0100" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux2:='1';
								outcoderc <="0100000";--6
							end if;
						when "1000" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux2:='1';
								outcoderc <="1100000";--b
							end if;
						when others => null;
					end case;
---------------------------------------------------
				when "0010" =>
					case inkeyc is
						when "0000" =>
							aux3:='0';
						when "0001" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux3:='1';
								outcoderc <="0001111";--7
							end if;
						when "0010" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux3:='1';
								outcoderc <="0000000";--8
							end if;
						when "0100" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux3:='1';
								outcoderc <="0001100";--9
							end if;
						when "1000" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux3:='1';
								outcoderc <="0110001";--C,abcdefg
							end if;
						when others => null;
					end case;
---------------------------------------------------
				when "0001" =>--renglon 4
					case inkeyc is
						when "0000" =>--cuando suelto el teclado, inicializo en 0
							aux4:='0';
						when "0001" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then--solo se va a oprimir el teclado despues de soltar la tecla
								aux4:='1';
								outcoderc <="0000001";--0
							end if;
						when "0010" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux4:='1';
								outcoderc <="0011100";--*
							end if;
						when "0100" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux4:='1';
								outcoderc <="1100010";-- +
							end if;
						when "1000" =>
							if(aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0')then
								aux4:='1';
								outcoderc <="1111110";-- -,abcdefg
							end if;
						when others => null;
					end case;
---------------------------------------------------
				when others => null;
			end case;
		end if;
	end process pcoder;
end coder0;--