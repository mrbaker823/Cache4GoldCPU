-- VHDL Entity ece411.DirtyBits.interface
--
-- Created:
--          by - baker30.ews (evrt-252-37.ews.illinois.edu)
--          at - 21:56:28 04/18/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DirtyBits IS
   PORT( 
      DataWrite0 : IN     std_logic;
      DataWrite1 : IN     std_logic;
      DataWrite2 : IN     std_logic;
      DataWrite3 : IN     std_logic;
      DataWrite4 : IN     std_logic;
      DataWrite5 : IN     std_logic;
      DataWrite6 : IN     std_logic;
      DataWrite7 : IN     std_logic;
      DirtyIn    : IN     std_logic;
      Index      : IN     LC3B_C_INDEX;
      RESET_L    : IN     std_logic;
      BitOut0    : OUT    std_logic;
      BitOut1    : OUT    std_logic;
      BitOut2    : OUT    std_logic;
      BitOut3    : OUT    std_logic;
      BitOut4    : OUT    std_logic;
      BitOut5    : OUT    std_logic;
      BitOut6    : OUT    std_logic;
      BitOut7    : OUT    std_logic
   );

-- Declarations

END DirtyBits ;

--
-- VHDL Architecture ece411.DirtyBits.struct
--
-- Created:
--          by - baker30.ews (evrt-252-37.ews.illinois.edu)
--          at - 21:56:28 04/18/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF DirtyBits IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT BitArray
   PORT (
      BitIn    : IN     std_logic;
      BitWrite : IN     std_logic;
      Index    : IN     LC3B_C_INDEX;
      Reset_L  : IN     std_logic;
      BitOut   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : BitArray USE ENTITY ece411.BitArray;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   dirtyBit0 : BitArray
      PORT MAP (
         Reset_L  => RESET_L,
         BitWrite => DataWrite0,
         Index    => Index,
         BitIn    => DirtyIn,
         BitOut   => BitOut0
      );
   dirtyBit1 : BitArray
      PORT MAP (
         Reset_L  => RESET_L,
         BitWrite => DataWrite1,
         Index    => Index,
         BitIn    => DirtyIn,
         BitOut   => BitOut1
      );
   dirtyBit2 : BitArray
      PORT MAP (
         Reset_L  => RESET_L,
         BitWrite => DataWrite2,
         Index    => Index,
         BitIn    => DirtyIn,
         BitOut   => BitOut2
      );
   dirtyBit3 : BitArray
      PORT MAP (
         Reset_L  => RESET_L,
         BitWrite => DataWrite3,
         Index    => Index,
         BitIn    => DirtyIn,
         BitOut   => BitOut3
      );
   dirtyBit4 : BitArray
      PORT MAP (
         Reset_L  => RESET_L,
         BitWrite => DataWrite4,
         Index    => Index,
         BitIn    => DirtyIn,
         BitOut   => BitOut4
      );
   dirtyBit5 : BitArray
      PORT MAP (
         Reset_L  => RESET_L,
         BitWrite => DataWrite5,
         Index    => Index,
         BitIn    => DirtyIn,
         BitOut   => BitOut5
      );
   dirtyBit6 : BitArray
      PORT MAP (
         Reset_L  => RESET_L,
         BitWrite => DataWrite6,
         Index    => Index,
         BitIn    => DirtyIn,
         BitOut   => BitOut6
      );
   dirtyBit7 : BitArray
      PORT MAP (
         Reset_L  => RESET_L,
         BitWrite => DataWrite7,
         Index    => Index,
         BitIn    => DirtyIn,
         BitOut   => BitOut7
      );

END struct;
