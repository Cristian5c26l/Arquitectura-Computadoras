library ieee;--archivo 9 y ultimo. Esta es la entidad de nivel superior
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagemultiplier8bit00.all;
--esta es otra entidad de nivel superior, creo que es la mayor
entity multiplier8bit00 is
	port(
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		R: out std_logic_vector(15 downto 0)
		);
end multiplier8bit00;
--modificar la arquitectura
architecture multiplier8bit0 of multiplier8bit00 is
--Sen para las compuertas del primer renglon
signal SA0: std_logic;--SA SENIAL DE AND
signal SA1: std_logic;
signal SA2: std_logic;
signal SA3: std_logic;--SA SENIAL DE AND
signal SA4: std_logic;
signal SA5: std_logic;
signal SA6: std_logic;

--Sen para las compuertas del segundo renglon
signal SA7: std_logic;
signal SA8: std_logic;
signal SA9: std_logic;
signal SA10: std_logic;
signal SA11: std_logic;
signal SA12: std_logic;
signal SA13: std_logic;
signal SA14: std_logic;

--Sen para las compuertas del tercer renglon
signal SA15: std_logic;
signal SA16: std_logic;
signal SA17: std_logic;
signal SA18: std_logic;
signal SA19: std_logic;
signal SA20: std_logic;
signal SA21: std_logic;
signal SA22: std_logic;

--Sen para las compuertas del cuarto renglon
signal SA23: std_logic;
signal SA24: std_logic;
signal SA25: std_logic;
signal SA26: std_logic;
signal SA27: std_logic;
signal SA28: std_logic;
signal SA29: std_logic;
signal SA30: std_logic;

--Sen para las compuertas del quinto renglon
signal SA31: std_logic;
signal SA32: std_logic;
signal SA33: std_logic;
signal SA34: std_logic;
signal SA35: std_logic;
signal SA36: std_logic;
signal SA37: std_logic;
signal SA38: std_logic;

--Sen para las compuertas del sexto renglon
signal SA39: std_logic;
signal SA40: std_logic;
signal SA41: std_logic;
signal SA42: std_logic;
signal SA43: std_logic;
signal SA44: std_logic;
signal SA45: std_logic;
signal SA46: std_logic;

--Sen para las compuertas del septimo renglon
signal SA47: std_logic;
signal SA48: std_logic;
signal SA49: std_logic;
signal SA50: std_logic;
signal SA51: std_logic;
signal SA52: std_logic;
signal SA53: std_logic;
signal SA54: std_logic;

--Sen para las compuertas del octavo renglon
signal SA55: std_logic;
signal SA56: std_logic;
signal SA57: std_logic;
signal SA58: std_logic;
signal SA59: std_logic;
signal SA60: std_logic;
signal SA61: std_logic;
signal SA62: std_logic;
-----------------------------------------------------------------------------
--6 renglones con 8 sumadores. Solo 7 sumadores de cada renglon necesitan una senal. El ultimo renglon de sumadores no necesitan senales de salida
--Sen para las salidas de las sumas de los full adders del primer renglon.
signal SSFA01: std_logic;
signal SSFA02: std_logic;
signal SSFA03: std_logic;
signal SSFA04: std_logic;
signal SSFA05: std_logic;
signal SSFA06: std_logic;
signal SSFA07: std_logic;

--Sen para las salidas de las sumas de los full adders del SEGUNDO RENGLON 
signal SSFA08: std_logic;--FA11
signal SSFA09: std_logic;--FA12
signal SSFA10: std_logic;--FA13
signal SSFA11: std_logic;--FA11
signal SSFA12: std_logic;--FA12
signal SSFA13: std_logic;--FA13
signal SSFA14: std_logic;--FA11

--Sen para las salidas de las sumas de los full adders del tercer RENGLON 
signal SSFA15: std_logic;--FA11
signal SSFA16: std_logic;--FA12
signal SSFA17: std_logic;--FA13
signal SSFA18: std_logic;--FA11
signal SSFA19: std_logic;--FA12
signal SSFA20: std_logic;--FA13
signal SSFA21: std_logic;--FA11

--Sen para las salidas de las sumas de los full adders del cuarto RENGLON 
signal SSFA22: std_logic;--FA11
signal SSFA23: std_logic;--FA12
signal SSFA24: std_logic;--FA13
signal SSFA25: std_logic;--FA11
signal SSFA26: std_logic;--FA12
signal SSFA27: std_logic;--FA13
signal SSFA28: std_logic;--FA11

--Sen para las salidas de las sumas de los full adders del quinto RENGLON 
signal SSFA29: std_logic;--FA11
signal SSFA30: std_logic;--FA12
signal SSFA31: std_logic;--FA13
signal SSFA32: std_logic;--FA11
signal SSFA33: std_logic;--FA12
signal SSFA34: std_logic;--FA13
signal SSFA35: std_logic;--FA11

--Sen para las salidas de las sumas de los full adders del sexto RENGLON 
signal SSFA36: std_logic;--FA11
signal SSFA37: std_logic;--FA12
signal SSFA38: std_logic;--FA13
signal SSFA39: std_logic;--FA11
signal SSFA40: std_logic;--FA12
signal SSFA41: std_logic;--FA13
signal SSFA42: std_logic;--FA11

--F10 VA R2
--LAS SALIDAS DE LOS 4 SUMADORES DEL TERCER RENGLON VAN DIRECTO A R

--Sen para los acarreos de salida de los sumadores del primer renglon
signal SAC0: std_logic;
signal SAC1: std_logic;
signal SAC2: std_logic;
signal SAC3: std_logic;
signal SAC4: std_logic;
signal SAC5: std_logic;
signal SAC6: std_logic;
signal SAC7: std_logic;

--Sen para los acarreos de salida de los sumadores del segundo renglon
signal SAC8: std_logic;
signal SAC9: std_logic;
signal SAC10: std_logic;
signal SAC11: std_logic;
signal SAC12: std_logic;
signal SAC13: std_logic;
signal SAC14: std_logic;
signal SAC15: std_logic;

--mod a partir de aqui
--tercer renglon
signal SAC16: std_logic;
signal SAC17: std_logic;
signal SAC18: std_logic;
signal SAC19: std_logic;
signal SAC20: std_logic;
signal SAC21: std_logic;
signal SAC22: std_logic;
signal SAC23: std_logic;
--cuarto renglon

signal SAC24: std_logic;
signal SAC25: std_logic;
signal SAC26: std_logic;
signal SAC27: std_logic;
signal SAC28: std_logic;
signal SAC29: std_logic;
signal SAC30: std_logic;
signal SAC31: std_logic;

--quinto renglon

signal SAC32: std_logic;
signal SAC33: std_logic;
signal SAC34: std_logic;
signal SAC35: std_logic;
signal SAC36: std_logic;
signal SAC37: std_logic;
signal SAC38: std_logic;
signal SAC39: std_logic;

--sexto renglon

signal SAC40: std_logic;
signal SAC41: std_logic;
signal SAC42: std_logic;
signal SAC43: std_logic;
signal SAC44: std_logic;
signal SAC45: std_logic;
signal SAC46: std_logic;
signal SAC47: std_logic;

--septimo renglon y ultimo de la generacion de acarreos por el ultimo arreglo de sumadores
signal SAC48: std_logic;
signal SAC49: std_logic;
signal SAC50: std_logic;
signal SAC51: std_logic;
signal SAC52: std_logic;
signal SAC53: std_logic;
signal SAC54: std_logic;
signal SAC55: std_logic;

signal sa00: std_logic;
signal ss00: std_logic;
signal ss01: std_logic;
signal ss02: std_logic;
signal ss03: std_logic;

begin
	--invocamos componentes de entrada
	--4 ands
	--Primera compuerta
	M000: and00 port map(
					Aa => A(0),
					Ba => B(0),
					Ya => sa00--la salida de la and va directa a R0
					);
	R(0) <= sa00;
	--operando 1: FA16
	M001: and00 port map(
					Aa => A(1),
					Ba => B(0),
					Ya => SA0
					);
	
	--operando 1: FA17
	M002: and00 port map(
					Aa => A(2),
					Ba => B(0),
					Ya => SA1
					);
					
	--operando 1: FA18
	M003: and00 port map(
					Aa => A(3),
					Ba => B(0),
					Ya => SA2
					);
					
	M004: and00 port map(
					Aa => A(4),
					Ba => B(0),
					Ya => SA3
					);
	
	M005: and00 port map(
					Aa => A(5),
					Ba => B(0),
					Ya => SA4
					);
	
	M006: and00 port map(
					Aa => A(6),
					Ba => B(0),
					Ya => SA5
					);
					
	M007: and00 port map(
					Aa => A(7),
					Ba => B(0),
					Ya => SA6
					);
	--FIN
	--8 ands
	
	--operando 2: FA16
	M008: and00 port map(
					Aa => A(0),
					Ba => B(1),--Ba se conecta a B1
					Ya => SA7--Ya le da su valor a S1
					);
	
	--operando 2: FA17
	M009: and00 port map(
					Aa => A(1),
					Ba => B(1),
					Ya => SA8
					);
	
	--operando 2: FA18	
	M010: and00 port map(
					Aa => A(2),
					Ba => B(1),
					Ya => SA9
					);
					
	M011: and00 port map(
					Aa => A(3),
					Ba => B(1),
					Ya => SA10
					);
					
	M012: and00 port map(
					Aa => A(4),
					Ba => B(1),
					Ya => SA11
					);
					
	M013: and00 port map(
					Aa => A(5),
					Ba => B(1),
					Ya => SA12
					);
					
	M014: and00 port map(
					Aa => A(6),
					Ba => B(1),
					Ya => SA13
					);
					
	M015: and00 port map(
					Aa => A(7),
					Ba => B(1),
					Ya => SA14
					);
	
	--FIN
	--Invocamos full adder del primer renglon
	M016: fa00 port map(--FA00
						C00 => '0',
						A00 => SA0,
						B00 => SA7,
						S00 => ss00,--La salida se conecta a R1. es el primer sumador
						C01 => SAC0--C01 ENTREGA SU SE?AL A S2
						);--LISTO
	R(1) <= ss00;
	M017: fa00 port map(--FA01
						C00 => SAC0,
						A00 => SA1,
						B00 => SA8,
						S00 => SSFA01,
						C01 => SAC1
						);
						
	M018: fa00 port map(--FA02
						C00 => SAC1,
						A00 => SA2,
						B00 => SA9,
						S00 => SSFA02,
						C01 => SAC2
						);
	--MOD
	M019: fa00 port map(--FA02
						C00 => SAC2,--LISTO
						A00 => SA3,--LISTO
						B00 => SA10,--LISTO
						S00 => SSFA03,
						C01 => SAC3--LISTO
						);
	
	M020: fa00 port map(--FA02
						C00 => SAC3,
						A00 => SA4,
						B00 => SA11,
						S00 => SSFA04,
						C01 => SAC4
						);
						
	M021: fa00 port map(--FA02
						C00 => SAC4,
						A00 => SA5,
						B00 => SA12,
						S00 => SSFA05,
						C01 => SAC5
						);
						
	M022: fa00 port map(--FA02
						C00 => SAC5,
						A00 => SA6,
						B00 => SA13,
						S00 => SSFA06,
						C01 => SAC6
						);
	--ULTIMO
	--------------------------------
	M023: fa00 port map(--FA03--ULTIMO
						C00 => SAC6,
						A00 => '0',
						B00 => SA14,
						S00 => SSFA07,
						C01 => SAC7
						);
	
	------------------------------------------------------------
	---CREO QUE YA ESTA BIEN EL PRIMER RENGLON
	--8 ands
	
	M024: and00 port map(
					Aa => A(0),
					Ba => B(2),
					Ya => SA15
					);
					
	
	M025: and00 port map(
					Aa => A(1),
					Ba => B(2),
					Ya => SA16
					);
					
	M026: and00 port map(
					Aa => A(2),
					Ba => B(2),
					Ya => SA17
					);
					
	M027: and00 port map(
					Aa => A(3),
					Ba => B(2),
					Ya => SA18
					);
					
	M028: and00 port map(
					Aa => A(4),
					Ba => B(2),
					Ya => SA19
					);
					
	M029: and00 port map(
					Aa => A(5),
					Ba => B(2),
					Ya => SA20
					);
					
	M030: and00 port map(
					Aa => A(6),
					Ba => B(2),
					Ya => SA21
					);
					
	M031: and00 port map(
					Aa => A(7),
					Ba => B(2),
					Ya => SA22
					);
					
	
	
	----Invocamos full adder del SEGUNDO RENGLON
	M032: fa00 port map(--FA10
						C00 => '0',
						A00 => SSFA01,
						B00 => SA15,
						S00 => ss01,--La salida se conecta a R1. es el primer sumador
						C01 => SAC8--LISTO
						);--LISTO
	R(2)<=ss01;
	M033: fa00 port map(--FA11
						C00 => SAC8,--LISTO
						A00 => SSFA02,
						B00 => SA16,
						S00 => SSFA08,
						C01 => SAC9--LISTO
						);--FALTA
						
	M034: fa00 port map(--FA12
						C00 => SAC9,--LISTO
						A00 => SSFA03,
						B00 => SA17,
						S00 => SSFA09,--La salida se conecta a R1. es el primer sumador
						C01 => SAC10--LISTO
						);--LISTO
	
	M035: fa00 port map(--FA12
						C00 => SAC10,--LISTO
						A00 => SSFA04,
						B00 => SA18,
						S00 => SSFA10,--La salida se conecta a R1. es el primer sumador
						C01 => SAC11--LISTO
						);--LISTO	
	
	M036: fa00 port map(--FA12
						C00 => SAC11,--LISTO
						A00 => SSFA05,
						B00 => SA19,
						S00 => SSFA11,--La salida se conecta a R1. es el primer sumador
						C01 => SAC12--LISTO
						);--LISTO
						
	M037: fa00 port map(--FA12
						C00 => SAC12,--LISTO
						A00 => SSFA06,
						B00 => SA20,
						S00 => SSFA12,--La salida se conecta a R1. es el primer sumador
						C01 => SAC13--LISTO
						);--LISTO
						
	M038: fa00 port map(--FA12
						C00 => SAC13,--LISTO
						A00 => SSFA07,
						B00 => SA21,
						S00 => SSFA13,--La salida se conecta a R1. es el primer sumador
						C01 => SAC14--LISTO
						);--LISTO

	
	--ULTIMO
	M039: fa00 port map(--FA13
						C00 => SAC14,
						A00 => SAC7,--------------------------EN EL ULTIMO SUMADOR DE UN RENGLON ANTERIOR. SALTOS DE 8. DESPUES DE 7, 15. Despues de 15, 23
						B00 => SA22,-------------------------ES LA ULTIMA COMPUERTA, DEL TERCER RENGLON DE DERECHA A IZQUIERDA
						S00 => SSFA14,--La salida se conecta a R1. es el primer sumador
						C01 => SAC15--C01 ENTREGA ACARREO 4
						);--LISTO
										
	--FIN-----------------------------------------------------------------------------------------------				
	--8 ands
	
	M040: and00 port map(
					Aa => A(0),
					Ba => B(3),
					Ya => SA23
					);
					
	M041: and00 port map(
					Aa => A(1),
					Ba => B(3),
					Ya => SA24
					);
					
	M042: and00 port map(
					Aa => A(2),
					Ba => B(3),
					Ya => SA25
					);
					
	M043: and00 port map(
					Aa => A(3),
					Ba => B(3),
					Ya => SA26
					);
	
	M044: and00 port map(
					Aa => A(4),
					Ba => B(3),
					Ya => SA27
					);
					
	M045: and00 port map(
					Aa => A(5),
					Ba => B(3),
					Ya => SA28
					);
					
	M046: and00 port map(
					Aa => A(6),
					Ba => B(3),
					Ya => SA29
					);
					
	M047: and00 port map(
					Aa => A(7),
					Ba => B(3),
					Ya => SA30
					);
	
--TERCER RENGLON DE SUMADORES
	M048: fa00 port map(--FA10
						C00 => '0',
						A00 => SSFA08,--VA DE 7 EN 7 EN EL PRIMER COMPONENTE
						B00 => SA23,--VA DE 8 EN 8 RESPECTO AL ANTERIOR RENGLON
						S00 => ss02,--La salida se conecta a R1. es el primer sumador
						C01 => SAC16--LISTO
						);--LISTO
	R(3)<=ss02;					
	M049: fa00 port map(--FA11
						C00 => SAC16,--LISTO
						A00 => SSFA09,
						B00 => SA24,--LISTO
						S00 => SSFA15,--LISTO
						C01 => SAC17--LISTO
						);	
						
	M050: fa00 port map(--FA11
						C00 => SAC17,--LISTO
						A00 => SSFA10,
						B00 => SA25,--LISTO
						S00 => SSFA16,
						C01 => SAC18--LISTO
						);
						
	M051: fa00 port map(--FA11
						C00 => SAC18,--LISTO
						A00 => SSFA11,
						B00 => SA26,--LISTO
						S00 => SSFA17,
						C01 => SAC19--LISTO
						);
						
	M052: fa00 port map(--FA11
						C00 => SAC19,--LISTO
						A00 => SSFA12,
						B00 => SA27,--LISTO
						S00 => SSFA18,
						C01 => SAC20--LISTO
						);
						
	M053: fa00 port map(--FA11
						C00 => SAC20,--LISTO
						A00 => SSFA13,
						B00 => SA28,--LISTO
						S00 => SSFA19,
						C01 => SAC21--LISTO
						);
	M054: fa00 port map(--FA11
						C00 => SAC21,--LISTO
						A00 => SSFA14,
						B00 => SA29,--LISTO
						S00 => SSFA20,
						C01 => SAC22--LISTO
						);
						
	--ULTIMO SUMADOR DE DERECHA A IZQUIERDA DEL TERCER RENGLON					
	M055: fa00 port map(--FA11
						C00 => SAC22,--LISTO--BIEN
						A00 => SAC15,--LISTO--BIEN
						B00 => SA30,--ITERACION--BIEN
						S00 => SSFA21,--LISTO--BIEN
						C01 => SAC23--LISTO--BIEN
						);	
	
	--FIN
	
	
	--8 ands
	
	M056: and00 port map(
					Aa => A(0),
					Ba => B(4),
					Ya => SA31
					);
					
	M057: and00 port map(
					Aa => A(1),
					Ba => B(4),
					Ya => SA32
					);
					
	M058: and00 port map(
					Aa => A(2),
					Ba => B(4),
					Ya => SA33
					);
					
	M059: and00 port map(
					Aa => A(3),
					Ba => B(4),
					Ya => SA34
					);
	
	M060: and00 port map(
					Aa => A(4),
					Ba => B(4),
					Ya => SA35
					);
					
	M061: and00 port map(
					Aa => A(5),
					Ba => B(4),
					Ya => SA36
					);
					
	M062: and00 port map(
					Aa => A(6),
					Ba => B(4),
					Ya => SA37
					);
					
	M063: and00 port map(
					Aa => A(7),
					Ba => B(4),
					Ya => SA38
					);
					
	--CUARTO RENGLON DE SUMADORES--corregir a partir de aqi
	M064: fa00 port map(--FA10
						C00 => '0',
						A00 => SSFA15,--VA DE 7 EN 7 RESPECTO AL ANTERIOR, SE SUMA 1 AL POSTERIOR
						B00 => SA31,--VA DE 8 EN 8 RESPECTO AL ANTERIOR RENGLON SE SUMA 1 AL POSTERIOR
						S00 => ss03,--La salida se conecta a R1. es el primer sumador
						C01 => SAC24--LISTO--SUMA DE 1 RESPECTO AL ANTERIOR Y SUMA 1 AL POSTERIOR
						);--LISTO
	R(4)<=ss03;						
	M065: fa00 port map(--FA11
						C00 => SAC24,--LISTO
						A00 => SSFA16,
						B00 => SA32,--LISTO
						S00 => SSFA22,--LISTO
						C01 => SAC25--LISTO
						);	
						
	M066: fa00 port map(--FA11
						C00 => SAC25,--LISTO
						A00 => SSFA17,
						B00 => SA33,--LISTO
						S00 => SSFA23,
						C01 => SAC26--LISTO
						);
						
	M067: fa00 port map(--FA11
						C00 => SAC26,--LISTO
						A00 => SSFA18,
						B00 => SA34,--LISTO
						S00 => SSFA24,
						C01 => SAC27--LISTO
						);
						
	M068: fa00 port map(--FA11
						C00 => SAC27,--LISTO
						A00 => SSFA19,
						B00 => SA35,--LISTO
						S00 => SSFA25,
						C01 => SAC28--LISTO
						);
						
	M069: fa00 port map(--FA11
						C00 => SAC28,--LISTO
						A00 => SSFA20,
						B00 => SA36,--LISTO
						S00 => SSFA26,
						C01 => SAC29--LISTO
						);
						
	M070: fa00 port map(--FA11
						C00 => SAC29,--LISTO
						A00 => SSFA21,
						B00 => SA37,--LISTO--ITERACION
						S00 => SSFA27,--LISTO
						C01 => SAC30--LISTO
						);
	--ULTIMO SUMADOR DE DERECHA A IZQUIERDA DEL TERCER RENGLON					
	M071: fa00 port map(--FA11
						C00 => SAC30,--LISTO--BIEN
						A00 => SAC23,--LISTO--BIEN
						B00 => SA38,--LISTO--BIEN
						S00 => SSFA28,--LISTO--BIEN
						C01 => SAC31--LISTO--BIEN
						);

	--FIN
	--8 ands
	
	M072: and00 port map(
					Aa => A(0),
					Ba => B(5),
					Ya => SA39
					);
					
	M073: and00 port map(
					Aa => A(1),
					Ba => B(5),
					Ya => SA40
					);
					
	M074: and00 port map(
					Aa => A(2),
					Ba => B(5),
					Ya => SA41
					);
					
	M075: and00 port map(
					Aa => A(3),
					Ba => B(5),
					Ya => SA42
					);
	
	M076: and00 port map(
					Aa => A(4),
					Ba => B(5),
					Ya => SA43
					);
					
	M077: and00 port map(
					Aa => A(5),
					Ba => B(5),
					Ya => SA44
					);
					
	M078: and00 port map(
					Aa => A(6),
					Ba => B(5),
					Ya => SA45
					);
					
	M079: and00 port map(
					Aa => A(7),
					Ba => B(5),
					Ya => SA46
					);
					
	--QUINTO RENGLON
	M080: fa00 port map(--FA10
						C00 => '0',
						A00 => SSFA22,--VA DE 7 EN 7 RESPECTO AL ANTERIOR, SE SUMA 1 AL POSTERIOR
						B00 => SA39,--VA DE 8 EN 8 RESPECTO AL ANTERIOR RENGLON SE SUMA 1 AL POSTERIOR
						S00 => R(5),--La salida se conecta a R1. es el primer sumador
						C01 => SAC32--LISTO--SUMA DE 1 RESPECTO AL ANTERIOR Y SUMA 1 AL POSTERIOR
						);--LISTO
						
	M081: fa00 port map(--FA11
						C00 => SAC32,--LISTO
						A00 => SSFA23,
						B00 => SA40,--LISTO
						S00 => SSFA29,--LISTO
						C01 => SAC33--LISTO
						);	
						
	M082: fa00 port map(--FA11
						C00 => SAC33,--LISTO
						A00 => SSFA24,
						B00 => SA41,--LISTO
						S00 => SSFA30,
						C01 => SAC34--LISTO
						);
						
	M083: fa00 port map(--FA11
						C00 => SAC34,--LISTO
						A00 => SSFA25,
						B00 => SA42,--LISTO
						S00 => SSFA31,
						C01 => SAC35--LISTO
						);
						
	M084: fa00 port map(--FA11
						C00 => SAC35,--LISTO
						A00 => SSFA26,
						B00 => SA43,--LISTO
						S00 => SSFA32,
						C01 => SAC36--LISTO
						);
						
	M085: fa00 port map(--FA11
						C00 => SAC36,--LISTO
						A00 => SSFA27,
						B00 => SA44,--LISTO
						S00 => SSFA33,
						C01 => SAC37--LISTO
						);
						
	M086: fa00 port map(--FA11
						C00 => SAC37,--LISTO
						A00 => SSFA28,
						B00 => SA45,--LISTO--ITERACION
						S00 => SSFA34,--LISTO
						C01 => SAC38--LISTO
						);
	--ULTIMO SUMADOR DE DERECHA A IZQUIERDA DEL TERCER RENGLON					
	M087: fa00 port map(--FA11
						C00 => SAC38,--LISTO--BIEN
						A00 => SAC31,--LISTO--BIEN
						B00 => SA46,--LISTO--BIEN
						S00 => SSFA35,--LISTO--BIEN
						C01 => SAC39--LISTO--BIEN
						);
--

	--FIN
	--8 ands
	
	M088: and00 port map(
					Aa => A(0),
					Ba => B(6),
					Ya => SA47
					);
					
	M089: and00 port map(
					Aa => A(1),
					Ba => B(6),
					Ya => SA48
					);
					
	M090: and00 port map(
					Aa => A(2),
					Ba => B(6),
					Ya => SA49
					);
					
	M091: and00 port map(
					Aa => A(3),
					Ba => B(6),
					Ya => SA50
					);
	
	M092: and00 port map(
					Aa => A(4),
					Ba => B(6),
					Ya => SA51
					);
					
	M093: and00 port map(
					Aa => A(5),
					Ba => B(6),
					Ya => SA52
					);
					
	M094: and00 port map(
					Aa => A(6),
					Ba => B(6),
					Ya => SA53
					);
					
	M095: and00 port map(
					Aa => A(7),
					Ba => B(6),
					Ya => SA54
					);
	
--SEXTO RENGLON
	M096: fa00 port map(--FA10
						C00 => '0',
						A00 => SSFA29,--VA DE 7 EN 7 RESPECTO AL ANTERIOR, SE SUMA 1 AL POSTERIOR
						B00 => SA47,--VA DE 8 EN 8 RESPECTO AL ANTERIOR RENGLON SE SUMA 1 AL POSTERIOR
						S00 => R(6),--La salida se conecta a R1. es el primer sumador
						C01 => SAC40--LISTO--SUMA DE 1 RESPECTO AL ANTERIOR Y SUMA 1 AL POSTERIOR
						);--LISTO
						
	M097: fa00 port map(--FA11
						C00 => SAC40,--LISTO
						A00 => SSFA30,
						B00 => SA48,--LISTO
						S00 => SSFA36,--LISTO
						C01 => SAC41--LISTO
						);	
						
	M098: fa00 port map(--FA11
						C00 => SAC41,--LISTO
						A00 => SSFA31,
						B00 => SA49,--LISTO
						S00 => SSFA37,
						C01 => SAC42--LISTO
						);
						
	M099: fa00 port map(--FA11
						C00 => SAC42,--LISTO
						A00 => SSFA32,
						B00 => SA50,--LISTO
						S00 => SSFA38,
						C01 => SAC43--LISTO
						);
						
	M100: fa00 port map(--FA11
						C00 => SAC43,--LISTO
						A00 => SSFA33,
						B00 => SA51,--LISTO
						S00 => SSFA39,
						C01 => SAC44--LISTO
						);
						
	M101: fa00 port map(--FA11
						C00 => SAC44,--LISTO
						A00 => SSFA34,
						B00 => SA52,--LISTO
						S00 => SSFA40,
						C01 => SAC45--LISTO
						);
						
	M102: fa00 port map(--FA11
						C00 => SAC45,--LISTO
						A00 => SSFA35,
						B00 => SA53,--LISTO--ITERACION
						S00 => SSFA41,--LISTO
						C01 => SAC46--LISTO
						);

	--ULTIMO SUMADOR DE DERECHA A IZQUIERDA DEL TERCER RENGLON					
	M103: fa00 port map(--FA11
						C00 => SAC46,--LISTO--BIEN
						A00 => SAC39,--LISTO--BIEN--ESTABLECIDO
						B00 => SA54,--LISTO--BIEN--ESTABLECIDO
						S00 => SSFA42,--LISTO--BIEN
						C01 => SAC47--LISTO--BIEN
						);
	--FIN
	--8 ands
	
	M104: and00 port map(
					Aa => A(0),
					Ba => B(7),
					Ya => SA55
					);
					
	M105: and00 port map(
					Aa => A(1),
					Ba => B(7),
					Ya => SA56
					);
					
	M106: and00 port map(
					Aa => A(2),
					Ba => B(7),
					Ya => SA57
					);
					
	M107: and00 port map(
					Aa => A(3),
					Ba => B(7),
					Ya => SA58
					);
	
	M108: and00 port map(
					Aa => A(4),
					Ba => B(7),
					Ya => SA59
					);
					
	M109: and00 port map(
					Aa => A(5),
					Ba => B(7),
					Ya => SA60
					);
					
	M110: and00 port map(
					Aa => A(6),
					Ba => B(7),
					Ya => SA61
					);
					
	M111: and00 port map(
					Aa => A(7),
					Ba => B(7),
					Ya => SA62
					);
	--FIN
	--FIN DE INVOCACION DE LAS COMPUERTAS....................................................................................................
-----
--ULTIMO RENGLON CON SUMADORES
	M112: fa00 port map(--FA10
						C00 => '0',
						A00 => SSFA36,--VA DE 7 EN 7 RESPECTO AL ANTERIOR, SE SUMA 1 AL POSTERIOR
						B00 => SA55,--VA DE 8 EN 8 RESPECTO AL ANTERIOR RENGLON SE SUMA 1 AL POSTERIOR
						S00 => R(7),--La salida se conecta a R1. es el primer sumador
						C01 => SAC48--LISTO--SUMA DE 1 RESPECTO AL ANTERIOR Y SUMA 1 AL POSTERIOR
						);--LISTO
						
	M113: fa00 port map(--FA11
						C00 => SAC48,--LISTO
						A00 => SSFA37,
						B00 => SA56,--LISTO
						S00 => R(8),--La salida se conecta a R1. es el primer sumador
						C01 => SAC49--LISTO
						);	
						
	M114: fa00 port map(--FA11
						C00 => SAC49,--LISTO
						A00 => SSFA38,
						B00 => SA57,--LISTO
						S00 => R(9),--La salida se conecta a R1. es el primer sumador
						C01 => SAC50--LISTO
						);
						
	M115: fa00 port map(--FA11
						C00 => SAC50,--LISTO
						A00 => SSFA39,
						B00 => SA58,--LISTO
						S00 => R(10),--La salida se conecta a R1. es el primer sumador
						C01 => SAC51--LISTO
						);
						
	M116: fa00 port map(--FA11
						C00 => SAC51,--LISTO
						A00 => SSFA40,
						B00 => SA59,--LISTO
						S00 => R(11),--La salida se conecta a R1. es el primer sumador
						C01 => SAC52--LISTO
						);
						
	M117: fa00 port map(--FA11
						C00 => SAC52,--LISTO
						A00 => SSFA41,
						B00 => SA60,--LISTO
						S00 => R(12),--La salida se conecta a R1. es el primer sumador
						C01 => SAC53--LISTO
						);
						
	M118: fa00 port map(--FA11
						C00 => SAC53,--LISTO
						A00 => SSFA42,
						B00 => SA61,--LISTO--ITERACION
						S00 => R(13),--La salida se conecta a R1. es el primer sumador
						C01 => SAC54--LISTO
						);

	--ULTIMO SUMADOR DE DERECHA A IZQUIERDA DEL TERCER RENGLON					
	M119: fa00 port map(--FA11
						C00 => SAC54,--LISTO--BIEN
						A00 => SAC47,--LISTO--BIEN--ESTABLECIDO
						B00 => SA62,--LISTO--BIEN--ESTABLECIDO
						S00 => R(14),--La salida se conecta a R1. es el primer sumador
						C01 => R(15)
						);
						
end multiplier8bit0;
