-- VHDL Entity ece411.Encoder8to3.symbol
--
-- Created:
--          by - lachman1.ews (evrt-252-38.ews.illinois.edu)
--          at - 16:40:51 04/18/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Encoder8to3 IS
   PORT( 
      hit0      : IN     STD_LOGIC;
      hit1      : IN     STD_LOGIC;
      hit2      : IN     STD_LOGIC;
      hit3      : IN     STD_LOGIC;
      hit4      : IN     STD_LOGIC;
      hit5      : IN     STD_LOGIC;
      hit6      : IN     STD_LOGIC;
      hit7      : IN     STD_LOGIC;
      EncodeHit : OUT    LC3B_8MUX_SEL
   );

-- Declarations

END Encoder8to3 ;

--
-- VHDL Architecture ece411.Encoder8to3.struct
--
-- Created:
--          by - lachman1.ews (evrt-252-38.ews.illinois.edu)
--          at - 16:40:51 04/18/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Encoder8to3 IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F0 : std_logic;
   SIGNAL F1 : std_logic;
   SIGNAL F2 : std_logic;


   -- Component Declarations
   COMPONENT OR4
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      D : IN     std_logic ;
      F : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : OR4 USE ENTITY ece411.OR4;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   encodeHIT <= F2 & F1 & F0;                                    


   -- Instance port mappings.
   U_0 : OR4
      PORT MAP (
         A => hit1,
         B => hit3,
         C => hit5,
         D => hit7,
         F => F0
      );
   U_1 : OR4
      PORT MAP (
         A => hit2,
         B => hit3,
         C => hit6,
         D => hit7,
         F => F1
      );
   U_2 : OR4
      PORT MAP (
         A => hit4,
         B => hit5,
         C => hit6,
         D => hit7,
         F => F2
      );

END struct;