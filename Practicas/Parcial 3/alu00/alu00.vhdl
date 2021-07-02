library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagealu00.all;

entity alu00 is
port(
		clk00: inout std_logic;
		enable0:in std_logic;
		cdiv00: in std_logic_vector(4 downto 0);
		funct0: in std_logic_vector(5 downto 0);
		inregRS0: in std_logic_vector(7 downto 0);
		inregRT0: in std_logic_vector(7 downto 0);
		outalu0: out std_logic_vector(7 downto 0);
		outFlagInst0: inout std_logic;
		outFlagac0: inout std_logic		
	);
end alu00;

architecture alu0 of alu00 is
signal sdata: std_logic_vector(7 downto 0);
begin

	AL00: osc00 port map(oscout0 => clk00,
							cdiv => cdiv00
							);
	
	AL01: anda00 port map(clka => clk00,
							inFlaga => outFlagac0,
							functa => funct0,
							indatoAa =>  inregRS0,
							indatoBa  => inregRT0,
							outa => sdata,
							outFlaga => outFlagInst0
						);

	AL02: ora00 port map(clko => clk00,
							inFlago => outFlagac0,
							functo => funct0,
							indatoAo =>  inregRS0,
							indatoBo  => inregRT0, 
							outo => sdata,
							outFlago => outFlagInst0
							);
							
	AL03: xora00 port map(clkxor => clk00,
							inFlagxor => outFlagac0,
							functxor => funct0,
							indatoAxor =>  inregRS0,
							indatoBxor  => inregRT0, 
							outxor => sdata,
							outFlagxor => outFlagInst0
							);
							
	AL04: nanda00 port map(clkna => clk00,
							inFlagna => outFlagac0,
							functna => funct0,
							indatoAna =>  inregRS0,--A
							indatoBna  => inregRT0, --B
							outna => sdata,
							outFlagna => outFlagInst0
							);
							
	AL05: nora00 port map(clkno => clk00,
							inFlagno => outFlagac0,
							functno => funct0,
							indatoAno =>  inregRS0,--A
							indatoBno  => inregRT0, --B
							outno => sdata,
							outFlagno => outFlagInst0
							);
	
	AL06: xnora00 port map(clkxnor => clk00,
							inFlagxnor => outFlagac0,
							functxnor => funct0,
							indatoAxnor =>  inregRS0,
							indatoBxnor  => inregRT0, 
							outxnor => sdata,
							outFlagxnor => outFlagInst0
							);
							
	AL07: nota00 port map(clkn => clk00,
							inFlagn => outFlagac0,
							functn => funct0,
							indatoAn =>  inregRS0,
							indatoBn  => inregRT0, 
							outn => sdata,
							outFlagn => outFlagInst0
							);
							
	AL08: buffera00 port map(clkb => clk00,
							inFlagb => outFlagac0,
							functb => funct0,
							indatoAb =>  inregRS0,
							indatoBb  => inregRT0, 
							outb => sdata,
							outFlagb => outFlagInst0
							);
	
	AL09: ac00 port map(clkac => clk00,
							enac => enable0,
							inFlagac => outFlagInst0,
							inac => sdata,
							outac => outalu0,
							outFlagac => outFlagac0
						);--

end alu0;