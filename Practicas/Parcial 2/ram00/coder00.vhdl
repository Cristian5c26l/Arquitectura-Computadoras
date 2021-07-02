library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		resetc: in std_logic;--**nuevopuerto
		rwc: in std_logic;--**nuevopuerto
		incontc: in std_logic_vector(3 downto 0);
		inkeyc: in std_logic_vector(3 downto 0);
		outcoderc: out std_logic_vector(6 downto 0);--7 segmentos
		outcontwritec: inout std_logic_vector(5 downto 0);--**nuevopuerto
		outFlagc: out std_logic--bandera de control de salida**nuevopuerto, cuando pulsamos un boton, outFlag se coloca en 1, lo cual permite guardar en la ram lo que se pulso, cuando llegue otro ciclo de reloj flag vale 0
		);
end coder00;
--incontc es una entrada de control
architecture coder0 of coder00 is
signal scontrol: std_logic_vector(1 downto 0);
begin
scontrol <= (resetc)&(rwc);
	pcoder: process(clkc)
	variable aux1: bit:='0';--flip flop
	variable aux2: bit:='0';
	variable aux3: bit:='0';
	variable aux4: bit:='0';
	begin
		if(clkc'event and clkc='1')then
		  case scontrol is
		   when "00" =>
		    outcoderc <= "1111111";
			outcontwritec <= "000000";
			outFlagc <= '0';
		   when "01" =>--reset
			outcoderc <= "1111111";
			outcontwritec <= "000000";
			outFlagc <= '0';
		   when "10" =>--modo write    
		   --when "11" =>--lectura esto es null (when others null)     
			case incontc is
				when "1000" =>--aux1
---------------------------------------------------				
					case inkeyc is
						when "0000" =>
							aux1:='0';
						when "0001" =>
							if(aux1 = '0')then
								aux1:='1';
								outcoderc <="1001111";--1
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';
							end if;
						when "0010" =>
							if(aux1 = '0')then
								aux1:='1';
								outcoderc <="0010010";--2
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';	
							end if;
						when "0100" =>--**ssssss
							if(aux1 = '0')then
								aux1:='1';
								outcoderc <="0000110";--3
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';				
							end if;
						when "1000" =>--**
							if(aux1 = '0')then
								aux1:='1';
								outcoderc <="0001000";--A
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';								
							end if;
						when others => null;--**
					end case;
---------------------------------------------------
				when "0100" =>--aux2
					case inkeyc is
						when "0000" =>--soltamos el teclado
							aux2:='0';
						when "0001" =>
							if(aux2 = '0')then
								aux2:='1';
								outcoderc <="1001100";--4
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when "0010" =>--**
							if(aux2 = '0')then
								aux2:='1';
								outcoderc <="0100100";--5
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when "0100" =>--**
							if(aux2 = '0')then
								aux2:='1';
								outcoderc <="0100000";--6
							outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when "1000" =>--**
							if(aux2 = '0')then
								aux2:='1';
								outcoderc <="1100000";--b
							outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when others => null;--**
					end case;
---------------------------------------------------
				when "0010" =>--aux3
					case inkeyc is
						when "0000" =>
							aux3:='0';
						when "0001" =>
							if(aux3 = '0')then
								aux3:='1';
								outcoderc <="0001111";--7
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when "0010" =>--**
							if(aux3 = '0')then
								aux3:='1';
								outcoderc <="0000000";--8
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when "0100" =>--**
							if(aux3 = '0')then
								aux3:='1';
								outcoderc <="0001100";--9
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when "1000" =>--**
							if(aux3 = '0')then
								aux3:='1';
								outcoderc <="0110001";--C,abcdefg
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when others => null;--**
					end case;
---------------------------------------------------
				when "0001" =>--aux4
					case inkeyc is
						when "0000" =>
							aux4:='0';
						when "0001" =>
							if(aux4 = '0')then
								aux4:='1';
								outcoderc <="0000001";--0
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when "0010" =>--**
							if(aux4 = '0')then
								aux4:='1';
								outcoderc <="1000010";--d
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when "0100" =>--**
							if(aux4 = '0')then
								aux4:='1';
								outcoderc<="0110000";	-- E
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when "1000" =>--**
							if(aux4 = '0')then
								aux4:='1';
								outcoderc <="0111000";	-- F
								outcontwritec <= outcontwritec + '1';
								outFlagc <= '1';--habilitamos la escritura de la ram
							else
								outcontwritec <= outcontwritec;
								outFlagc <= '0';							
							end if;
						when others => null;--*
					end case;
---------------------------------------------------
				when others => null;--incont
			end case;--incontc
		  when others => null;--scontrol
		 end case;--scontrol
		end if;
	end process pcoder;
end coder0;--