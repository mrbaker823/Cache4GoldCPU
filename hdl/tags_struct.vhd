-- VHDL Entity ece411.Tags.interface
--
-- Created:
--          by - lachman1.ews (siebl-0220-04.ews.illinois.edu)
--          at - 02:11:20 04/26/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Tags IS
   PORT( 
      DataWrite0 : IN     std_logic;
      DataWrite1 : IN     std_logic;
      DataWrite2 : IN     std_logic;
      DataWrite3 : IN     std_logic;
      DataWrite4 : IN     std_logic;
      DataWrite5 : IN     std_logic;
      DataWrite6 : IN     std_logic;
      DataWrite7 : IN     std_logic;
      EncodeHit  : IN     LC3B_8MUX_SEL;
      Index      : IN     LC3B_C_INDEX;
      LRUout     : IN     LC3B_8MUX_SEL;
      RESET_L    : IN     std_logic;
      TagIn      : IN     LC3B_C_TAG;
      TagC0      : OUT    std_logic;
      TagC1      : OUT    std_logic;
      TagC2      : OUT    std_logic;
      TagC3      : OUT    std_logic;
      TagC4      : OUT    std_logic;
      TagC5      : OUT    std_logic;
      TagC6      : OUT    std_logic;
      TagC7      : OUT    std_logic;
      oldTag     : OUT    LC3B_C_TAG
   );

-- Declarations

END Tags ;

--
-- VHDL Architecture ece411.Tags.struct
--
-- Created:
--          by - lachman1.ews (siebl-0220-04.ews.illinois.edu)
--          at - 02:11:20 04/26/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Tags IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Reset_7 : std_logic;
   SIGNAL TagOut0 : LC3B_C_TAG;
   SIGNAL TagOut1 : LC3B_C_TAG;
   SIGNAL TagOut2 : LC3B_C_TAG;
   SIGNAL TagOut3 : LC3B_C_TAG;
   SIGNAL TagOut4 : LC3B_C_TAG;
   SIGNAL TagOut5 : LC3B_C_TAG;
   SIGNAL TagOut6 : LC3B_C_TAG;
   SIGNAL TagOut7 : LC3B_C_TAG;


   -- Component Declarations
   COMPONENT ByteCompar
   PORT (
      A : IN     lc3b_C_TAG ;
      B : IN     lc3b_C_TAG ;
      F : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT MUX8_TAG
   PORT (
      A    : IN     LC3B_C_TAG ;
      B    : IN     LC3B_C_TAG ;
      C    : IN     LC3B_C_TAG ;
      D    : IN     LC3B_C_TAG ;
      E    : IN     LC3B_C_TAG ;
      F    : IN     LC3B_C_TAG ;
      G    : IN     LC3B_C_TAG ;
      H    : IN     LC3B_C_TAG ;
      Sel  : IN     LC3B_8Mux_SEL ;
      mOUT : OUT    LC3B_C_TAG 
   );
   END COMPONENT;
   COMPONENT TagArray
   PORT (
      Index    : IN     LC3B_C_INDEX;
      Reset_L  : IN     std_logic;
      TagIn    : IN     LC3B_C_TAG;
      TagWrite : IN     std_logic;
      TagOut   : OUT    LC3B_C_TAG
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ByteCompar USE ENTITY ece411.ByteCompar;
   FOR ALL : MUX8_TAG USE ENTITY ece411.MUX8_TAG;
   FOR ALL : TagArray USE ENTITY ece411.TagArray;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Comp0 : ByteCompar
      PORT MAP (
         A => TagOut0,
         B => TagIn,
         F => TagC0
      );
   Comp1 : ByteCompar
      PORT MAP (
         A => TagOut1,
         B => TagIn,
         F => TagC1
      );
   Comp2 : ByteCompar
      PORT MAP (
         A => TagOut2,
         B => TagIn,
         F => TagC2
      );
   Comp3 : ByteCompar
      PORT MAP (
         A => TagOut3,
         B => TagIn,
         F => TagC3
      );
   Comp4 : ByteCompar
      PORT MAP (
         A => TagOut4,
         B => TagIn,
         F => TagC4
      );
   Comp5 : ByteCompar
      PORT MAP (
         A => TagOut5,
         B => TagIn,
         F => TagC5
      );
   Comp6 : ByteCompar
      PORT MAP (
         A => TagOut6,
         B => TagIn,
         F => TagC6
      );
   Comp7 : ByteCompar
      PORT MAP (
         A => TagOut7,
         B => TagIn,
         F => TagC7
      );
   U_0 : MUX8_TAG
      PORT MAP (
         A    => TagOut0,
         B    => TagOut1,
         C    => TagOut2,
         D    => TagOut3,
         E    => TagOut4,
         F    => TagOut5,
         G    => TagOut6,
         H    => TagOut7,
         Sel  => LRUout,
         mOUT => oldTag
      );
   aTagArray0 : TagArray
      PORT MAP (
         Reset_L  => RESET_L,
         TagWrite => DataWrite0,
         Index    => Index,
         TagIn    => TagIn,
         TagOut   => TagOut0
      );
   aTagArray1 : TagArray
      PORT MAP (
         Reset_L  => RESET_L,
         TagWrite => DataWrite1,
         Index    => Index,
         TagIn    => TagIn,
         TagOut   => TagOut1
      );
   aTagArray2 : TagArray
      PORT MAP (
         Reset_L  => RESET_L,
         TagWrite => DataWrite2,
         Index    => Index,
         TagIn    => TagIn,
         TagOut   => TagOut2
      );
   aTagArray3 : TagArray
      PORT MAP (
         Reset_L  => RESET_L,
         TagWrite => DataWrite3,
         Index    => Index,
         TagIn    => TagIn,
         TagOut   => TagOut3
      );
   aTagArray4 : TagArray
      PORT MAP (
         Reset_L  => RESET_L,
         TagWrite => DataWrite4,
         Index    => Index,
         TagIn    => TagIn,
         TagOut   => TagOut4
      );
   aTagArray5 : TagArray
      PORT MAP (
         Reset_L  => RESET_L,
         TagWrite => DataWrite5,
         Index    => Index,
         TagIn    => TagIn,
         TagOut   => TagOut5
      );
   aTagArray6 : TagArray
      PORT MAP (
         Reset_L  => Reset_7,
         TagWrite => DataWrite6,
         Index    => Index,
         TagIn    => TagIn,
         TagOut   => TagOut6
      );
   aTagArray7 : TagArray
      PORT MAP (
         Reset_L  => RESET_L,
         TagWrite => DataWrite7,
         Index    => Index,
         TagIn    => TagIn,
         TagOut   => TagOut7
      );

END struct;
