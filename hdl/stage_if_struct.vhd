-- VHDL Entity ece411.Stage_if.interface
--
-- Created:
--          by - baker30.ews (evrt-252-23.ews.illinois.edu)
--          at - 15:00:24 04/30/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stage_if IS
   PORT( 
      CLK              : IN     STD_LOGIC;
      I_DATAIN         : IN     LC3B_WORD;
      I_MRESP_H        : IN     STD_LOGIC;
      LOAD_IF          : IN     std_logic;
      RESET_L          : IN     STD_LOGIC;
      mem_BHT_in       : IN     LC3b_BR_BHT;
      mem_BTBWrite_out : IN     std_logic;
      mem_DR_in        : IN     LC3B_REG;
      mem_JMPaddr_in   : IN     LC3b_WORD;
      mem_PC_in        : IN     LC3B_WORD;
      mem_PCadj_in     : IN     LC3B_WORD;
      mem_ZEXT8_in     : IN     LC3B_WORD;
      mem_controls_in  : IN     CONTROL_WORD;
      wb_nzp_out       : IN     LC3B_CC;
      IF_BHT_Out       : OUT    LC3b_BR_BHT;
      I_ADDRESS        : OUT    LC3B_WORD;
      I_MREAD_L        : OUT    STD_LOGIC;
      flush            : OUT    STD_LOGIC;
      if_IR_out        : OUT    LC3B_WORD;
      if_PC_out        : OUT    LC3B_WORD
   );

-- Declarations

END Stage_if ;

--
-- VHDL Architecture ece411.Stage_if.struct
--
-- Created:
--          by - baker30.ews (evrt-252-23.ews.illinois.edu)
--          at - 15:00:25 04/30/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Stage_if IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL AddrOut                : LC3b_word;
   SIGNAL BHT0                   : std_logic;
   SIGNAL BHT1                   : std_logic;
   SIGNAL BHTOut                 : LC3b_BR_BHT;
   SIGNAL BTBMUXOut              : lc3b_word;
   SIGNAL BTBMUXsel              : LC3b_4mux_sel;
   SIGNAL BTBMUXsel0             : STD_LOGIC;
   SIGNAL BTBMUXselector         : LC3B_4MUX_Sel;
   SIGNAL BTBPCMuxOut            : LC3b_word;
   SIGNAL BTBPred                : std_logic;
   SIGNAL BTBWrite               : std_logic;
   SIGNAL BTBwriteMOD            : std_logic;
   SIGNAL CondIn                 : std_logic;
   SIGNAL ConstBHT               : LC3b_BR_BHT;
   SIGNAL Const_NOP              : LC3b_word;
   SIGNAL CurrBHT1               : STD_LOGIC;
   SIGNAL F                      : STD_LOGIC;
   SIGNAL F1                     : LC3b_word;
   SIGNAL F10                    : std_logic;
   SIGNAL F11                    : STD_LOGIC;
   SIGNAL F12                    : std_logic;
   SIGNAL F2                     : std_logic;
   SIGNAL F8                     : std_logic;
   SIGNAL F9                     : std_logic;
   SIGNAL FlushRaw               : STD_LOGIC;
   SIGNAL G0                     : std_logic;
   SIGNAL G1                     : std_logic;
   SIGNAL G2                     : std_logic;
   SIGNAL Hit                    : std_logic;
   SIGNAL IAddrMuxSel            : std_logic;
   SIGNAL IF_Cond_Out            : std_logic;
   SIGNAL IR                     : lc3b_word;
   SIGNAL IROutMuxSel            : std_logic;
   SIGNAL NZP_eval               : STD_LOGIC;
   SIGNAL PCMuxOut               : lc3b_word;
   SIGNAL RESET_DELAYED          : std_logic;
   SIGNAL Sel                    : lc3b_4mux_sel;
   SIGNAL dout                   : STD_LOGIC;
   SIGNAL mem_BTBWrite_out_delay : STD_LOGIC;
   SIGNAL newBHT                 : LC3B_BR_BHT;
   SIGNAL newBHT1                : STD_LOGIC;
   SIGNAL output                 : LC3b_word;

   -- Implicit buffer signal declarations
   SIGNAL IF_BHT_Out_internal : LC3b_BR_BHT;
   SIGNAL flush_internal      : STD_LOGIC;
   SIGNAL if_PC_out_internal  : LC3B_WORD;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      F : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT BHTMux2
   PORT (
      A   : IN     LC3b_BR_BHT;
      B   : IN     LC3b_BR_BHT;
      Sel : IN     std_logic;
      F   : OUT    LC3b_BR_BHT
   );
   END COMPONENT;
   COMPONENT BHT_Combiner
   PORT (
      CLK      : IN     STD_LOGIC ;
      NZP_eval : IN     STD_LOGIC ;
      newBHT1  : IN     STD_LOGIC ;
      newBHT   : OUT    LC3B_BR_BHT 
   );
   END COMPONENT;
   COMPONENT BHT_Splitter
   PORT (
      CLK        : IN     STD_LOGIC;
      mem_BHT_in : IN     LC3b_BR_BHT;
      BHT0       : OUT    std_logic;
      BHT1       : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT BTBMuxSelGen
   PORT (
      BHT1           : IN     std_logic ;
      BTBPred        : IN     std_logic ;
      CLK            : IN     STD_LOGIC ;
      flush          : IN     STD_LOGIC ;
      Sel            : IN     lc3b_4mux_sel ;
      BTBMUXselector : OUT    LC3B_4MUX_Sel 
   );
   END COMPONENT;
   COMPONENT BTBWriteGen
   PORT (
      CLK              : IN     STD_LOGIC ;
      mem_BTBWrite_out : IN     std_logic ;
      BTBwriteMOD      : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT BitMux2
   PORT (
      A   : IN     std_logic ;
      B   : IN     std_logic ;
      Sel : IN     std_logic ;
      F   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Branch_unit
   PORT (
      AddrIn  : IN     LC3b_word ;
      BHTIn   : IN     LC3b_BR_BHT ;
      Bwrite  : IN     std_logic ;
      CondIn  : IN     std_logic ;
      Raddr1  : IN     LC3b_word ;
      Reset_L : IN     std_logic ;
      Waddr   : IN     LC3b_word ;
      AddrOut : OUT    LC3b_word ;
      BHTOut  : OUT    LC3b_BR_BHT ;
      CondOut : OUT    std_logic ;
      Hit     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT CondGen
   PORT (
      CLK       : IN     STD_LOGIC ;
      mem_DR_in : IN     LC3B_REG ;
      CondIn    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT D_Latch
   PORT (
      Data_In  : IN     lc3b_word ;
      Enable   : IN     std_logic ;
      data_out : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT IFCntrlStrip
   PORT (
      CLK             : IN     STD_LOGIC ;
      RESET_DELAYED   : IN     std_logic ;
      IROutMuxSel     : OUT    std_logic ;
      IAddrMuxSel     : OUT    std_logic ;
      Sel             : OUT    lc3b_4mux_sel ;
      mem_controls_in : IN     CONTROL_WORD 
   );
   END COMPONENT;
   COMPONENT IReadDelay
   PORT (
      CLK       : IN     STD_LOGIC;
      Load      : IN     STD_LOGIC;
      RESET     : IN     std_logic;
      I_MREAD_L : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT NZP_Check
   PORT (
      ex_DR_in   : IN     LC3B_REG;
      mem_NZP_in : IN     LC3B_CC;
      NZP_eval   : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      F : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT PLUS2
   PORT (
      PCout         : IN     LC3b_word;
      RESET_DELAYED : IN     std_logic;
      clk           : IN     std_logic;
      PCPlus2out    : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT Reg16
   PORT (
      Input  : IN     LC3b_word ;
      RESET  : IN     std_logic ;
      clk    : IN     std_logic ;
      load   : IN     std_logic ;
      Output : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ResetDelay
   PORT (
      CLK           : IN     STD_LOGIC ;
      RESET_L       : IN     STD_LOGIC ;
      RESET_DELAYED : OUT    std_logic 
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
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT OR3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT XOR2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      f : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : BHTMux2 USE ENTITY ece411.BHTMux2;
   FOR ALL : BHT_Combiner USE ENTITY ece411.BHT_Combiner;
   FOR ALL : BHT_Splitter USE ENTITY ece411.BHT_Splitter;
   FOR ALL : BTBMuxSelGen USE ENTITY ece411.BTBMuxSelGen;
   FOR ALL : BTBWriteGen USE ENTITY ece411.BTBWriteGen;
   FOR ALL : BitMux2 USE ENTITY ece411.BitMux2;
   FOR ALL : Branch_unit USE ENTITY ece411.Branch_unit;
   FOR ALL : CondGen USE ENTITY ece411.CondGen;
   FOR ALL : D_Latch USE ENTITY ece411.D_Latch;
   FOR ALL : IFCntrlStrip USE ENTITY ece411.IFCntrlStrip;
   FOR ALL : IReadDelay USE ENTITY ece411.IReadDelay;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : NZP_Check USE ENTITY ece411.NZP_Check;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : OR3 USE ENTITY mp3lib.OR3;
   FOR ALL : PLUS2 USE ENTITY ece411.PLUS2;
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : ResetDelay USE ENTITY ece411.ResetDelay;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   FOR ALL : XOR2 USE ENTITY mp3lib.XOR2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   Const_NOP <= "0000000000000000";
   btbmuxsel <= flush_internal & btbmuxsel0;
   mem_BTBWrite_out_delay <= mem_BTBWrite_out AFTER 4 ns;
   constBHT <= "01";


   -- ModuleWare code(v1.9) for instance 'U_10' of 'constval'
   dout <= '0';

   -- Instance port mappings.
   U_1 : AND2
      PORT MAP (
         A => BHT0,
         B => NZP_eval,
         F => G0
      );
   U_2 : AND2
      PORT MAP (
         A => BTBPred,
         B => BHT1,
         F => F8
      );
   U_7 : AND2
      PORT MAP (
         A => mem_BTBWrite_out,
         B => CLK,
         F => BTBWrite
      );
   U_8 : AND2
      PORT MAP (
         A => Hit,
         B => F12,
         F => BTBPred
      );
   U_12 : AND2
      PORT MAP (
         A => BHT1,
         B => NZP_eval,
         F => G1
      );
   U_13 : AND2
      PORT MAP (
         A => BHT0,
         B => BHT1,
         F => G2
      );
   U_15 : AND2
      PORT MAP (
         A => BTBPred,
         B => F11,
         F => F10
      );
   U_16 : AND2
      PORT MAP (
         A => flush_internal,
         B => BHT1,
         F => F9
      );
   U_23 : AND2
      PORT MAP (
         A => FlushRaw,
         B => F,
         F => F2
      );
   IROutMux1 : BHTMux2
      PORT MAP (
         A   => ConstBHT,
         B   => BHTOut,
         F   => IF_BHT_Out_internal,
         Sel => Hit
      );
   BHTCombine : BHT_Combiner
      PORT MAP (
         CLK      => CLK,
         NZP_eval => NZP_eval,
         newBHT1  => newBHT1,
         newBHT   => newBHT
      );
   BHTSplit : BHT_Splitter
      PORT MAP (
         CLK        => CLK,
         mem_BHT_in => mem_BHT_in,
         BHT0       => BHT0,
         BHT1       => BHT1
      );
   BHTSplit1 : BHT_Splitter
      PORT MAP (
         CLK        => CLK,
         mem_BHT_in => IF_BHT_Out_internal,
         BHT0       => OPEN,
         BHT1       => CurrBHT1
      );
   U_21 : BTBMuxSelGen
      PORT MAP (
         BHT1           => BHT1,
         BTBPred        => BTBPred,
         CLK            => CLK,
         flush          => flush_internal,
         Sel            => Sel,
         BTBMUXselector => BTBMUXselector
      );
   U_22 : BTBWriteGen
      PORT MAP (
         CLK              => CLK,
         mem_BTBWrite_out => mem_BTBWrite_out,
         BTBwriteMOD      => BTBwriteMOD
      );
   U_20 : BitMux2
      PORT MAP (
         A   => dout,
         B   => F2,
         Sel => mem_BTBWrite_out_delay,
         F   => flush_internal
      );
   BranchUnit : Branch_unit
      PORT MAP (
         AddrIn  => mem_PCadj_in,
         BHTIn   => newBHT,
         Bwrite  => BTBwriteMOD,
         CondIn  => CondIn,
         Raddr1  => output,
         Reset_L => RESET_L,
         Waddr   => mem_PC_in,
         AddrOut => AddrOut,
         BHTOut  => BHTOut,
         CondOut => IF_Cond_Out,
         Hit     => Hit
      );
   U_9 : CondGen
      PORT MAP (
         CLK       => CLK,
         mem_DR_in => mem_DR_in,
         CondIn    => CondIn
      );
   IRlatch : D_Latch
      PORT MAP (
         Data_In  => I_DATAIN,
         Enable   => I_MRESP_H,
         data_out => IR
      );
   U_0 : IFCntrlStrip
      PORT MAP (
         CLK             => CLK,
         RESET_DELAYED   => RESET_DELAYED,
         IROutMuxSel     => IROutMuxSel,
         IAddrMuxSel     => IAddrMuxSel,
         Sel             => Sel,
         mem_controls_in => mem_controls_in
      );
   U_3 : IReadDelay
      PORT MAP (
         CLK       => CLK,
         Load      => LOAD_IF,
         RESET     => RESET_L,
         I_MREAD_L => I_MREAD_L
      );
   U_4 : NZP_Check
      PORT MAP (
         ex_DR_in   => mem_DR_in,
         mem_NZP_in => wb_nzp_out,
         NZP_eval   => NZP_eval
      );
   U_19 : OR2
      PORT MAP (
         A => CurrBHT1,
         B => IF_Cond_Out,
         F => F12
      );
   PCPlus2 : PLUS2
      PORT MAP (
         PCout         => output,
         clk           => CLK,
         RESET_DELAYED => RESET_DELAYED,
         PCPlus2out    => if_PC_out_internal
      );
   PCReg : Reg16
      PORT MAP (
         Input  => BTBMUXOut,
         RESET  => RESET_L,
         clk    => CLK,
         load   => LOAD_IF,
         Output => output
      );
   U_6 : ResetDelay
      PORT MAP (
         CLK           => CLK,
         RESET_L       => RESET_L,
         RESET_DELAYED => RESET_DELAYED
      );
   BTBPCMux : WordMux2
      PORT MAP (
         A   => if_PC_out_internal,
         B   => mem_PC_in,
         Sel => CLK,
         F   => BTBPCMuxOut
      );
   IAddrMux : WordMux2
      PORT MAP (
         A   => output,
         B   => mem_ZEXT8_in,
         Sel => IAddrMuxSel,
         F   => I_ADDRESS
      );
   IROutMux : WordMux2
      PORT MAP (
         A   => IR,
         B   => Const_NOP,
         Sel => IROutMuxSel,
         F   => if_IR_out
      );
   U_5 : WordMux2
      PORT MAP (
         A   => if_PC_out_internal,
         B   => mem_PCadj_in,
         Sel => NZP_eval,
         F   => F1
      );
   PCMUX : WordMux4
      PORT MAP (
         A   => if_PC_out_internal,
         B   => IR,
         C   => F1,
         D   => mem_JMPaddr_in,
         Sel => Sel,
         F   => PCMuxOut
      );
   btbmux : WordMux4
      PORT MAP (
         A   => PCMuxOut,
         B   => AddrOut,
         C   => mem_PCadj_in,
         D   => mem_PC_in,
         Sel => BTBMUXselector,
         F   => BTBMUXOut
      );
   U_18 : NOT1
      PORT MAP (
         A => flush_internal,
         F => F11
      );
   U_24 : NOT1
      PORT MAP (
         A => CLK,
         F => F
      );
   U_11 : OR3
      PORT MAP (
         A => G0,
         B => G1,
         C => G2,
         F => newBHT1
      );
   U_17 : OR3
      PORT MAP (
         A => F8,
         B => F10,
         C => F9,
         F => BTBMUXsel0
      );
   U_14 : XOR2
      PORT MAP (
         a => BHT1,
         b => NZP_eval,
         f => FlushRaw
      );

   -- Implicit buffered output assignments
   IF_BHT_Out <= IF_BHT_Out_internal;
   flush      <= flush_internal;
   if_PC_out  <= if_PC_out_internal;

END struct;