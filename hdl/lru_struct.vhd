-- VHDL Entity ece411.LRU.interface
--
-- Created:
--          by - baker30.ews (evrt-252-28.ews.illinois.edu)
--          at - 18:50:45 04/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRU IS
   PORT( 
      CLK       : IN     std_logic;
      EncodeHit : IN     LC3B_8MUX_SEL;
      Index     : IN     LC3B_C_INDEX;
      MREAD_L   : IN     std_logic;
      MWRITE_L  : IN     std_logic;
      RESET_L   : IN     std_logic;
      hit       : IN     std_logic;
      LRUout    : OUT    LC3B_8MUX_SEL
   );

-- Declarations

END LRU ;

--
-- VHDL Architecture ece411.LRU.struct
--
-- Created:
--          by - baker30.ews (evrt-252-28.ews.illinois.edu)
--          at - 18:50:45 04/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF LRU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F1      : LC3B_BYTE;
   SIGNAL LRUW_H0 : std_logic;
   SIGNAL LRUW_H1 : std_logic;
   SIGNAL LRUW_H2 : std_logic;
   SIGNAL LRUW_H3 : std_logic;
   SIGNAL LRUW_H4 : std_logic;
   SIGNAL LRUW_H5 : std_logic;
   SIGNAL LRUW_H6 : std_logic;
   SIGNAL LRUW_H7 : std_logic;
   SIGNAL LRUsel0 : LC3B_8MUX_SEL;
   SIGNAL LRUsel1 : LC3B_8MUX_SEL;
   SIGNAL LRUsel2 : LC3B_8MUX_SEL;
   SIGNAL LRUsel3 : LC3B_8MUX_SEL;
   SIGNAL LRUsel4 : LC3B_8MUX_SEL;
   SIGNAL LRUsel5 : LC3B_8MUX_SEL;
   SIGNAL LRUsel6 : LC3B_8MUX_SEL;
   SIGNAL LRUsel7 : LC3B_8MUX_SEL;
   SIGNAL RorW    : STD_LOGIC;
   SIGNAL sig0    : std_logic;
   SIGNAL sig1    : std_logic;
   SIGNAL sig2    : std_logic;
   SIGNAL sig3    : std_logic;
   SIGNAL sig4    : std_logic;
   SIGNAL sig5    : std_logic;
   SIGNAL sig6    : std_logic;
   SIGNAL sig7    : std_logic;


   -- Component Declarations
   COMPONENT ByteBusIn
   PORT (
      ByteIn : IN     LC3B_BYTE;
      sig0   : OUT    std_logic;
      sig1   : OUT    std_logic;
      sig2   : OUT    std_logic;
      sig3   : OUT    std_logic;
      sig4   : OUT    std_logic;
      sig5   : OUT    std_logic;
      sig6   : OUT    std_logic;
      sig7   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT LRUperIndex
   PORT (
      CLK     : IN     std_logic ;
      HitSel  : IN     LC3B_8MUX_SEL ;
      LRUW_H  : IN     std_logic ;
      RESET_L : IN     STD_LOGIC ;
      LRUsel  : OUT    LC3B_8MUX_SEL 
   );
   END COMPONENT;
   COMPONENT MUX8_3
   PORT (
      A    : IN     LC3b_8MUX_SEL ;
      B    : IN     LC3b_8MUX_SEL ;
      C    : IN     LC3b_8MUX_SEL ;
      D    : IN     LC3b_8MUX_SEL ;
      E    : IN     LC3b_8MUX_SEL ;
      F    : IN     LC3b_8MUX_SEL ;
      G    : IN     LC3b_8MUX_SEL ;
      H    : IN     LC3b_8MUX_SEL ;
      Sel  : IN     LC3b_C_INDEX ;
      mOUT : OUT    LC3b_8MUX_SEL 
   );
   END COMPONENT;
   COMPONENT AND3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT DECODE3_8
   PORT (
      A : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      F : OUT    LC3B_BYTE 
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : ByteBusIn USE ENTITY ece411.ByteBusIn;
   FOR ALL : DECODE3_8 USE ENTITY mp3lib.DECODE3_8;
   FOR ALL : LRUperIndex USE ENTITY ece411.LRUperIndex;
   FOR ALL : MUX8_3 USE ENTITY ece411.MUX8_3;
   FOR ALL : NAND2 USE ENTITY mp3lib.NAND2;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_11 : ByteBusIn
      PORT MAP (
         ByteIn => F1,
         sig0   => sig0,
         sig1   => sig1,
         sig2   => sig2,
         sig3   => sig3,
         sig4   => sig4,
         sig5   => sig5,
         sig6   => sig6,
         sig7   => sig7
      );
   LRU0 : LRUperIndex
      PORT MAP (
         CLK     => CLK,
         HitSel  => EncodeHit,
         LRUW_H  => LRUW_H0,
         RESET_L => RESET_L,
         LRUsel  => LRUsel0
      );
   LRU1 : LRUperIndex
      PORT MAP (
         CLK     => CLK,
         HitSel  => EncodeHit,
         LRUW_H  => LRUW_H1,
         RESET_L => RESET_L,
         LRUsel  => LRUsel1
      );
   LRU2 : LRUperIndex
      PORT MAP (
         CLK     => CLK,
         HitSel  => EncodeHit,
         LRUW_H  => LRUW_H2,
         RESET_L => RESET_L,
         LRUsel  => LRUsel2
      );
   LRU3 : LRUperIndex
      PORT MAP (
         CLK     => CLK,
         HitSel  => EncodeHit,
         LRUW_H  => LRUW_H3,
         RESET_L => RESET_L,
         LRUsel  => LRUsel3
      );
   LRU4 : LRUperIndex
      PORT MAP (
         CLK     => CLK,
         HitSel  => EncodeHit,
         LRUW_H  => LRUW_H4,
         RESET_L => RESET_L,
         LRUsel  => LRUsel4
      );
   LRU5 : LRUperIndex
      PORT MAP (
         CLK     => CLK,
         HitSel  => EncodeHit,
         LRUW_H  => LRUW_H5,
         RESET_L => RESET_L,
         LRUsel  => LRUsel5
      );
   LRU6 : LRUperIndex
      PORT MAP (
         CLK     => CLK,
         HitSel  => EncodeHit,
         LRUW_H  => LRUW_H6,
         RESET_L => RESET_L,
         LRUsel  => LRUsel6
      );
   LRU7 : LRUperIndex
      PORT MAP (
         CLK     => CLK,
         HitSel  => EncodeHit,
         LRUW_H  => LRUW_H7,
         RESET_L => RESET_L,
         LRUsel  => LRUsel7
      );
   U_19 : MUX8_3
      PORT MAP (
         A    => LRUsel0,
         B    => LRUsel1,
         C    => LRUsel2,
         D    => LRUsel3,
         E    => LRUsel4,
         F    => LRUsel5,
         G    => LRUsel6,
         H    => LRUsel7,
         Sel  => Index,
         mOUT => LRUout
      );
   U_9 : AND3
      PORT MAP (
         A => RorW,
         B => hit,
         C => sig0,
         F => LRUW_H0
      );
   U_12 : AND3
      PORT MAP (
         A => RorW,
         B => hit,
         C => sig1,
         F => LRUW_H1
      );
   U_13 : AND3
      PORT MAP (
         A => RorW,
         B => hit,
         C => sig2,
         F => LRUW_H2
      );
   U_14 : AND3
      PORT MAP (
         A => RorW,
         B => hit,
         C => sig3,
         F => LRUW_H3
      );
   U_15 : AND3
      PORT MAP (
         A => RorW,
         B => hit,
         C => sig4,
         F => LRUW_H4
      );
   U_16 : AND3
      PORT MAP (
         A => RorW,
         B => hit,
         C => sig5,
         F => LRUW_H5
      );
   U_17 : AND3
      PORT MAP (
         A => RorW,
         B => hit,
         C => sig6,
         F => LRUW_H6
      );
   U_18 : AND3
      PORT MAP (
         A => RorW,
         B => hit,
         C => sig7,
         F => LRUW_H7
      );
   U_10 : DECODE3_8
      PORT MAP (
         A => Index,
         F => F1
      );
   U_8 : NAND2
      PORT MAP (
         A => MREAD_L,
         B => MWRITE_L,
         F => RorW
      );

END struct;
