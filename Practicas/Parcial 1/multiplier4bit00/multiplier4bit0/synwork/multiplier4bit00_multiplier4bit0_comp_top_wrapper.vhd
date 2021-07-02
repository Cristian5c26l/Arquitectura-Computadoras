--
-- Synopsys
-- Vhdl wrapper for top level design, written on Thu Mar 18 23:11:36 2021
--
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.packagemultiplier4bit00.all;

entity wrapper_for_multiplier4bit00 is
   port (
      A : in std_logic_vector(3 downto 0);
      B : in std_logic_vector(3 downto 0);
      R : out std_logic_vector(7 downto 0)
   );
end wrapper_for_multiplier4bit00;

architecture multiplier4bit0 of wrapper_for_multiplier4bit00 is

component multiplier4bit00
 port (
   A : in std_logic_vector (3 downto 0);
   B : in std_logic_vector (3 downto 0);
   R : out std_logic_vector (7 downto 0)
 );
end component;

signal tmp_A : std_logic_vector (3 downto 0);
signal tmp_B : std_logic_vector (3 downto 0);
signal tmp_R : std_logic_vector (7 downto 0);

begin

tmp_A <= A;

tmp_B <= B;

R <= tmp_R;



u1:   multiplier4bit00 port map (
		A => tmp_A,
		B => tmp_B,
		R => tmp_R
       );
end multiplier4bit0;
