-- VHDL Entity ece411.Stage_wb.interface
--
-- Created:
--          by - baker30.ews (evrt-252-28.ews.illinois.edu)
--          at - 18:50:43 04/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stage_wb IS
   PORT( 
      CLK             : IN     STD_LOGIC;
      RESET_L         : IN     STD_LOGIC;
      wb_ALU_in       : IN     LC3B_WORD;
      wb_DATAIN_in    : IN     LC3B_WORD;
      wb_IR_in        : IN     LC3B_WORD;
      wb_PC_in        : IN     LC3B_WORD;
      wb_PCadj_in     : IN     LC3B_WORD;
      wb_controls_in  : IN     CONTROL_WORD;
      WB_RegIN        : OUT    LC3B_WORD;
      wb_DR           : OUT    LC3B_REG;
      wb_DRMUXSel_out : OUT    std_logic;
      wb_nzp_out      : OUT    LC3B_CC;
      wb_regWrite     : OUT    std_logic;
      wb_regWrite_Out : OUT    std_logic
   );

-- Declarations

END Stage_wb ;

--
-- VHDL Architecture ece411.Stage_wb.struct
--
-- Created:
--          by - baker30.ews (evrt-252-28.ews.illinois.edu)
--          at - 18:50:44 04/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Stage_wb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ByteMUXSel    : std_logic;
   SIGNAL F             : LC3b_word;
   SIGNAL GenCCout      : LC3b_cc;
   SIGNAL LoadNZP       : std_logic;
   SIGNAL RegDataMuxSel : LC3B_4MUXSEL;
   SIGNAL ZEXTout       : LC3b_word;
   SIGNAL n             : std_logic;
   SIGNAL p             : std_logic;
   SIGNAL z             : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL WB_RegIN_internal : LC3B_WORD;


   -- Component Declarations
   COMPONENT GenCC
   PORT (
      RFMuxout : IN     LC3b_word;
      GenCCout : OUT    LC3b_cc
   );
   END COMPONENT;
   COMPONENT IR2Dr
   PORT (
      wb_IR_in : IN     LC3B_WORD;
      wb_DR    : OUT    LC3B_REG
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      GenCCout : IN     LC3b_cc;
      LoadNZP  : IN     std_logic;
      RESET_L  : IN     std_logic;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT NZP_COMB
   PORT (
      n          : IN     std_logic;
      p          : IN     std_logic;
      z          : IN     std_logic;
      ex_nzp_out : OUT    LC3B_CC
   );
   END COMPONENT;
   COMPONENT WB_CntrlStrip
   PORT (
      wb_controls_in  : IN     CONTROL_WORD;
      ByteMUXSel      : OUT    std_logic;
      LoadNZP         : OUT    std_logic;
      RegDataMuxSel   : OUT    LC3B_4MUXSEL;
      wb_DRMUXSel_out : OUT    std_logic;
      wb_regWrite     : OUT    std_logic;
      wb_regWrite_Out : OUT    std_logic
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
   COMPONENT WordMux4
   PORT (
      A   : IN     lc3b_word ;
      B   : IN     lc3b_word ;
      C   : IN     lc3b_word ;
      D   : IN     lc3b_word ;
      Sel : IN     lc3b_4mux_sel ;
      F   : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ZEXT8
   PORT (
      MDRout  : IN     LC3b_word;
      ZEXTout : OUT    LC3b_word
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : IR2Dr USE ENTITY ece411.IR2Dr;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : NZP_COMB USE ENTITY ece411.NZP_COMB;
   FOR ALL : WB_CntrlStrip USE ENTITY ece411.WB_CntrlStrip;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   FOR ALL : ZEXT8 USE ENTITY ece411.ZEXT8;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_2 : GenCC
      PORT MAP (
         RFMuxout => WB_RegIN_internal,
         GenCCout => GenCCout
      );
   U_0 : IR2Dr
      PORT MAP (
         wb_IR_in => wb_IR_in,
         wb_DR    => wb_DR
      );
   U_4 : NZP
      PORT MAP (
         GenCCout => GenCCout,
         LoadNZP  => LoadNZP,
         RESET_L  => RESET_L,
         n        => n,
         p        => p,
         z        => z
      );
   U_5 : NZP_COMB
      PORT MAP (
         n          => n,
         p          => p,
         z          => z,
         ex_nzp_out => wb_nzp_out
      );
   U_3 : WB_CntrlStrip
      PORT MAP (
         wb_controls_in  => wb_controls_in,
         wb_regWrite     => wb_regWrite,
         ByteMUXSel      => ByteMUXSel,
         wb_regWrite_Out => wb_regWrite_Out,
         RegDataMuxSel   => RegDataMuxSel,
         LoadNZP         => LoadNZP,
         wb_DRMUXSel_out => wb_DRMUXSel_out
      );
   ByteMux : WordMux2
      PORT MAP (
         A   => wb_DATAIN_in,
         B   => ZEXTout,
         Sel => ByteMUXSel,
         F   => F
      );
   RegDataMux : WordMux4
      PORT MAP (
         A   => F,
         B   => wb_ALU_in,
         C   => wb_PCadj_in,
         D   => wb_PC_in,
         Sel => RegDataMuxSel,
         F   => WB_RegIN_internal
      );
   U_1 : ZEXT8
      PORT MAP (
         MDRout  => wb_DATAIN_in,
         ZEXTout => ZEXTout
      );

   -- Implicit buffered output assignments
   WB_RegIN <= WB_RegIN_internal;

END struct;
