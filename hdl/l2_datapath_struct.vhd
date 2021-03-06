-- VHDL Entity ece411.L2_Datapath.interface
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

ENTITY L2_Datapath IS
   PORT( 
      CLK        : IN     std_logic;
      CacheWrite : IN     std_logic;
      Evict_H    : IN     std_logic;
      L1ADDRESS  : IN     LC3B_WORD;
      L1DATAOUT  : IN     LC3B_OWORD;
      MREAD_L    : IN     std_logic;
      MWRITE_L   : IN     std_logic;
      PMDATAIN   : IN     LC3B_OWORD;
      RESET_L    : IN     std_logic;
      DataIn     : OUT    LC3B_OWORD;
      DirtyOut   : OUT    std_logic;
      LRUout     : OUT    LC3B_8MUX_SEL;
      MRESP_H    : OUT    std_logic;
      PMADDRESS  : OUT    LC3B_WORD;
      PMDATAOUT  : OUT    LC3B_OWORD;
      hit        : OUT    std_logic
   );

-- Declarations

END L2_Datapath ;

--
-- VHDL Architecture ece411.L2_Datapath.struct
--
-- Created:
--          by - lachman1.ews (siebl-0220-04.ews.illinois.edu)
--          at - 02:11:21 04/26/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF L2_Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL B1          : std_logic;
   SIGNAL BitOut0     : std_logic;
   SIGNAL BitOut1     : std_logic;
   SIGNAL BitOut2     : std_logic;
   SIGNAL BitOut3     : std_logic;
   SIGNAL BitOut4     : std_logic;
   SIGNAL BitOut5     : std_logic;
   SIGNAL BitOut6     : std_logic;
   SIGNAL BitOut7     : std_logic;
   SIGNAL BuiltADDR   : LC3B_WORD;
   SIGNAL DataArrayIn : LC3B_OWORD;
   SIGNAL DataOut0    : LC3B_OWORD;
   SIGNAL DataOut1    : LC3B_OWORD;
   SIGNAL DataOut2    : LC3B_OWORD;
   SIGNAL DataOut3    : LC3B_OWORD;
   SIGNAL DataOut4    : LC3B_OWORD;
   SIGNAL DataOut5    : LC3B_OWORD;
   SIGNAL DataOut6    : LC3B_OWORD;
   SIGNAL DataOut7    : LC3B_OWORD;
   SIGNAL DataWrite0  : std_logic;
   SIGNAL DataWrite1  : std_logic;
   SIGNAL DataWrite2  : std_logic;
   SIGNAL DataWrite3  : std_logic;
   SIGNAL DataWrite4  : std_logic;
   SIGNAL DataWrite5  : std_logic;
   SIGNAL DataWrite6  : std_logic;
   SIGNAL DataWrite7  : std_logic;
   SIGNAL DirtyIn     : std_logic;
   SIGNAL EncodeHit   : LC3B_8MUX_SEL;
   SIGNAL F12         : std_logic;
   SIGNAL HitBus      : std_logic_vector(7 DOWNTO 0);
   SIGNAL Index       : LC3B_C_INDEX;
   SIGNAL TagC0       : std_logic;
   SIGNAL TagC1       : std_logic;
   SIGNAL TagC2       : std_logic;
   SIGNAL TagC3       : std_logic;
   SIGNAL TagC4       : std_logic;
   SIGNAL TagC5       : std_logic;
   SIGNAL TagC6       : std_logic;
   SIGNAL TagC7       : std_logic;
   SIGNAL TagIn       : LC3B_C_TAG;
   SIGNAL VBitOut0    : std_logic;
   SIGNAL VBitOut1    : std_logic;
   SIGNAL VBitOut2    : std_logic;
   SIGNAL VBitOut3    : std_logic;
   SIGNAL VBitOut4    : std_logic;
   SIGNAL VBitOut5    : std_logic;
   SIGNAL VBitOut6    : std_logic;
   SIGNAL VBitOut7    : std_logic;
   SIGNAL oldTag      : LC3B_C_TAG;

   -- Implicit buffer signal declarations
   SIGNAL LRUout_internal : LC3B_8MUX_SEL;
   SIGNAL hit_internal    : std_logic;


   -- Component Declarations
   COMPONENT ADDRComb
   PORT (
      INDEX     : IN     LC3B_C_INDEX;
      TagOld    : IN     LC3B_C_TAG;
      BuiltADDR : OUT    LC3B_WORD
   );
   END COMPONENT;
   COMPONENT ADDRSplit
   PORT (
      ADDRESS : IN     LC3b_word;
      INDEX   : OUT    LC3B_C_INDEX;
      Offset  : OUT    LC3B_C_OFFSET;
      Offset0 : OUT    std_logic;
      Offset3 : OUT    LC3B_8MUX_SEL;
      Tag     : OUT    LC3B_C_TAG
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      F : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT CheckHit
   PORT (
      TagC0     : IN     std_logic ;
      TagC1     : IN     std_logic ;
      TagC2     : IN     std_logic ;
      TagC3     : IN     std_logic ;
      TagC4     : IN     std_logic ;
      TagC5     : IN     std_logic ;
      TagC6     : IN     std_logic ;
      TagC7     : IN     std_logic ;
      VBitOut0  : IN     std_logic ;
      VBitOut1  : IN     std_logic ;
      VBitOut2  : IN     std_logic ;
      VBitOut3  : IN     std_logic ;
      VBitOut4  : IN     std_logic ;
      VBitOut5  : IN     std_logic ;
      VBitOut6  : IN     std_logic ;
      VBitOut7  : IN     std_logic ;
      EncodeHit : OUT    LC3B_8MUX_SEL ;
      HitBus    : OUT    std_logic_vector (7 DOWNTO 0);
      hit       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT DataWrite
   PORT (
      CacheWrite : IN     std_logic ;
      HitBus     : IN     std_logic_vector (7 DOWNTO 0);
      LRUout     : IN     LC3B_8MUX_SEL ;
      hit        : IN     std_logic ;
      DataWrite0 : OUT    std_logic ;
      DataWrite1 : OUT    std_logic ;
      DataWrite2 : OUT    std_logic ;
      DataWrite3 : OUT    std_logic ;
      DataWrite4 : OUT    std_logic ;
      DataWrite5 : OUT    std_logic ;
      DataWrite6 : OUT    std_logic ;
      DataWrite7 : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Datas
   PORT (
      DataArrayIn : IN     LC3B_OWORD ;
      DataWrite0  : IN     std_logic ;
      DataWrite1  : IN     std_logic ;
      DataWrite2  : IN     std_logic ;
      DataWrite3  : IN     std_logic ;
      DataWrite4  : IN     std_logic ;
      DataWrite5  : IN     std_logic ;
      DataWrite6  : IN     std_logic ;
      DataWrite7  : IN     std_logic ;
      Index       : IN     LC3B_C_INDEX ;
      RESET_L     : IN     std_logic ;
      DataOut0    : OUT    LC3B_OWORD ;
      DataOut1    : OUT    LC3B_OWORD ;
      DataOut2    : OUT    LC3B_OWORD ;
      DataOut3    : OUT    LC3B_OWORD ;
      DataOut4    : OUT    LC3B_OWORD ;
      DataOut5    : OUT    LC3B_OWORD ;
      DataOut6    : OUT    LC3B_OWORD ;
      DataOut7    : OUT    LC3B_OWORD 
   );
   END COMPONENT;
   COMPONENT DirtyBits
   PORT (
      DataWrite0 : IN     std_logic ;
      DataWrite1 : IN     std_logic ;
      DataWrite2 : IN     std_logic ;
      DataWrite3 : IN     std_logic ;
      DataWrite4 : IN     std_logic ;
      DataWrite5 : IN     std_logic ;
      DataWrite6 : IN     std_logic ;
      DataWrite7 : IN     std_logic ;
      DirtyIn    : IN     std_logic ;
      Index      : IN     LC3B_C_INDEX ;
      RESET_L    : IN     std_logic ;
      BitOut0    : OUT    std_logic ;
      BitOut1    : OUT    std_logic ;
      BitOut2    : OUT    std_logic ;
      BitOut3    : OUT    std_logic ;
      BitOut4    : OUT    std_logic ;
      BitOut5    : OUT    std_logic ;
      BitOut6    : OUT    std_logic ;
      BitOut7    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT LRU
   PORT (
      CLK       : IN     std_logic ;
      EncodeHit : IN     LC3B_8MUX_SEL ;
      Index     : IN     LC3B_C_INDEX ;
      MREAD_L   : IN     std_logic ;
      MWRITE_L  : IN     std_logic ;
      RESET_L   : IN     std_logic ;
      hit       : IN     std_logic ;
      LRUout    : OUT    LC3B_8MUX_SEL 
   );
   END COMPONENT;
   COMPONENT MUX8_1
   PORT (
      A   : IN     std_logic ;
      B   : IN     std_logic ;
      C   : IN     std_logic ;
      D   : IN     std_logic ;
      E   : IN     std_logic ;
      F   : IN     std_logic ;
      G   : IN     std_logic ;
      H   : IN     std_logic ;
      Sel : IN     LC3B_8MUX_SEL ;
      O   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NOT2
   PORT (
      A : IN     std_logic;
      F : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      F : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OWordMux2
   PORT (
      A   : IN     LC3b_oword ;
      B   : IN     LC3b_oword ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_oword 
   );
   END COMPONENT;
   COMPONENT OWordMux8
   PORT (
      A      : IN     LC3B_OWORD ;
      B      : IN     LC3B_OWORD ;
      C      : IN     LC3B_OWORD ;
      D      : IN     LC3B_OWORD ;
      E      : IN     LC3B_OWORD ;
      F      : IN     LC3B_OWORD ;
      G      : IN     LC3B_OWORD ;
      H      : IN     LC3B_OWORD ;
      Sel    : IN     LC3B_8MUX_SEL ;
      Output : OUT    LC3B_OWORD 
   );
   END COMPONENT;
   COMPONENT Tags
   PORT (
      DataWrite0 : IN     std_logic ;
      DataWrite1 : IN     std_logic ;
      DataWrite2 : IN     std_logic ;
      DataWrite3 : IN     std_logic ;
      DataWrite4 : IN     std_logic ;
      DataWrite5 : IN     std_logic ;
      DataWrite6 : IN     std_logic ;
      DataWrite7 : IN     std_logic ;
      EncodeHit  : IN     LC3B_8MUX_SEL ;
      Index      : IN     LC3B_C_INDEX ;
      LRUout     : IN     LC3B_8MUX_SEL ;
      RESET_L    : IN     std_logic ;
      TagIn      : IN     LC3B_C_TAG ;
      TagC0      : OUT    std_logic ;
      TagC1      : OUT    std_logic ;
      TagC2      : OUT    std_logic ;
      TagC3      : OUT    std_logic ;
      TagC4      : OUT    std_logic ;
      TagC5      : OUT    std_logic ;
      TagC6      : OUT    std_logic ;
      TagC7      : OUT    std_logic ;
      oldTag     : OUT    LC3B_C_TAG 
   );
   END COMPONENT;
   COMPONENT ValidBits
   PORT (
      DataWrite0 : IN     std_logic ;
      DataWrite1 : IN     std_logic ;
      DataWrite2 : IN     std_logic ;
      DataWrite3 : IN     std_logic ;
      DataWrite4 : IN     std_logic ;
      DataWrite5 : IN     std_logic ;
      DataWrite6 : IN     std_logic ;
      DataWrite7 : IN     std_logic ;
      Index      : IN     LC3B_C_INDEX ;
      RESET_L    : IN     std_logic ;
      VBitOut0   : OUT    std_logic ;
      VBitOut1   : OUT    std_logic ;
      VBitOut2   : OUT    std_logic ;
      VBitOut3   : OUT    std_logic ;
      VBitOut4   : OUT    std_logic ;
      VBitOut5   : OUT    std_logic ;
      VBitOut6   : OUT    std_logic ;
      VBitOut7   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADDRComb USE ENTITY ece411.ADDRComb;
   FOR ALL : ADDRSplit USE ENTITY ece411.ADDRSplit;
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : CheckHit USE ENTITY ece411.CheckHit;
   FOR ALL : DataWrite USE ENTITY ece411.DataWrite;
   FOR ALL : Datas USE ENTITY ece411.Datas;
   FOR ALL : DirtyBits USE ENTITY ece411.DirtyBits;
   FOR ALL : LRU USE ENTITY ece411.LRU;
   FOR ALL : MUX8_1 USE ENTITY ece411.MUX8_1;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : NOT2 USE ENTITY ece411.NOT2;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   FOR ALL : OWordMux8 USE ENTITY ece411.OWordMux8;
   FOR ALL : Tags USE ENTITY ece411.Tags;
   FOR ALL : ValidBits USE ENTITY ece411.ValidBits;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aADDRComb : ADDRComb
      PORT MAP (
         INDEX     => Index,
         TagOld    => oldTag,
         BuiltADDR => BuiltADDR
      );
   L2ADDRSplit : ADDRSplit
      PORT MAP (
         ADDRESS => L1ADDRESS,
         Tag     => TagIn,
         INDEX   => Index,
         Offset  => OPEN,
         Offset3 => OPEN,
         Offset0 => OPEN
      );
   U_25 : AND2
      PORT MAP (
         A => hit_internal,
         B => B1,
         F => MRESP_H
      );
   CHit : CheckHit
      PORT MAP (
         TagC0     => TagC0,
         TagC1     => TagC1,
         TagC2     => TagC2,
         TagC3     => TagC3,
         TagC4     => TagC4,
         TagC5     => TagC5,
         TagC6     => TagC6,
         TagC7     => TagC7,
         VBitOut0  => VBitOut0,
         VBitOut1  => VBitOut1,
         VBitOut2  => VBitOut2,
         VBitOut3  => VBitOut3,
         VBitOut4  => VBitOut4,
         VBitOut5  => VBitOut5,
         VBitOut6  => VBitOut6,
         VBitOut7  => VBitOut7,
         EncodeHit => EncodeHit,
         HitBus    => HitBus,
         hit       => hit_internal
      );
   controlDW : DataWrite
      PORT MAP (
         CacheWrite => CacheWrite,
         HitBus     => HitBus,
         LRUout     => LRUout_internal,
         hit        => hit_internal,
         DataWrite0 => DataWrite0,
         DataWrite1 => DataWrite1,
         DataWrite2 => DataWrite2,
         DataWrite3 => DataWrite3,
         DataWrite4 => DataWrite4,
         DataWrite5 => DataWrite5,
         DataWrite6 => DataWrite6,
         DataWrite7 => DataWrite7
      );
   DataArrays : Datas
      PORT MAP (
         DataArrayIn => DataArrayIn,
         DataWrite0  => DataWrite0,
         DataWrite1  => DataWrite1,
         DataWrite2  => DataWrite2,
         DataWrite3  => DataWrite3,
         DataWrite4  => DataWrite4,
         DataWrite5  => DataWrite5,
         DataWrite6  => DataWrite6,
         DataWrite7  => DataWrite7,
         Index       => Index,
         RESET_L     => RESET_L,
         DataOut0    => DataOut0,
         DataOut1    => DataOut1,
         DataOut2    => DataOut2,
         DataOut3    => DataOut3,
         DataOut4    => DataOut4,
         DataOut5    => DataOut5,
         DataOut6    => DataOut6,
         DataOut7    => DataOut7
      );
   DirtyBitArrays : DirtyBits
      PORT MAP (
         DataWrite0 => DataWrite0,
         DataWrite1 => DataWrite1,
         DataWrite2 => DataWrite2,
         DataWrite3 => DataWrite3,
         DataWrite4 => DataWrite4,
         DataWrite5 => DataWrite5,
         DataWrite6 => DataWrite6,
         DataWrite7 => DataWrite7,
         DirtyIn    => DirtyIn,
         Index      => Index,
         RESET_L    => RESET_L,
         BitOut0    => BitOut0,
         BitOut1    => BitOut1,
         BitOut2    => BitOut2,
         BitOut3    => BitOut3,
         BitOut4    => BitOut4,
         BitOut5    => BitOut5,
         BitOut6    => BitOut6,
         BitOut7    => BitOut7
      );
   LRUn : LRU
      PORT MAP (
         CLK       => CLK,
         EncodeHit => EncodeHit,
         Index     => Index,
         MREAD_L   => MREAD_L,
         MWRITE_L  => MWRITE_L,
         RESET_L   => RESET_L,
         hit       => hit_internal,
         LRUout    => LRUout_internal
      );
   U_1 : MUX8_1
      PORT MAP (
         A   => BitOut0,
         B   => BitOut1,
         C   => BitOut2,
         D   => BitOut3,
         E   => BitOut4,
         F   => BitOut5,
         G   => BitOut6,
         H   => BitOut7,
         Sel => LRUout_internal,
         O   => DirtyOut
      );
   U_27 : NOT2
      PORT MAP (
         A => MREAD_L,
         F => F12
      );
   U_20 : OR2
      PORT MAP (
         A => F12,
         B => CacheWrite,
         F => B1
      );
   DATAINMux : OWordMux2
      PORT MAP (
         A   => L1DATAOUT,
         B   => PMDATAIN,
         Sel => MWRITE_L,
         F   => DataArrayIn
      );
   DATAOUTMux : OWordMux8
      PORT MAP (
         A      => DataOut0,
         B      => DataOut1,
         C      => DataOut2,
         D      => DataOut3,
         E      => DataOut4,
         F      => DataOut5,
         G      => DataOut6,
         H      => DataOut7,
         Sel    => EncodeHit,
         Output => DataIn
      );
   PMDATAOUTMux : OWordMux8
      PORT MAP (
         A      => DataOut0,
         B      => DataOut1,
         C      => DataOut2,
         D      => DataOut3,
         E      => DataOut4,
         F      => DataOut5,
         G      => DataOut6,
         H      => DataOut7,
         Sel    => LRUout_internal,
         Output => PMDATAOUT
      );
   TagArrays : Tags
      PORT MAP (
         DataWrite0 => DataWrite0,
         DataWrite1 => DataWrite1,
         DataWrite2 => DataWrite2,
         DataWrite3 => DataWrite3,
         DataWrite4 => DataWrite4,
         DataWrite5 => DataWrite5,
         DataWrite6 => DataWrite6,
         DataWrite7 => DataWrite7,
         EncodeHit  => EncodeHit,
         Index      => Index,
         LRUout     => LRUout_internal,
         RESET_L    => RESET_L,
         TagIn      => TagIn,
         TagC0      => TagC0,
         TagC1      => TagC1,
         TagC2      => TagC2,
         TagC3      => TagC3,
         TagC4      => TagC4,
         TagC5      => TagC5,
         TagC6      => TagC6,
         TagC7      => TagC7,
         oldTag     => oldTag
      );
   ValidBitArrays : ValidBits
      PORT MAP (
         DataWrite0 => DataWrite0,
         DataWrite1 => DataWrite1,
         DataWrite2 => DataWrite2,
         DataWrite3 => DataWrite3,
         DataWrite4 => DataWrite4,
         DataWrite5 => DataWrite5,
         DataWrite6 => DataWrite6,
         DataWrite7 => DataWrite7,
         Index      => Index,
         RESET_L    => RESET_L,
         VBitOut0   => VBitOut0,
         VBitOut1   => VBitOut1,
         VBitOut2   => VBitOut2,
         VBitOut3   => VBitOut3,
         VBitOut4   => VBitOut4,
         VBitOut5   => VBitOut5,
         VBitOut6   => VBitOut6,
         VBitOut7   => VBitOut7
      );
   U_0 : WordMux2
      PORT MAP (
         A   => L1ADDRESS,
         B   => BuiltADDR,
         Sel => Evict_H,
         F   => PMADDRESS
      );
   notMWRITE : NOT1
      PORT MAP (
         A => MWRITE_L,
         F => DirtyIn
      );

   -- Implicit buffered output assignments
   LRUout <= LRUout_internal;
   hit    <= hit_internal;

END struct;
