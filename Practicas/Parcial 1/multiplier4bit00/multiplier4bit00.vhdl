library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagemultiplier4bit00.all;
--esta es otra entidad de nivel superior, creo que es la mayor
entity multiplier4bit00 is
	port(
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		R: out std_logic_vector(7 downto 0)
		);
end multiplier4bit00;

architecture multiplier4bit0 of multiplier4bit00 is
--Sen para las compuertas del primer renglon
signal SA0: std_logic;--SA SEÑAL DE AND
signal SA1: std_logic;
signal SA2: std_logic;

--Sen para las compuertas del segundo renglon
signal SA3: std_logic;
signal SA4: std_logic;
signal SA5: std_logic;
signal SA6: std_logic;

--Sen para las compuertas del tercer renglon
signal SA7: std_logic;
signal SA8: std_logic;
signal SA9: std_logic;
signal SA10: std_logic;

--Sen para las compuertas del tercer renglon
signal SA11: std_logic;
signal SA12: std_logic;
signal SA13: std_logic;
signal SA14: std_logic;


--Sen para las salidas de las sumas de los full adders del primer renglon
signal SSFA01: std_logic;
signal SSFA03: std_logic;
signal SSFA02: std_logic;

--Sen para las salidas de las sumas de los full adders del SEGUNDO RENGLON renglon
signal SSFA04: std_logic;--FA11
signal SSFA05: std_logic;--FA12
signal SSFA06: std_logic;--FA13

--F10 VA R2
--LAS SALIDAS DE LOS 4 SUMADORES DEL TERCER RENGLON VAN DIRECTO A R

--Sen para los acarreos de salida de los sumadores del primer renglon
signal SAC0: std_logic;
signal SAC1: std_logic;
signal SAC2: std_logic;
signal SAC3: std_logic;

--Sen para los acarreos de salida de los sumadores del segundo renglon
signal SAC4: std_logic;
signal SAC5: std_logic;
signal SAC6: std_logic;
signal SAC7: std_logic;

--Sen para los acarreos de salida de los sumadores del tercer renglon
signal SAC8: std_logic;
signal SAC9: std_logic;
signal SAC10: std_logic;
signal SAC11: std_logic;

begin
	--invocamos componentes de entrada
	--4 ands
	--Primera compuerta
	A00: and00 port map(
					Aa => A(0),
					Ba => B(0),
					Ya => R(0)--la salida de la and va directa a R0
					);
	
	--operando 1: FA16
	A01: and00 port map(
					Aa => A(1),
					Ba => B(0),
					Ya => SA0
					);
	
	--operando 1: FA17
	A02: and00 port map(
					Aa => A(2),
					Ba => B(0),
					Ya => SA1
					);
					
	--operando 1: FA18
	A03: and00 port map(
					Aa => A(3),
					Ba => B(0),
					Ya => SA2
					);
	
	--4 ands
	
	--operando 2: FA16
	A04: and00 port map(
					Aa => A(0),
					Ba => B(1),--Ba se conecta a B1
					Ya => SA3--Ya le da su valor a S1
					);
	
	--operando 2: FA17
	A05: and00 port map(
					Aa => A(1),
					Ba => B(1),
					Ya => SA4
					);
	
	--operando 2: FA18	
	A06: and00 port map(
					Aa => A(2),
					Ba => B(1),
					Ya => SA5
					);
					
	A07: and00 port map(
					Aa => A(3),
					Ba => B(1),
					Ya => SA6
					);
	
	
	
	--4 ands
	
	A08: and00 port map(
					Aa => A(0),
					Ba => B(2),
					Ya => SA7
					);
					
	
	A09: and00 port map(
					Aa => A(1),
					Ba => B(2),
					Ya => SA8
					);
					
	A10: and00 port map(
					Aa => A(2),
					Ba => B(2),
					Ya => SA9
					);
					
	A11: and00 port map(
					Aa => A(3),
					Ba => B(2),
					Ya => SA10
					);
					
	--4 ands
	
	A12: and00 port map(
					Aa => A(0),
					Ba => B(3),
					Ya => SA11
					);
					
	A13: and00 port map(
					Aa => A(1),
					Ba => B(3),
					Ya => SA12
					);
					
	A14: and00 port map(
					Aa => A(2),
					Ba => B(3),
					Ya => SA13
					);
					
	A15: and00 port map(
					Aa => A(3),
					Ba => B(3),
					Ya => SA14
					);
	
	--Invocamos full adder del primer renglon
	FA16: fa00 port map(--FA00
						C00 => '0',
						A00 => SA0,
						B00 => SA3,
						S00 => R(1),--La salida se conecta a R1. es el primer sumador
						C01 => SAC0--C01 ENTREGA SU SEÑAL A S2
						);--LISTO
						
	FA17: fa00 port map(--FA01
						C00 => SAC0,
						A00 => SA1,
						B00 => SA4,
						S00 => SSFA01,
						C01 => SAC1
						);
						
	FA18: fa00 port map(--FA02
						C00 => SAC1,
						A00 => SA2,
						B00 => SA5,
						S00 => SSFA02,
						C01 => SAC2
						);
						
	FA19: fa00 port map(--FA03
						C00 => SAC2,
						A00 => '0',
						B00 => SA6,
						S00 => SSFA03,
						C01 => SAC3
						);
	
	-----------------
	----Invocamos full adder del segundo renglon
	FA20: fa00 port map(--FA10
						C00 => '0',
						A00 => SSFA01,
						B00 => SA7,
						S00 => R(2),--La salida se conecta a R1. es el primer sumador
						C01 => SAC4--C01 ENTREGA ACARREO 4
						);--LISTO
	
	FA21: fa00 port map(--FA11
						C00 => SAC4,
						A00 => SSFA02,
						B00 => SA8,
						S00 => SSFA04,
						C01 => SAC5--C01 ENTREGA ACARREO 4
						);--FALTA
	FA22: fa00 port map(--FA12
						C00 => SAC5,
						A00 => SSFA03,
						B00 => SA9,
						S00 => SSFA05,--La salida se conecta a R1. es el primer sumador
						C01 => SAC6--C01 ENTREGA ACARREO 4
						);--LISTO
						
	FA23: fa00 port map(--FA13
						C00 => SAC6,
						A00 => SAC3,
						B00 => SA10,
						S00 => SSFA06,--La salida se conecta a R1. es el primer sumador
						C01 => SAC7--C01 ENTREGA ACARREO 4
						);--LISTO
						
	-----------------------------
	----Invocamos los sumadores del tercer renglon
	FA24: fa00 port map(--FA10 del tercerr renglon
						C00 => '0',
						A00 => SSFA04,
						B00 => SA11,
						S00 => R(3),--La salida se conecta a R1. es el primer sumador
						C01 => SAC8--C01 ENTREGA ACARREO 4
						);--LISTO
	
	FA25: fa00 port map(--FA11 del tercerr renglon
						C00 => SAC8,
						A00 => SSFA05,
						B00 => SA12,
						S00 => R(4),--La salida se conecta a R1. es el primer sumador
						C01 => SAC9--C01 ENTREGA ACARREO 4
						);--LISTO
						
	FA27: fa00 port map(--FA12 del tercerr renglon
						C00 => SAC9,
						A00 => SSFA06,
						B00 => SA13,
						S00 => R(5),--La salida se conecta a R1. es el primer sumador
						C01 => SAC10--C01 ENTREGA ACARREO 4
						);--LISTO
						
	FA28: fa00 port map(--FA12 del tercerr renglon. ES EL ULTIMO
						C00 => SAC10,
						A00 => SAC7,
						B00 => SA14,
						S00 => R(6),--La salida se conecta a R1. es el primer sumador
						C01 => R(7)--C01 ENTREGA ACARREO 4
						);--LISTO
						
end multiplier4bit0;
