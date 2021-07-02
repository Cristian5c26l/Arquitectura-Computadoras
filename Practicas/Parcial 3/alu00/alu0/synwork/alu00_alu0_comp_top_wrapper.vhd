--
-- Synopsys
-- Vhdl wrapper for top level design, written on Tue Jun 22 11:57:17 2021
--
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.packagealu00.all;

entity wrapper_for_alu00 is
   port (
      clk00 : in std_logic;
      enable0 : in std_logic;
      cdiv00 : in std_logic_vector(4 downto 0);
      funct0 : in std_logic_vector(5 downto 0);
      inregRS0 : in std_logic_vector(7 downto 0);
      inregRT0 : in std_logic_vector(7 downto 0);
      outalu0 : out std_logic_vector(7 downto 0);
      outFlagInst0 : in std_logic;
      outFlagac0 : in std_logic
   );
end wrapper_for_alu00;

architecture alu0 of wrapper_for_alu00 is

component alu00
 port (
   clk00 : inout std_logic;
   enable0 : in std_logic;
   cdiv00 : in std_logic_vector (4 downto 0);
   funct0 : in std_logic_vector (5 downto 0);
   inregRS0 : in std_logic_vector (7 downto 0);
   inregRT0 : in std_logic_vector (7 downto 0);
   outalu0 : out std_logic_vector (7 downto 0);
   outFlagInst0 : inout std_logic;
   outFlagac0 : inout std_logic
 );
end component;

signal tmp_clk00 : std_logic;
signal tmp_enable0 : std_logic;
signal tmp_cdiv00 : std_logic_vector (4 downto 0);
signal tmp_funct0 : std_logic_vector (5 downto 0);
signal tmp_inregRS0 : std_logic_vector (7 downto 0);
signal tmp_inregRT0 : std_logic_vector (7 downto 0);
signal tmp_outalu0 : std_logic_vector (7 downto 0);
signal tmp_outFlagInst0 : std_logic;
signal tmp_outFlagac0 : std_logic;

begin

tmp_clk00 <= clk00;

tmp_enable0 <= enable0;

tmp_cdiv00 <= cdiv00;

tmp_funct0 <= funct0;

tmp_inregRS0 <= inregRS0;

tmp_inregRT0 <= inregRT0;

outalu0 <= tmp_outalu0;

tmp_outFlagInst0 <= outFlagInst0;

tmp_outFlagac0 <= outFlagac0;



u1:   alu00 port map (
		clk00 => tmp_clk00,
		enable0 => tmp_enable0,
		cdiv00 => tmp_cdiv00,
		funct0 => tmp_funct0,
		inregRS0 => tmp_inregRS0,
		inregRT0 => tmp_inregRT0,
		outalu0 => tmp_outalu0,
		outFlagInst0 => tmp_outFlagInst0,
		outFlagac0 => tmp_outFlagac0
       );
end alu0;
