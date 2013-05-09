-- VHDL Entity ece411.Stage_ex.interface
--
-- Created:
--          by - baker30.ews (evrt-252-28.ews.illinois.edu)
--          at - 18:52:22 04/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stage_ex IS
   PORT( 
      EX_PCadj_in      : IN     LC3B_WORD;
      Mem_ALU_In       : IN     LC3B_WORD;
      RESET_L          : IN     STD_LOGIC;
      WB_RegIN         : IN     LC3B_WORD;
      clk              : IN     STD_LOGIC;
      ex_ADJ6_in       : IN     LC3B_WORD;
      ex_REGB_IN       : IN     LC3B_WORD;
      ex_REGaNum_in    : IN     LC3B_REG;
      ex_REGa_in       : IN     LC3B_WORD;
      ex_REGbNum_in    : IN     LC3B_REG;
      ex_SEXT5_in      : IN     LC3B_WORD;
      ex_SEXT6_in      : IN     LC3B_WORD;
      ex_controls_in   : IN     CONTROL_WORD;
      mem_DR_in        : IN     LC3B_REG;
      mem_RegWrite_out : IN     STD_LOGIC;
      wb_DR            : IN     LC3B_REG;
      wb_regWrite_Out  : IN     std_logic;
      ex_ALUX_ready    : OUT    STD_LOGIC;
      ex_ALU_out       : OUT    LC3B_WORD;
      ex_JMPaddr_out   : OUT    LC3b_word;
      ex_MemRead_out   : OUT    std_logic;
      ex_nzp_out       : OUT    LC3B_CC;
      ex_regb_out      : OUT    LC3b_word
   );

-- Declarations

END Stage_ex ;

--
-- VHDL Architecture ece411.Stage_ex.struct
--
-- Created:
--          by - baker30.ews (evrt-252-28.ews.illinois.edu)
--          at - 18:52:23 04/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Stage_ex IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALUMUXSel      : LC3B_4MUXSEL;
   SIGNAL ALUMUxOUT      : lc3b_word;
   SIGNAL ALUnOP         : LC3B_ALUOP;
   SIGNAL ALUnOut        : LC3b_WORD;
   SIGNAL ALUop          : LC3B_ALUOP;
   SIGNAL ALUout         : LC3b_word;
   SIGNAL ALUsOUT        : LC3B_WORD;
   SIGNAL ALUxOut        : LC3b_WORD;
   SIGNAL CheckN         : std_logic;
   SIGNAL CheckP         : std_logic;
   SIGNAL CheckZ         : std_logic;
   SIGNAL DIVOUT         : LC3B_WORD;
   SIGNAL DivDone        : STD_LOGIC;
   SIGNAL F              : LC3b_word;
   SIGNAL F1             : STD_LOGIC;
   SIGNAL F2             : lc3b_word;
   SIGNAL FORWARDAMUXSel : LC3B_4MUX_SEL;
   SIGNAL ForwardBMuxSel : LC3B_4MUX_SEL;
   SIGNAL GenCCMuxSel    : std_logic;
   SIGNAL GenCCout       : LC3b_cc;
   SIGNAL LoadNZP        : std_logic;
   SIGNAL MultDone       : STD_LOGIC;
   SIGNAL MultOut        : LC3B_WORD;
   SIGNAL Opcode         : OPNAME;
   SIGNAL RegAForward    : lc3b_word;
   SIGNAL RegBForward    : lc3b_word;
   SIGNAL Sel            : std_logic;
   SIGNAL aluxop         : LC3B_ALUOP;
   SIGNAL n              : std_logic;
   SIGNAL p              : std_logic;
   SIGNAL z              : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL ex_ALU_out_internal : LC3B_WORD;


   -- Component Declarations
   COMPONENT ALU
   PORT (
      ALUMuxout : IN     LC3b_word;
      ALUop     : IN     LC3b_aluop;
      RFAout    : IN     LC3b_word;
      ALUout    : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT ALUN
   PORT (
      A       : IN     LC3b_WORD;
      ALUop   : IN     LC3B_ALUOP;
      B       : IN     LC3b_WORD;
      ALUnOut : OUT    LC3b_WORD
   );
   END COMPONENT;
   COMPONENT ALUx
   PORT (
      A       : IN     LC3b_WORD ;
      ALUop   : IN     LC3B_ALUOP ;
      B       : IN     LC3b_WORD ;
      ALUxOut : OUT    LC3b_WORD 
   );
   END COMPONENT;
   COMPONENT DivU
   PORT (
      clk     : IN     std_logic ;
      A       : IN     LC3B_WORD ;
      ALUOP   : IN     LC3B_ALUOP ;
      B       : IN     LC3B_WORD ;
      DivDone : OUT    STD_LOGIC ;
      DIVOUT  : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT EX_StripControls
   PORT (
      ex_controls_in : IN     CONTROL_WORD;
      ALUMUXSel      : OUT    LC3B_4MUXSEL;
      ALUnOP         : OUT    LC3B_ALUOP;
      ALUxOP         : OUT    LC3B_ALUOP;
      GenCCMuxSel    : OUT    std_logic;
      LoadNZP        : OUT    std_logic;
      Opcode         : OUT    OPNAME;
      aluop          : OUT    LC3B_ALUOP;
      ex_MemRead_out : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT Forwarding_Unit
   PORT (
      clk              : IN     STD_LOGIC ;
      ex_REGaNum_in    : IN     LC3B_REG ;
      ex_REGbNum_in    : IN     LC3B_REG ;
      mem_DR_in        : IN     LC3B_REG ;
      mem_RegWrite_out : IN     STD_LOGIC ;
      wb_DR            : IN     LC3B_REG ;
      wb_regWrite_Out  : IN     std_logic ;
      FORWARDAMUXSel   : OUT    LC3B_4MUX_SEL ;
      ForwardBMuxSel   : OUT    LC3B_4MUX_SEL 
   );
   END COMPONENT;
   COMPONENT GenCC
   PORT (
      RFMuxout : IN     LC3b_word;
      GenCCout : OUT    LC3b_cc
   );
   END COMPONENT;
   COMPONENT JMPCheck
   PORT (
      Opcode : IN     OPNAME ;
      clk    : IN     STD_LOGIC ;
      Sel    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT MultU
   PORT (
      clk      : IN     std_logic ;
      A        : IN     LC3B_WORD ;
      ALUop    : IN     LC3B_ALUOP ;
      B        : IN     LC3B_WORD ;
      MultOut  : OUT    LC3B_WORD ;
      MultDone : OUT    STD_LOGIC 
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
   COMPONENT NZPSplit
   PORT (
      clk    : IN     std_logic;
      dest   : IN     LC3b_reg;
      CheckN : OUT    std_logic;
      CheckP : OUT    std_logic;
      CheckZ : OUT    std_logic
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
   COMPONENT WordMux8
   PORT (
      A    : IN     lc3b_word;
      B    : IN     lc3b_word;
      C    : IN     lc3b_word;
      D    : IN     lc3b_word;
      E    : IN     lc3b_word;
      F    : IN     lc3b_word;
      G    : IN     lc3b_word;
      H    : IN     lc3b_word;
      Sel  : IN     lc3b_8mux_sel;
      mOut : OUT    lc3b_word
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
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
   COMPONENT MUX2_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ALU USE ENTITY ece411.ALU;
   FOR ALL : ALUN USE ENTITY ece411.ALUN;
   FOR ALL : ALUx USE ENTITY ece411.ALUx;
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : DivU USE ENTITY ece411.DivU;
   FOR ALL : EX_StripControls USE ENTITY ece411.EX_StripControls;
   FOR ALL : Forwarding_Unit USE ENTITY ece411.Forwarding_Unit;
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : JMPCheck USE ENTITY ece411.JMPCheck;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : MultU USE ENTITY ece411.MultU;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : NZPSplit USE ENTITY ece411.NZPSplit;
   FOR ALL : NZP_COMB USE ENTITY ece411.NZP_COMB;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   FOR ALL : WordMux8 USE ENTITY ece411.WordMux8;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   ex_regB_out <= RegBForward;                                      


   -- Instance port mappings.
   aALU : ALU
      PORT MAP (
         ALUMuxout => ALUMUxOUT,
         ALUop     => ALUop,
         RFAout    => F,
         ALUout    => ALUout
      );
   U_6 : ALUN
      PORT MAP (
         A       => RegAForward,
         ALUop   => ALUnOP,
         B       => RegBForward,
         ALUnOut => ALUnOut
      );
   U_0 : ALUx
      PORT MAP (
         A       => RegAForward,
         ALUop   => aluxop,
         B       => RegBForward,
         ALUxOut => ALUxOut
      );
   U_2 : DivU
      PORT MAP (
         clk     => clk,
         A       => RegAForward,
         ALUOP   => aluxop,
         B       => RegBForward,
         DivDone => DivDone,
         DIVOUT  => DIVOUT
      );
   EX_StripCntrl : EX_StripControls
      PORT MAP (
         ex_controls_in => ex_controls_in,
         aluop          => ALUop,
         ALUMUXSel      => ALUMUXSel,
         LoadNZP        => LoadNZP,
         GenCCMuxSel    => GenCCMuxSel,
         Opcode         => Opcode,
         ALUxOP         => aluxop,
         ALUnOP         => ALUnOP,
         ex_MemRead_out => ex_MemRead_out
      );
   ForwardUnit : Forwarding_Unit
      PORT MAP (
         clk              => clk,
         ex_REGaNum_in    => ex_REGaNum_in,
         ex_REGbNum_in    => ex_REGbNum_in,
         mem_DR_in        => mem_DR_in,
         mem_RegWrite_out => mem_RegWrite_out,
         wb_DR            => wb_DR,
         wb_regWrite_Out  => wb_regWrite_Out,
         FORWARDAMUXSel   => FORWARDAMUXSel,
         ForwardBMuxSel   => ForwardBMuxSel
      );
   aGenCC : GenCC
      PORT MAP (
         RFMuxout => ex_ALU_out_internal,
         GenCCout => GenCCout
      );
   U_10 : JMPCheck
      PORT MAP (
         Opcode => Opcode,
         clk    => clk,
         Sel    => Sel
      );
   U_1 : MultU
      PORT MAP (
         clk      => clk,
         A        => RegAForward,
         ALUop    => aluxop,
         B        => RegBForward,
         MultOut  => MultOut,
         MultDone => MultDone
      );
   U_3 : NZP
      PORT MAP (
         GenCCout => GenCCout,
         LoadNZP  => LoadNZP,
         RESET_L  => RESET_L,
         n        => n,
         p        => p,
         z        => z
      );
   U_9 : NZPSplit
      PORT MAP (
         clk    => clk,
         dest   => ALUnOP,
         CheckN => CheckN,
         CheckP => CheckP,
         CheckZ => CheckZ
      );
   nzp_combine : NZP_COMB
      PORT MAP (
         n          => n,
         p          => p,
         z          => z,
         ex_nzp_out => ex_nzp_out
      );
   GenCCMux : WordMux2
      PORT MAP (
         A   => RegAForward,
         B   => EX_PCadj_in,
         Sel => GenCCMuxSel,
         F   => F
      );
   GenCCMux1 : WordMux2
      PORT MAP (
         A   => EX_PCadj_in,
         B   => F2,
         Sel => Sel,
         F   => ex_JMPaddr_out
      );
   ALUMUX : WordMux4
      PORT MAP (
         A   => RegBForward,
         B   => ex_ADJ6_in,
         C   => ex_SEXT5_in,
         D   => ex_SEXT6_in,
         Sel => ALUMUXSel,
         F   => ALUMUxOUT
      );
   ForwardAMux : WordMux4
      PORT MAP (
         A   => ex_REGa_in,
         B   => WB_RegIN,
         C   => Mem_ALU_In,
         D   => Mem_ALU_In,
         Sel => FORWARDAMUXSel,
         F   => RegAForward
      );
   ForwardAMux1 : WordMux4
      PORT MAP (
         A   => EX_PCadj_in,
         B   => WB_RegIN,
         C   => Mem_ALU_In,
         D   => Mem_ALU_In,
         Sel => FORWARDAMUXSel,
         F   => F2
      );
   ForwardBMux : WordMux4
      PORT MAP (
         A   => ex_REGB_IN,
         B   => WB_RegIN,
         C   => Mem_ALU_In,
         D   => Mem_ALU_In,
         Sel => ForwardBMuxSel,
         F   => RegBForward
      );
   U_4 : WordMux8
      PORT MAP (
         A    => ALUxOut,
         B    => ALUxOut,
         C    => ALUxOut,
         D    => MultOut,
         E    => DIVOUT,
         F    => ALUxOut,
         G    => ALUxOut,
         H    => ALUsOUT,
         Sel  => aluxop,
         mOut => ex_ALU_out_internal
      );
   U_5 : AND2
      PORT MAP (
         A => DivDone,
         B => MultDone,
         F => ex_ALUX_ready
      );
   U_8 : AND3
      PORT MAP (
         A => CheckZ,
         B => CheckP,
         C => CheckN,
         F => F1
      );
   U_7 : MUX2_16
      PORT MAP (
         A   => ALUnOut,
         B   => ALUout,
         SEL => F1,
         F   => ALUsOUT
      );

   -- Implicit buffered output assignments
   ex_ALU_out <= ex_ALU_out_internal;

END struct;
