library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
--library machxo2;
--use machxo2.all;

entity RegistroU00 is
	port(
		clks:in std_logic;
		ens:in std_logic;
		controls:in std_logic_vector(2 downto 0);--Para indicar cuantas posiciones vamos a mover el vector (barrels)
		rul:in std_logic_vector(2 downto 0);--para elegir que registro o shift queremos ver
		ins:in std_logic_vector(7 downto 0);
		outs:out std_logic_vector(7 downto 0)
	);
end RegistroU00;

architecture RegistroU0 of RegistroU00 is
signal sshift: std_logic_vector(7 downto 0);
signal brk: std_logic_vector(3 downto 0);
begin
	pshift: process(clks)
	begin
		if(clks'event and clks='1') then
			case ens is
				when '0' =>
					outs <= (others=>'0');
					sshift <= ins;
					brk <= (others => '0');
				when others =>
					case rul is
						when "000" =>
							sshift(0)<='0';
							sshift(7 downto 1)<= sshift(6 downto 0);
							outs<=sshift;
						when "001" =>
							sshift(7)<='0';
							sshift(6 downto 0)<= sshift(7 downto 1);
							outs<=sshift;
						when "010" =>
							sshift(0)<=sshift(7);
							sshift(7 downto 1)<= sshift(6 downto 0);
							outs<=sshift;
						when "011" =>
							sshift(7)<=sshift(0);
							sshift(6 downto 0)<= sshift(7 downto 1);
							outs<=sshift;
						when "100" =>
							if (brk < controls ) then
								brk <= brk + 1;
								sshift(0) <= '0'; 
								sshift ( 7 downto 1) <= sshift (6 downto 0);
								outs <= sshift;
							else
								brk <= brk;
								outs <= sshift;
							end if ;
						when "101" =>
							if (brk < controls ) then
								brk <= brk + 1;
								sshift(7) <= '0'; 
								sshift ( 6 downto 0) <= sshift (7 downto 1);
								outs <= sshift;
							else
								brk <= brk;
								outs <= sshift;
							end if ;
						when "110" =>
							if (brk < controls ) then
								brk <= brk + 1;
								sshift(0) <= sshift(7); 
								sshift ( 7 downto 1) <= sshift (6 downto 0);
								outs <= sshift;
							else
								brk <= brk;
								outs <= sshift;
							end if ;
						when others =>
							if (brk < controls ) then
								brk <= brk + 1;
								sshift(7) <= sshift(0); 
								sshift ( 6 downto 0) <= sshift (7 downto 1);
								outs <= sshift;
							else
								brk <= brk;
								outs <= sshift;
							end if ;
					end case;
			end case;
		end if;
	end process pshift;
end RegistroU0;