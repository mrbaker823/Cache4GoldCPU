--
-- VHDL Architecture ece411.TrueLRU.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-02.ews.illinois.edu)
--          at - 02:50:36 04/05/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TrueLRU IS
   PORT( 
      EncodeHit : IN     LC3B_8MUX_SEL;
      RESET_L   : IN     std_logic;
      LRUOut    : OUT    LC3B_8MUX_SEL
   );

-- Declarations

END TrueLRU ;

--
ARCHITECTURE untitled OF TrueLRU IS
TYPE RAMMEMORY IS ARRAY (7 DOWNTO 0) OF LC3B_8MUX_SEL;
SIGNAL ARR : RAMMEMORY;
BEGIN
  SHIFTHIT : PROCESS (RESET_L, EncodeHit)
  BEGIN

  IF(RESET_L = '0') THEN
    ARR(0) <= "000"; 
    ARR(1) <= "001"; 
    ARR(2) <= "010"; 
    ARR(3) <= "011"; 
    ARR(4) <= "100"; 
    ARR(5) <= "101"; 
    ARR(6) <= "110";
    ARR(7) <= "111";	
	ELSIF (ARR(0) = EncodeHit) THEN
		ARR(0) <= ARR(1);
		ARR(1) <= ARR(2);
		ARR(2) <= ARR(3);
		ARR(3) <= ARR(4);
		ARR(4) <= ARR(5);
		ARR(5) <= ARR(6);
		ARR(6) <= ARR(7);
		ARR(7) <= EncodeHit;
	ELSIF (ARR(1) = EncodeHit) THEN
	  ARR(1) <= ARR(2);
		ARR(2) <= ARR(3);
		ARR(3) <= ARR(4);
		ARR(4) <= ARR(5);
		ARR(5) <= ARR(6);
		ARR(6) <= ARR(7);
		ARR(7) <= EncodeHit;
	ELSIF (ARR(2) = EncodeHit) THEN
		ARR(2) <= ARR(3);
		ARR(3) <= ARR(4);
		ARR(4) <= ARR(5);
		ARR(5) <= ARR(6);
		ARR(6) <= ARR(7);
		ARR(7) <= EncodeHit;
	ELSIF (ARR(3) = EncodeHit) THEN
		ARR(3) <= ARR(4);
		ARR(4) <= ARR(5);
		ARR(5) <= ARR(6);
		ARR(6) <= ARR(7);
		ARR(7) <= EncodeHit;
	ELSIF (ARR(4) = EncodeHit) THEN
		ARR(4) <= ARR(5);
		ARR(5) <= ARR(6);
		ARR(6) <= ARR(7);
		ARR(7) <= EncodeHit;
		
	ELSIF (ARR(5) = EncodeHit) THEN
		ARR(5) <= ARR(6);
		ARR(6) <= ARR(7);
		ARR(7) <= EncodeHit;
		
	ELSIF (ARR(6) = EncodeHit) THEN
		ARR(6) <= ARR(7);
		ARR(7) <= EncodeHit;
		
	ELSIF (ARR(7) = EncodeHit) THEN
		ARR(7) <= EncodeHit;
	END IF;
	
	LRUout <= ARR(0) after (DELAY_MUX8 + 20 ns);
END PROCESS SHIFTHIT;
END untitled;

