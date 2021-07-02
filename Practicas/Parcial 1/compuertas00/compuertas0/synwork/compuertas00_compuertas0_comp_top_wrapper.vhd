--
-- Synopsys
-- Vhdl wrapper for top level design, written on Tue Mar  9 13:33:50 2021
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_compuertas00 is
   port (
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      Y : out std_logic_vector(7 downto 0);
      OP : in std_logic_vector(2 downto 0);
      C : in std_logic;
      C1M : in std_logic_vector(2 downto 0);
      C2M : in std_logic_vector(2 downto 0);
      Z : out std_logic_vector(2 downto 0)
   );
end wrapper_for_compuertas00;

architecture compuertas0 of wrapper_for_compuertas00 is

component compuertas00
 port (
   A : in std_logic_vector (7 downto 0);
   B : in std_logic_vector (7 downto 0);
   Y : out std_logic_vector (7 downto 0);
   OP : in std_logic_vector (2 downto 0);
   C : in std_logic;
   C1M : in std_logic_vector (2 downto 0);
   C2M : in std_logic_vector (2 downto 0);
   Z : out std_logic_vector (2 downto 0)
 );
end component;

signal tmp_A : std_logic_vector (7 downto 0);
signal tmp_B : std_logic_vector (7 downto 0);
signal tmp_Y : std_logic_vector (7 downto 0);
signal tmp_OP : std_logic_vector (2 downto 0);
signal tmp_C : std_logic;
signal tmp_C1M : std_logic_vector (2 downto 0);
signal tmp_C2M : std_logic_vector (2 downto 0);
signal tmp_Z : std_logic_vector (2 downto 0);

begin

tmp_A <= A;

tmp_B <= B;

Y <= tmp_Y;

tmp_OP <= OP;

tmp_C <= C;

tmp_C1M <= C1M;

tmp_C2M <= C2M;

Z <= tmp_Z;



u1:   compuertas00 port map (
		A => tmp_A,
		B => tmp_B,
		Y => tmp_Y,
		OP => tmp_OP,
		C => tmp_C,
		C1M => tmp_C1M,
		C2M => tmp_C2M,
		Z => tmp_Z
       );
end compuertas0;
