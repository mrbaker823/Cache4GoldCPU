-- VHDL Entity ece411.DAInput.interface
--
-- Created:
--          by - baker30.ews (evrt-252-27.ews.illinois.edu)
--          at - 17:49:09 03/03/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY DAInput IS
   PORT( 
      DATAOUT        : IN     LC3b_word;
      MWRITEH_L      : IN     std_logic;
      Offset         : IN     LC3B_C_OFFSET;
      mDATAOUTBIG    : IN     LC3b_oword;
      NewDataArrayIn : OUT    LC3B_OWORD
   );

-- Declarations

END DAInput ;

--
-- VHDL Architecture ece411.DAInput.struct
--
-- Created:
--          by - baker30.ews (evrt-252-27.ews.illinois.edu)
--          at - 17:49:09 03/03/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF DAInput IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Dec0     : std_logic;
   SIGNAL Dec1     : std_logic;
   SIGNAL Dec2     : std_logic;
   SIGNAL Dec3     : std_logic;
   SIGNAL Dec4     : std_logic;
   SIGNAL Dec5     : std_logic;
   SIGNAL Dec6     : std_logic;
   SIGNAL Dec7     : std_logic;
   SIGNAL NewByteH : LC3B_Byte;
   SIGNAL NewByteL : LC3B_BYTE;
   SIGNAL Offset0  : std_logic;
   SIGNAL OutWord0 : LC3B_WORD;
   SIGNAL OutWord1 : LC3B_WORD;
   SIGNAL OutWord2 : LC3B_WORD;
   SIGNAL OutWord3 : LC3B_WORD;
   SIGNAL OutWord4 : LC3B_WORD;
   SIGNAL OutWord5 : LC3B_WORD;
   SIGNAL OutWord6 : LC3B_WORD;
   SIGNAL OutWord7 : LC3B_WORD;
   SIGNAL byte0    : LC3B_BYTE;
   SIGNAL byte1    : LC3B_BYTE;
   SIGNAL byte2    : LC3B_BYTE;
   SIGNAL byte3    : LC3B_BYTE;
   SIGNAL byte4    : LC3B_BYTE;
   SIGNAL byte5    : LC3B_BYTE;
   SIGNAL byte6    : LC3B_BYTE;
   SIGNAL byte7    : LC3B_BYTE;
   SIGNAL byte8    : LC3B_BYTE;
   SIGNAL byte9    : LC3B_BYTE;
   SIGNAL byteA    : LC3B_BYTE;
   SIGNAL byteB    : LC3B_BYTE;
   SIGNAL byteC    : LC3B_BYTE;
   SIGNAL byteD    : LC3B_BYTE;
   SIGNAL byteE    : LC3B_BYTE;
   SIGNAL byteF    : LC3B_BYTE;


   -- Component Declarations
   COMPONENT DecodeOWORD
   PORT (
      Offset  : IN     LC3B_C_OFFSET ;
      Dec0    : OUT    std_logic ;
      Dec1    : OUT    std_logic ;
      Dec2    : OUT    std_logic ;
      Dec3    : OUT    std_logic ;
      Dec4    : OUT    std_logic ;
      Dec5    : OUT    std_logic ;
      Dec6    : OUT    std_logic ;
      Dec7    : OUT    std_logic ;
      Offset0 : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OWORD2Bytes
   PORT (
      OWORDIN : IN     LC3B_OWORD;
      byte0   : OUT    LC3B_BYTE;
      byte1   : OUT    LC3B_BYTE;
      byte2   : OUT    LC3B_BYTE;
      byte3   : OUT    LC3B_BYTE;
      byte4   : OUT    LC3B_BYTE;
      byte5   : OUT    LC3B_BYTE;
      byte6   : OUT    LC3B_BYTE;
      byte7   : OUT    LC3B_BYTE;
      byte8   : OUT    LC3B_BYTE;
      byte9   : OUT    LC3B_BYTE;
      byteA   : OUT    LC3B_BYTE;
      byteB   : OUT    LC3B_BYTE;
      byteC   : OUT    LC3B_BYTE;
      byteD   : OUT    LC3B_BYTE;
      byteE   : OUT    LC3B_BYTE;
      byteF   : OUT    LC3B_BYTE
   );
   END COMPONENT;
   COMPONENT W2B_logic
   PORT (
      Offset0  : IN     std_logic ;
      NewByteH : OUT    LC3B_Byte ;
      NewByteL : OUT    LC3B_BYTE ;
      DATAOUT  : IN     LC3b_word 
   );
   END COMPONENT;
   COMPONENT Word2OWord
   PORT (
      OutWord0       : IN     LC3B_WORD ;
      OutWord1       : IN     LC3B_WORD ;
      OutWord2       : IN     LC3B_WORD ;
      OutWord3       : IN     LC3B_WORD ;
      OutWord4       : IN     LC3B_WORD ;
      OutWord5       : IN     LC3B_WORD ;
      OutWord6       : IN     LC3B_WORD ;
      OutWord7       : IN     LC3B_WORD ;
      NewDataArrayIn : OUT    LC3B_OWORD 
   );
   END COMPONENT;
   COMPONENT WordDataSel
   PORT (
      Dec       : IN     std_logic ;
      MWriteH_L : IN     std_logic ;
      NewByteH  : IN     LC3B_BYTE ;
      NewByteL  : IN     LC3B_BYTE ;
      Offset0   : IN     std_logic ;
      OldByteH  : IN     LC3B_BYTE ;
      OldByteL  : IN     LC3B_BYTE ;
      OutWord   : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DecodeOWORD USE ENTITY ece411.DecodeOWORD;
   FOR ALL : OWORD2Bytes USE ENTITY ece411.OWORD2Bytes;
   FOR ALL : W2B_logic USE ENTITY ece411.W2B_logic;
   FOR ALL : Word2OWord USE ENTITY ece411.Word2OWord;
   FOR ALL : WordDataSel USE ENTITY ece411.WordDataSel;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Decode_L : DecodeOWORD
      PORT MAP (
         Offset  => Offset,
         Dec0    => Dec0,
         Dec1    => Dec1,
         Dec2    => Dec2,
         Dec3    => Dec3,
         Dec4    => Dec4,
         Dec5    => Dec5,
         Dec6    => Dec6,
         Dec7    => Dec7,
         Offset0 => Offset0
      );
   OldDataSplit : OWORD2Bytes
      PORT MAP (
         OWORDIN => mDATAOUTBIG,
         byte0   => byte0,
         byte1   => byte1,
         byte2   => byte2,
         byte3   => byte3,
         byte4   => byte4,
         byte5   => byte5,
         byte6   => byte6,
         byte7   => byte7,
         byte8   => byte8,
         byte9   => byte9,
         byteA   => byteA,
         byteB   => byteB,
         byteC   => byteC,
         byteD   => byteD,
         byteE   => byteE,
         byteF   => byteF
      );
   aW2Bl : W2B_logic
      PORT MAP (
         Offset0  => Offset0,
         NewByteH => NewByteH,
         NewByteL => NewByteL,
         DATAOUT  => DATAOUT
      );
   aW2OW : Word2OWord
      PORT MAP (
         OutWord0       => OutWord0,
         OutWord1       => OutWord1,
         OutWord2       => OutWord2,
         OutWord3       => OutWord3,
         OutWord4       => OutWord4,
         OutWord5       => OutWord5,
         OutWord6       => OutWord6,
         OutWord7       => OutWord7,
         NewDataArrayIn => NewDataArrayIn
      );
   WDS_0 : WordDataSel
      PORT MAP (
         Dec       => Dec0,
         MWriteH_L => MWRITEH_L,
         NewByteH  => NewByteH,
         NewByteL  => NewByteL,
         Offset0   => Offset0,
         OldByteH  => byte1,
         OldByteL  => byte0,
         OutWord   => OutWord0
      );
   WDS_1 : WordDataSel
      PORT MAP (
         Dec       => Dec1,
         MWriteH_L => MWRITEH_L,
         NewByteH  => NewByteH,
         NewByteL  => NewByteL,
         Offset0   => Offset0,
         OldByteH  => byte3,
         OldByteL  => byte2,
         OutWord   => OutWord1
      );
   WDS_2 : WordDataSel
      PORT MAP (
         Dec       => Dec2,
         MWriteH_L => MWRITEH_L,
         NewByteH  => NewByteH,
         NewByteL  => NewByteL,
         Offset0   => Offset0,
         OldByteH  => byte5,
         OldByteL  => byte4,
         OutWord   => OutWord2
      );
   WDS_3 : WordDataSel
      PORT MAP (
         Dec       => Dec3,
         MWriteH_L => MWRITEH_L,
         NewByteH  => NewByteH,
         NewByteL  => NewByteL,
         Offset0   => Offset0,
         OldByteH  => byte7,
         OldByteL  => byte6,
         OutWord   => OutWord3
      );
   WDS_4 : WordDataSel
      PORT MAP (
         Dec       => Dec4,
         MWriteH_L => MWRITEH_L,
         NewByteH  => NewByteH,
         NewByteL  => NewByteL,
         Offset0   => Offset0,
         OldByteH  => byte9,
         OldByteL  => byte8,
         OutWord   => OutWord4
      );
   WDS_5 : WordDataSel
      PORT MAP (
         Dec       => Dec5,
         MWriteH_L => MWRITEH_L,
         NewByteH  => NewByteH,
         NewByteL  => NewByteL,
         Offset0   => Offset0,
         OldByteH  => byteB,
         OldByteL  => byteA,
         OutWord   => OutWord5
      );
   WDS_6 : WordDataSel
      PORT MAP (
         Dec       => Dec6,
         MWriteH_L => MWRITEH_L,
         NewByteH  => NewByteH,
         NewByteL  => NewByteL,
         Offset0   => Offset0,
         OldByteH  => byteD,
         OldByteL  => byteC,
         OutWord   => OutWord6
      );
   WDS_7 : WordDataSel
      PORT MAP (
         Dec       => Dec7,
         MWriteH_L => MWRITEH_L,
         NewByteH  => NewByteH,
         NewByteL  => NewByteL,
         Offset0   => Offset0,
         OldByteH  => byteF,
         OldByteL  => byteE,
         OutWord   => OutWord7
      );

END struct;
