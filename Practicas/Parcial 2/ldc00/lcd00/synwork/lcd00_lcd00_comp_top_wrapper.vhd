--
-- Synopsys
-- Vhdl wrapper for top level design, written on Thu May 20 19:25:11 2021
--
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.packagelcd00.all;

entity wrapper_for_toplcd00 is
   port (
      clk0 : in std_logic;
      reset0 : in std_logic;
      cdiv0 : in std_logic_vector(4 downto 0);
      soutFlagconfig0 : in std_logic;
      soutFlagContConfig0 : in std_logic;
      soutFlagContData0 : in std_logic;
      soutFlagData0 : in std_logic;
      soutContConfig0 : in std_logic_vector(4 downto 0);
      soutContData0 : in std_logic_vector(4 downto 0);
      outWordlcd0 : out std_logic_vector(7 downto 0);
      RW0 : out std_logic;
      RS0 : out std_logic;
      EN0 : out std_logic
   );
end wrapper_for_toplcd00;

architecture toplcd0 of wrapper_for_toplcd00 is

component toplcd00
 port (
   clk0 : inout std_logic;
   reset0 : in std_logic;
   cdiv0 : in std_logic_vector (4 downto 0);
   soutFlagconfig0 : inout std_logic;
   soutFlagContConfig0 : inout std_logic;
   soutFlagContData0 : inout std_logic;
   soutFlagData0 : inout std_logic;
   soutContConfig0 : inout std_logic_vector (4 downto 0);
   soutContData0 : inout std_logic_vector (4 downto 0);
   outWordlcd0 : out std_logic_vector (7 downto 0);
   RW0 : out std_logic;
   RS0 : out std_logic;
   EN0 : out std_logic
 );
end component;

signal tmp_clk0 : std_logic;
signal tmp_reset0 : std_logic;
signal tmp_cdiv0 : std_logic_vector (4 downto 0);
signal tmp_soutFlagconfig0 : std_logic;
signal tmp_soutFlagContConfig0 : std_logic;
signal tmp_soutFlagContData0 : std_logic;
signal tmp_soutFlagData0 : std_logic;
signal tmp_soutContConfig0 : std_logic_vector (4 downto 0);
signal tmp_soutContData0 : std_logic_vector (4 downto 0);
signal tmp_outWordlcd0 : std_logic_vector (7 downto 0);
signal tmp_RW0 : std_logic;
signal tmp_RS0 : std_logic;
signal tmp_EN0 : std_logic;

begin

tmp_clk0 <= clk0;

tmp_reset0 <= reset0;

tmp_cdiv0 <= cdiv0;

tmp_soutFlagconfig0 <= soutFlagconfig0;

tmp_soutFlagContConfig0 <= soutFlagContConfig0;

tmp_soutFlagContData0 <= soutFlagContData0;

tmp_soutFlagData0 <= soutFlagData0;

tmp_soutContConfig0 <= soutContConfig0;

tmp_soutContData0 <= soutContData0;

outWordlcd0 <= tmp_outWordlcd0;

RW0 <= tmp_RW0;

RS0 <= tmp_RS0;

EN0 <= tmp_EN0;



u1:   toplcd00 port map (
		clk0 => tmp_clk0,
		reset0 => tmp_reset0,
		cdiv0 => tmp_cdiv0,
		soutFlagconfig0 => tmp_soutFlagconfig0,
		soutFlagContConfig0 => tmp_soutFlagContConfig0,
		soutFlagContData0 => tmp_soutFlagContData0,
		soutFlagData0 => tmp_soutFlagData0,
		soutContConfig0 => tmp_soutContConfig0,
		soutContData0 => tmp_soutContData0,
		outWordlcd0 => tmp_outWordlcd0,
		RW0 => tmp_RW0,
		RS0 => tmp_RS0,
		EN0 => tmp_EN0
       );
end toplcd0;
