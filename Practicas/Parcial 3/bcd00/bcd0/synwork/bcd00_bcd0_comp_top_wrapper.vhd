--
-- Synopsys
-- Vhdl wrapper for top level design, written on Thu Jun  3 15:33:44 2021
--
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.packagebcd00.all;

entity wrapper_for_bcd00 is
   port (
      clk00 : in std_logic;
      clk01 : in std_logic;
      cdiv00 : in std_logic_vector(4 downto 0);
      cdiv01 : in std_logic_vector(4 downto 0);
      inData0 : in std_logic_vector(7 downto 0);
      reset0 : in std_logic;
      enable0 : in std_logic;
      outFlagI80 : in std_logic;
      outFlagI120 : in std_logic;
      outFlagIter120 : in std_logic;
      outFlagAC80 : out std_logic;
      outFlagAC120 : out std_logic;
      outFlagIterA0 : in std_logic;
      outFlagMP0 : in std_logic;
      outFlagIterB0 : in std_logic;
      outFlagPC0 : in std_logic;
      outcontIter0 : in std_logic_vector(3 downto 0);
      outCode0 : in std_logic_vector(3 downto 0);
      outFlagCode0 : in std_logic;
      outPC0 : in std_logic_vector(3 downto 0);
      outAC120 : in std_logic_vector(11 downto 0);
      outAC80 : in std_logic_vector(7 downto 0);
      outTransist0 : in std_logic_vector(3 downto 0);
      outBCD0 : out std_logic_vector(6 downto 0)
   );
end wrapper_for_bcd00;

architecture bcd0 of wrapper_for_bcd00 is

component bcd00
 port (
   clk00 : inout std_logic;
   clk01 : inout std_logic;
   cdiv00 : in std_logic_vector (4 downto 0);
   cdiv01 : in std_logic_vector (4 downto 0);
   inData0 : in std_logic_vector (7 downto 0);
   reset0 : in std_logic;
   enable0 : in std_logic;
   outFlagI80 : inout std_logic;
   outFlagI120 : inout std_logic;
   outFlagIter120 : inout std_logic;
   outFlagAC80 : out std_logic;
   outFlagAC120 : out std_logic;
   outFlagIterA0 : inout std_logic;
   outFlagMP0 : inout std_logic;
   outFlagIterB0 : inout std_logic;
   outFlagPC0 : inout std_logic;
   outcontIter0 : inout std_logic_vector (3 downto 0);
   outCode0 : inout std_logic_vector (3 downto 0);
   outFlagCode0 : inout std_logic;
   outPC0 : inout std_logic_vector (3 downto 0);
   outAC120 : inout std_logic_vector (11 downto 0);
   outAC80 : inout std_logic_vector (7 downto 0);
   outTransist0 : inout std_logic_vector (3 downto 0);
   outBCD0 : out std_logic_vector (6 downto 0)
 );
end component;

signal tmp_clk00 : std_logic;
signal tmp_clk01 : std_logic;
signal tmp_cdiv00 : std_logic_vector (4 downto 0);
signal tmp_cdiv01 : std_logic_vector (4 downto 0);
signal tmp_inData0 : std_logic_vector (7 downto 0);
signal tmp_reset0 : std_logic;
signal tmp_enable0 : std_logic;
signal tmp_outFlagI80 : std_logic;
signal tmp_outFlagI120 : std_logic;
signal tmp_outFlagIter120 : std_logic;
signal tmp_outFlagAC80 : std_logic;
signal tmp_outFlagAC120 : std_logic;
signal tmp_outFlagIterA0 : std_logic;
signal tmp_outFlagMP0 : std_logic;
signal tmp_outFlagIterB0 : std_logic;
signal tmp_outFlagPC0 : std_logic;
signal tmp_outcontIter0 : std_logic_vector (3 downto 0);
signal tmp_outCode0 : std_logic_vector (3 downto 0);
signal tmp_outFlagCode0 : std_logic;
signal tmp_outPC0 : std_logic_vector (3 downto 0);
signal tmp_outAC120 : std_logic_vector (11 downto 0);
signal tmp_outAC80 : std_logic_vector (7 downto 0);
signal tmp_outTransist0 : std_logic_vector (3 downto 0);
signal tmp_outBCD0 : std_logic_vector (6 downto 0);

begin

tmp_clk00 <= clk00;

tmp_clk01 <= clk01;

tmp_cdiv00 <= cdiv00;

tmp_cdiv01 <= cdiv01;

tmp_inData0 <= inData0;

tmp_reset0 <= reset0;

tmp_enable0 <= enable0;

tmp_outFlagI80 <= outFlagI80;

tmp_outFlagI120 <= outFlagI120;

tmp_outFlagIter120 <= outFlagIter120;

outFlagAC80 <= tmp_outFlagAC80;

outFlagAC120 <= tmp_outFlagAC120;

tmp_outFlagIterA0 <= outFlagIterA0;

tmp_outFlagMP0 <= outFlagMP0;

tmp_outFlagIterB0 <= outFlagIterB0;

tmp_outFlagPC0 <= outFlagPC0;

tmp_outcontIter0 <= outcontIter0;

tmp_outCode0 <= outCode0;

tmp_outFlagCode0 <= outFlagCode0;

tmp_outPC0 <= outPC0;

tmp_outAC120 <= outAC120;

tmp_outAC80 <= outAC80;

tmp_outTransist0 <= outTransist0;

outBCD0 <= tmp_outBCD0;



u1:   bcd00 port map (
		clk00 => tmp_clk00,
		clk01 => tmp_clk01,
		cdiv00 => tmp_cdiv00,
		cdiv01 => tmp_cdiv01,
		inData0 => tmp_inData0,
		reset0 => tmp_reset0,
		enable0 => tmp_enable0,
		outFlagI80 => tmp_outFlagI80,
		outFlagI120 => tmp_outFlagI120,
		outFlagIter120 => tmp_outFlagIter120,
		outFlagAC80 => tmp_outFlagAC80,
		outFlagAC120 => tmp_outFlagAC120,
		outFlagIterA0 => tmp_outFlagIterA0,
		outFlagMP0 => tmp_outFlagMP0,
		outFlagIterB0 => tmp_outFlagIterB0,
		outFlagPC0 => tmp_outFlagPC0,
		outcontIter0 => tmp_outcontIter0,
		outCode0 => tmp_outCode0,
		outFlagCode0 => tmp_outFlagCode0,
		outPC0 => tmp_outPC0,
		outAC120 => tmp_outAC120,
		outAC80 => tmp_outAC80,
		outTransist0 => tmp_outTransist0,
		outBCD0 => tmp_outBCD0
       );
end bcd0;
