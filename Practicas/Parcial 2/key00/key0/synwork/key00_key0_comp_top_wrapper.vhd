--
-- Synopsys
-- Vhdl wrapper for top level design, written on Thu Apr 15 18:21:47 2021
--
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.packagekey00.all;

entity wrapper_for_key00 is
   port (
      cdiv0 : in std_logic_vector(4 downto 0);
      clk0 : in std_logic;
      en0 : in std_logic;
      inkey0 : in std_logic_vector(3 downto 0);
      outr0 : in std_logic_vector(3 downto 0);
      outtransist : out std_logic_vector(3 downto 0);
      outcoder0 : out std_logic_vector(6 downto 0)
   );
end wrapper_for_key00;

architecture key0 of wrapper_for_key00 is

component key00
 port (
   cdiv0 : in std_logic_vector (4 downto 0);
   clk0 : inout std_logic;
   en0 : in std_logic;
   inkey0 : in std_logic_vector (3 downto 0);
   outr0 : inout std_logic_vector (3 downto 0);
   outtransist : out std_logic_vector (3 downto 0);
   outcoder0 : out std_logic_vector (6 downto 0)
 );
end component;

signal tmp_cdiv0 : std_logic_vector (4 downto 0);
signal tmp_clk0 : std_logic;
signal tmp_en0 : std_logic;
signal tmp_inkey0 : std_logic_vector (3 downto 0);
signal tmp_outr0 : std_logic_vector (3 downto 0);
signal tmp_outtransist : std_logic_vector (3 downto 0);
signal tmp_outcoder0 : std_logic_vector (6 downto 0);

begin

tmp_cdiv0 <= cdiv0;

tmp_clk0 <= clk0;

tmp_en0 <= en0;

tmp_inkey0 <= inkey0;

tmp_outr0 <= outr0;

outtransist <= tmp_outtransist;

outcoder0 <= tmp_outcoder0;



u1:   key00 port map (
		cdiv0 => tmp_cdiv0,
		clk0 => tmp_clk0,
		en0 => tmp_en0,
		inkey0 => tmp_inkey0,
		outr0 => tmp_outr0,
		outtransist => tmp_outtransist,
		outcoder0 => tmp_outcoder0
       );
end key0;
