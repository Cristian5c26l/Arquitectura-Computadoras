--
-- Synopsys
-- Vhdl wrapper for top level design, written on Fri Mar 12 22:14:02 2021
--
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.packageadder4bit00.all;

entity wrapper_for_adder4bit00 is
   port (
      Ai : in std_logic_vector(3 downto 0);
      Bi : in std_logic_vector(3 downto 0);
      SL : in std_logic;
      So : out std_logic_vector(3 downto 0);
      LED : out std_logic
   );
end wrapper_for_adder4bit00;

architecture adder4bit0 of wrapper_for_adder4bit00 is

component adder4bit00
 port (
   Ai : in std_logic_vector (3 downto 0);
   Bi : in std_logic_vector (3 downto 0);
   SL : in std_logic;
   So : out std_logic_vector (3 downto 0);
   LED : out std_logic
 );
end component;

signal tmp_Ai : std_logic_vector (3 downto 0);
signal tmp_Bi : std_logic_vector (3 downto 0);
signal tmp_SL : std_logic;
signal tmp_So : std_logic_vector (3 downto 0);
signal tmp_LED : std_logic;

begin

tmp_Ai <= Ai;

tmp_Bi <= Bi;

tmp_SL <= SL;

So <= tmp_So;

LED <= tmp_LED;



u1:   adder4bit00 port map (
		Ai => tmp_Ai,
		Bi => tmp_Bi,
		SL => tmp_SL,
		So => tmp_So,
		LED => tmp_LED
       );
end adder4bit0;
