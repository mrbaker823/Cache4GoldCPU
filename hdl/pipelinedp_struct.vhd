-- VHDL Entity ece411.PipelineDP.interface
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

ENTITY PipelineDP IS
   PORT( 
      CLK         : IN     STD_LOGIC;
      D_DATAIN    : IN     LC3B_WORD;
      I_DATAIN    : IN     LC3B_WORD;
      I_MRESP_H   : IN     STD_LOGIC;
      RESET_L     : IN     STD_LOGIC;
      d_mresp_h   : IN     STD_LOGIC;
      D_ADDRESS   : OUT    LC3B_WORD;
      D_DATAOUT   : OUT    LC3B_WORD;
      D_MREAD_L   : OUT    STD_LOGIC;
      D_MWRITEH_L : OUT    STD_LOGIC;
      D_MWRITEL_L : OUT    STD_LOGIC;
      I_ADDRESS   : OUT    LC3B_WORD;
      I_MREAD_L   : OUT    STD_LOGIC
   );

-- Declarations

END PipelineDP ;

--
-- VHDL Architecture ece411.PipelineDP.struct
--
-- Created:
--          by - baker30.ews (evrt-252-23.ews.illinois.edu)
--          at - 15:00:26 04/30/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF PipelineDP IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL BRMissCount1     : LC3B_Word;
   SIGNAL BR_Miss          : STD_LOGIC;
   SIGNAL BrMissPlus1      : LC3B_Word;
   SIGNAL Bubble           : STD_LOGIC;
   SIGNAL BubbleCount      : LC3B_Word;
   SIGNAL BubbleCountPlus1 : LC3B_Word;
   SIGNAL EX_PCadj_in      : LC3B_WORD;
   SIGNAL FLUSH_L          : STD_LOGIC;
   SIGNAL IF_BHT_Out       : LC3b_BR_BHT;
   SIGNAL LDISIG           : std_logic;
   SIGNAL LOAD_EXMEM       : STD_LOGIC;
   SIGNAL LOAD_IDEX        : STD_LOGIC;
   SIGNAL LOAD_IF          : std_logic;
   SIGNAL LOAD_IFID        : STD_LOGIC;
   SIGNAL LOAD_MEMWB       : STD_LOGIC;
   SIGNAL Mem_ALU_In       : LC3B_WORD;
   SIGNAL RESET_IDEX_L     : std_logic;
   SIGNAL STISIG           : STD_LOGIC;
   SIGNAL STISIG2          : std_logic;
   SIGNAL WB_RegIN         : LC3B_WORD;
   SIGNAL dout             : std_logic;
   SIGNAL dout1            : std_logic;
   SIGNAL ex_ADJ6_in       : LC3B_WORD;
   SIGNAL ex_ALUX_ready    : STD_LOGIC;
   SIGNAL ex_ALU_out       : LC3B_WORD;
   SIGNAL ex_BHT_in        : LC3b_BR_BHT;
   SIGNAL ex_DR_in         : LC3B_REG;
   SIGNAL ex_IR_in         : LC3B_WORD;
   SIGNAL ex_JMPaddr_out   : lc3b_word;
   SIGNAL ex_MemRead_out   : std_logic;
   SIGNAL ex_PC_in         : LC3B_WORD;
   SIGNAL ex_REGB_IN       : LC3B_WORD;
   SIGNAL ex_REGaNum_in    : LC3B_REG;
   SIGNAL ex_REGa_in       : LC3B_WORD;
   SIGNAL ex_REGbNum_in    : LC3B_REG;
   SIGNAL ex_SEXT5_in      : LC3B_WORD;
   SIGNAL ex_SEXT6_in      : LC3B_WORD;
   SIGNAL ex_ZEXT8_in      : LC3B_WORD;
   SIGNAL ex_controls_in   : CONTROL_WORD;
   SIGNAL ex_nzp_out       : LC3B_CC;
   SIGNAL ex_regb_out      : LC3b_word;
   SIGNAL flush            : STD_LOGIC;
   SIGNAL id_ADJ6_out      : LC3B_WORD;
   SIGNAL id_BHT_in        : LC3b_BR_BHT;
   SIGNAL id_DR_out        : LC3B_REG;
   SIGNAL id_IR_in         : LC3B_WORD;
   SIGNAL id_Opcode_out    : lc3b_opcode;
   SIGNAL id_PC_in         : LC3B_WORD;
   SIGNAL id_PCadj_out     : LC3B_WORD;
   SIGNAL id_REGaNum_out   : LC3B_REG;
   SIGNAL id_REGa_out      : LC3B_WORD;
   SIGNAL id_REGbNum_out   : LC3B_REG;
   SIGNAL id_REGb_out      : LC3B_WORD;
   SIGNAL id_SEXT5_out     : LC3B_WORD;
   SIGNAL id_SEXT6_out     : LC3B_WORD;
   SIGNAL id_ZEXT8_out     : LC3B_WORD;
   SIGNAL id_controls_out  : CONTROL_WORD;
   SIGNAL if_IR_out        : LC3B_WORD;
   SIGNAL if_PC_out        : LC3B_WORD;
   SIGNAL ldi              : STD_LOGIC;
   SIGNAL mem_BHT_in       : LC3b_BR_BHT;
   SIGNAL mem_BTBWrite_out : STD_LOGIC;
   SIGNAL mem_DATAIN_out   : LC3B_WORD;
   SIGNAL mem_DR_in        : LC3B_REG;
   SIGNAL mem_IR_in        : LC3B_WORD;
   SIGNAL mem_JMPaddr_in   : LC3b_WORD;
   SIGNAL mem_NZP_in       : LC3B_CC;
   SIGNAL mem_Opcode_out   : LC3b_OPCODE;
   SIGNAL mem_PC_in        : LC3B_WORD;
   SIGNAL mem_PCadj_in     : LC3B_WORD;
   SIGNAL mem_REGb_in      : LC3B_WORD;
   SIGNAL mem_RegWrite_out : STD_LOGIC;
   SIGNAL mem_ZEXT8_in     : LC3B_WORD;
   SIGNAL mem_controls_in  : CONTROL_WORD;
   SIGNAL mem_mresp        : std_logic;
   SIGNAL state            : STD_LOGIC;
   SIGNAL sti              : STD_LOGIC;
   SIGNAL wb_ALU_in        : LC3B_WORD;
   SIGNAL wb_DATAIN_in     : LC3B_WORD;
   SIGNAL wb_DR            : LC3B_REG;
   SIGNAL wb_DRMUXSel_out  : std_logic;
   SIGNAL wb_IR_in         : LC3B_WORD;
   SIGNAL wb_PC_in         : LC3B_WORD;
   SIGNAL wb_PCadj_in      : LC3B_WORD;
   SIGNAL wb_controls_in   : CONTROL_WORD;
   SIGNAL wb_nzp_out       : LC3B_CC;
   SIGNAL wb_regWrite      : std_logic;
   SIGNAL wb_regWrite_Out  : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL D_MREAD_L_internal   : STD_LOGIC;
   SIGNAL D_MWRITEH_L_internal : STD_LOGIC;
   SIGNAL D_MWRITEL_L_internal : STD_LOGIC;
   SIGNAL I_MREAD_L_internal   : STD_LOGIC;


   -- Component Declarations
   COMPONENT EX_MEM
   PORT (
      CLK             : IN     STD_LOGIC ;
      LOAD_EXMEM      : IN     STD_LOGIC ;
      RESET_L         : IN     STD_LOGIC ;
      ex_ALU_out      : IN     LC3B_WORD ;
      ex_IR_in        : IN     LC3B_WORD ;
      ex_PC_in        : IN     LC3B_WORD ;
      EX_PCadj_in     : IN     LC3B_WORD ;
      ex_ZEXT8_in     : IN     LC3B_WORD ;
      ex_controls_in  : IN     CONTROL_WORD ;
      Mem_ALU_In      : OUT    LC3B_WORD ;
      mem_IR_in       : OUT    LC3B_WORD ;
      mem_PC_in       : OUT    LC3B_WORD ;
      mem_ZEXT8_in    : OUT    LC3B_WORD ;
      mem_controls_in : OUT    CONTROL_WORD ;
      mem_PCadj_in    : OUT    LC3B_WORD ;
      ex_nzp_out      : IN     LC3B_CC ;
      mem_NZP_in      : OUT    LC3B_CC ;
      mem_REGb_in     : OUT    LC3B_WORD ;
      ex_DR_in        : IN     LC3B_REG ;
      mem_DR_in       : OUT    LC3B_REG ;
      ex_regb_out     : IN     LC3b_word ;
      LDISIG          : IN     std_logic ;
      mem_DATAIN_out  : IN     LC3B_WORD ;
      STISIG          : IN     STD_LOGIC ;
      STISIG2         : IN     std_logic ;
      mem_BHT_in      : OUT    LC3b_BR_BHT ;
      ex_BHT_in       : IN     LC3b_BR_BHT ;
      mem_JMPaddr_in  : OUT    LC3b_WORD ;
      ex_JMPaddr_out  : IN     lc3b_word 
   );
   END COMPONENT;
   COMPONENT ID_EX
   PORT (
      CLK             : IN     STD_LOGIC ;
      LOAD_IDEX       : IN     STD_LOGIC ;
      RESET_L         : IN     STD_LOGIC ;
      id_ADJ6_out     : IN     LC3B_WORD ;
      id_IR_in        : IN     LC3B_WORD ;
      id_PC_in        : IN     LC3B_WORD ;
      id_PCadj_out    : IN     LC3B_WORD ;
      id_REGa_out     : IN     LC3B_WORD ;
      id_REGb_out     : IN     LC3B_WORD ;
      id_SEXT5_out    : IN     LC3B_WORD ;
      id_SEXT6_out    : IN     LC3B_WORD ;
      id_ZEXT8_out    : IN     LC3B_WORD ;
      id_controls_out : IN     CONTROL_WORD ;
      ex_ADJ6_in      : OUT    LC3B_WORD ;
      ex_IR_in        : OUT    LC3B_WORD ;
      ex_PC_in        : OUT    LC3B_WORD ;
      EX_PCadj_in     : OUT    LC3B_WORD ;
      ex_REGa_in      : OUT    LC3B_WORD ;
      ex_REGB_IN      : OUT    LC3B_WORD ;
      ex_SEXT5_in     : OUT    LC3B_WORD ;
      ex_SEXT6_in     : OUT    LC3B_WORD ;
      ex_ZEXT8_in     : OUT    LC3B_WORD ;
      ex_controls_in  : OUT    CONTROL_WORD ;
      id_DR_out       : IN     LC3B_REG ;
      id_REGaNum_out  : IN     LC3B_REG ;
      id_REGbNum_out  : IN     LC3B_REG ;
      ex_REGaNum_in   : OUT    LC3B_REG ;
      ex_REGbNum_in   : OUT    LC3B_REG ;
      ex_DR_in        : OUT    LC3B_REG ;
      RESET_IDEX_L    : IN     std_logic ;
      id_BHT_in       : IN     LC3b_BR_BHT ;
      ex_BHT_in       : OUT    LC3b_BR_BHT ;
      FLUSH_L         : IN     STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT IF_ID
   PORT (
      CLK        : IN     STD_LOGIC ;
      RESET_L    : IN     STD_LOGIC ;
      if_IR_out  : IN     LC3B_WORD ;
      if_PC_out  : IN     LC3B_WORD ;
      id_IR_in   : OUT    LC3B_WORD ;
      id_PC_in   : OUT    LC3B_WORD ;
      LOAD_IFID  : IN     STD_LOGIC ;
      IF_BHT_Out : IN     LC3b_BR_BHT ;
      id_BHT_in  : OUT    LC3b_BR_BHT ;
      FLUSH_L    : IN     STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MEM_WB
   PORT (
      CLK             : IN     STD_LOGIC ;
      LOAD_MEMWB      : IN     STD_LOGIC ;
      RESET_L         : IN     STD_LOGIC ;
      Mem_ALU_In      : IN     LC3B_WORD ;
      mem_DATAIN_out  : IN     LC3B_WORD ;
      mem_IR_in       : IN     LC3B_WORD ;
      mem_PC_in       : IN     LC3B_WORD ;
      mem_controls_in : IN     CONTROL_WORD ;
      wb_ALU_in       : OUT    LC3B_WORD ;
      wb_DATAIN_in    : OUT    LC3B_WORD ;
      wb_IR_in        : OUT    LC3B_WORD ;
      wb_controls_in  : OUT    CONTROL_WORD ;
      mem_PCadj_in    : IN     LC3B_WORD ;
      wb_PC_in        : OUT    LC3B_WORD ;
      wb_PCadj_in     : OUT    LC3B_WORD ;
      mem_DR_in       : IN     LC3B_REG 
   );
   END COMPONENT;
   COMPONENT Pipeline_Control
   PORT (
      CLK              : IN     STD_LOGIC ;
      D_MREAD_L        : IN     STD_LOGIC ;
      d_mresp_h        : IN     STD_LOGIC ;
      D_MWRITEH_L      : IN     STD_LOGIC ;
      D_MWRITEL_L      : IN     STD_LOGIC ;
      I_MREAD_L        : IN     STD_LOGIC ;
      I_MRESP_H        : IN     STD_LOGIC ;
      RESET_L          : IN     STD_LOGIC ;
      ex_DR_in         : IN     LC3B_REG ;
      ex_MemRead_out   : IN     std_logic ;
      id_REGaNum_out   : IN     LC3B_REG ;
      id_REGbNum_out   : IN     LC3B_REG ;
      LOAD_EXMEM       : OUT    STD_LOGIC ;
      LOAD_IDEX        : OUT    STD_LOGIC ;
      LOAD_IF          : OUT    std_logic ;
      LOAD_IFID        : OUT    STD_LOGIC ;
      LOAD_MEMWB       : OUT    STD_LOGIC ;
      RESET_IDEX_L     : OUT    std_logic ;
      state            : IN     STD_LOGIC ;
      mem_mresp        : IN     std_logic ;
      ldi              : IN     STD_LOGIC ;
      sti              : IN     STD_LOGIC ;
      LDISIG           : OUT    std_logic ;
      STISIG2          : OUT    std_logic ;
      STISIG           : OUT    STD_LOGIC ;
      id_Opcode_out    : IN     lc3b_opcode ;
      mem_Opcode_out   : IN     LC3b_OPCODE ;
      FLUSH_L          : OUT    STD_LOGIC ;
      flush            : IN     STD_LOGIC ;
      BR_Miss          : OUT    STD_LOGIC ;
      Bubble           : OUT    STD_LOGIC ;
      mem_BTBWrite_out : IN     STD_LOGIC ;
      ex_ALUX_ready    : IN     STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT Plus1
   PORT (
      CLK     : IN     STD_LOGIC;
      DataIn  : IN     LC3B_Word;
      DataOut : OUT    LC3B_Word
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
   COMPONENT Stage_ex
   PORT (
      EX_PCadj_in      : IN     LC3B_WORD ;
      Mem_ALU_In       : IN     LC3B_WORD ;
      RESET_L          : IN     STD_LOGIC ;
      WB_RegIN         : IN     LC3B_WORD ;
      clk              : IN     STD_LOGIC ;
      ex_ADJ6_in       : IN     LC3B_WORD ;
      ex_REGB_IN       : IN     LC3B_WORD ;
      ex_REGaNum_in    : IN     LC3B_REG ;
      ex_REGa_in       : IN     LC3B_WORD ;
      ex_REGbNum_in    : IN     LC3B_REG ;
      ex_SEXT5_in      : IN     LC3B_WORD ;
      ex_SEXT6_in      : IN     LC3B_WORD ;
      ex_controls_in   : IN     CONTROL_WORD ;
      mem_DR_in        : IN     LC3B_REG ;
      mem_RegWrite_out : IN     STD_LOGIC ;
      wb_DR            : IN     LC3B_REG ;
      wb_regWrite_Out  : IN     std_logic ;
      ex_ALUX_ready    : OUT    STD_LOGIC ;
      ex_ALU_out       : OUT    LC3B_WORD ;
      ex_JMPaddr_out   : OUT    LC3b_word ;
      ex_MemRead_out   : OUT    std_logic ;
      ex_nzp_out       : OUT    LC3B_CC ;
      ex_regb_out      : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT Stage_id
   PORT (
      CLK             : IN     STD_LOGIC ;
      RESET_L         : IN     STD_LOGIC ;
      WB_RegIN        : IN     LC3B_WORD ;
      id_IR_in        : IN     LC3B_WORD ;
      id_PC_in        : IN     LC3B_WORD ;
      wb_DR           : IN     LC3B_REG ;
      wb_DRMUXSel_out : IN     std_logic ;
      wb_regWrite     : IN     std_logic ;
      id_ADJ6_out     : OUT    LC3B_WORD ;
      id_DR_out       : OUT    LC3B_REG ;
      id_Opcode_out   : OUT    lc3b_opcode ;
      id_PCadj_out    : OUT    LC3B_WORD ;
      id_REGaNum_out  : OUT    LC3B_REG ;
      id_REGa_out     : OUT    LC3B_WORD ;
      id_REGbNum_out  : OUT    LC3B_REG ;
      id_REGb_out     : OUT    LC3B_WORD ;
      id_SEXT5_out    : OUT    LC3B_WORD ;
      id_SEXT6_out    : OUT    LC3B_WORD ;
      id_ZEXT8_out    : OUT    LC3B_WORD ;
      id_controls_out : OUT    CONTROL_WORD 
   );
   END COMPONENT;
   COMPONENT Stage_if
   PORT (
      CLK              : IN     STD_LOGIC ;
      I_DATAIN         : IN     LC3B_WORD ;
      I_MRESP_H        : IN     STD_LOGIC ;
      LOAD_IF          : IN     std_logic ;
      RESET_L          : IN     STD_LOGIC ;
      mem_BHT_in       : IN     LC3b_BR_BHT ;
      mem_BTBWrite_out : IN     std_logic ;
      mem_DR_in        : IN     LC3B_REG ;
      mem_JMPaddr_in   : IN     LC3b_WORD ;
      mem_PC_in        : IN     LC3B_WORD ;
      mem_PCadj_in     : IN     LC3B_WORD ;
      mem_ZEXT8_in     : IN     LC3B_WORD ;
      mem_controls_in  : IN     CONTROL_WORD ;
      wb_nzp_out       : IN     LC3B_CC ;
      IF_BHT_Out       : OUT    LC3b_BR_BHT ;
      I_ADDRESS        : OUT    LC3B_WORD ;
      I_MREAD_L        : OUT    STD_LOGIC ;
      flush            : OUT    STD_LOGIC ;
      if_IR_out        : OUT    LC3B_WORD ;
      if_PC_out        : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT Stage_mem
   PORT (
      CLK              : IN     STD_LOGIC ;
      D_DATAIN         : IN     LC3B_WORD ;
      Mem_ALU_In       : IN     LC3B_WORD ;
      RESET_L          : IN     STD_LOGIC ;
      d_mresp_h        : IN     STD_LOGIC ;
      mem_IR_in        : IN     LC3B_WORD ;
      mem_REGb_in      : IN     LC3B_WORD ;
      mem_ZEXT8_in     : IN     LC3B_WORD ;
      mem_controls_in  : IN     CONTROL_WORD ;
      D_ADDRESS        : OUT    LC3B_WORD ;
      D_DATAOUT        : OUT    LC3B_WORD ;
      D_MREAD_L        : OUT    STD_LOGIC ;
      D_MWRITEH_L      : OUT    STD_LOGIC ;
      D_MWRITEL_L      : OUT    STD_LOGIC ;
      ldi              : OUT    STD_LOGIC ;
      mem_BTBWrite_out : OUT    STD_LOGIC ;
      mem_DATAIN_out   : OUT    LC3B_WORD ;
      mem_Opcode_out   : OUT    LC3b_OPCODE ;
      mem_RegWrite_out : OUT    STD_LOGIC ;
      sti              : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT Stage_wb
   PORT (
      CLK             : IN     STD_LOGIC ;
      RESET_L         : IN     STD_LOGIC ;
      wb_ALU_in       : IN     LC3B_WORD ;
      wb_DATAIN_in    : IN     LC3B_WORD ;
      wb_IR_in        : IN     LC3B_WORD ;
      wb_PC_in        : IN     LC3B_WORD ;
      wb_PCadj_in     : IN     LC3B_WORD ;
      wb_controls_in  : IN     CONTROL_WORD ;
      WB_RegIN        : OUT    LC3B_WORD ;
      wb_DR           : OUT    LC3B_REG ;
      wb_DRMUXSel_out : OUT    std_logic ;
      wb_nzp_out      : OUT    LC3B_CC ;
      wb_regWrite     : OUT    std_logic ;
      wb_regWrite_Out : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : EX_MEM USE ENTITY ece411.EX_MEM;
   FOR ALL : ID_EX USE ENTITY ece411.ID_EX;
   FOR ALL : IF_ID USE ENTITY ece411.IF_ID;
   FOR ALL : MEM_WB USE ENTITY ece411.MEM_WB;
   FOR ALL : Pipeline_Control USE ENTITY ece411.Pipeline_Control;
   FOR ALL : Plus1 USE ENTITY ece411.Plus1;
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : Stage_ex USE ENTITY ece411.Stage_ex;
   FOR ALL : Stage_id USE ENTITY ece411.Stage_id;
   FOR ALL : Stage_if USE ENTITY ece411.Stage_if;
   FOR ALL : Stage_mem USE ENTITY ece411.Stage_mem;
   FOR ALL : Stage_wb USE ENTITY ece411.Stage_wb;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.9) for instance 'U_1' of 'constval'
   dout <= '1';

   -- ModuleWare code(v1.9) for instance 'U_3' of 'constval'
   dout1 <= '1';

   -- Instance port mappings.
   exmem : EX_MEM
      PORT MAP (
         CLK             => CLK,
         LOAD_EXMEM      => LOAD_EXMEM,
         RESET_L         => RESET_L,
         ex_ALU_out      => ex_ALU_out,
         ex_IR_in        => ex_IR_in,
         ex_PC_in        => ex_PC_in,
         EX_PCadj_in     => EX_PCadj_in,
         ex_ZEXT8_in     => ex_ZEXT8_in,
         ex_controls_in  => ex_controls_in,
         Mem_ALU_In      => Mem_ALU_In,
         mem_IR_in       => mem_IR_in,
         mem_PC_in       => mem_PC_in,
         mem_ZEXT8_in    => mem_ZEXT8_in,
         mem_controls_in => mem_controls_in,
         mem_PCadj_in    => mem_PCadj_in,
         ex_nzp_out      => ex_nzp_out,
         mem_NZP_in      => mem_NZP_in,
         mem_REGb_in     => mem_REGb_in,
         ex_DR_in        => ex_DR_in,
         mem_DR_in       => mem_DR_in,
         ex_regb_out     => ex_regb_out,
         LDISIG          => LDISIG,
         mem_DATAIN_out  => mem_DATAIN_out,
         STISIG          => STISIG,
         STISIG2         => STISIG2,
         mem_BHT_in      => mem_BHT_in,
         ex_BHT_in       => ex_BHT_in,
         mem_JMPaddr_in  => mem_JMPaddr_in,
         ex_JMPaddr_out  => ex_JMPaddr_out
      );
   idex : ID_EX
      PORT MAP (
         CLK             => CLK,
         LOAD_IDEX       => LOAD_IDEX,
         RESET_L         => RESET_L,
         id_ADJ6_out     => id_ADJ6_out,
         id_IR_in        => id_IR_in,
         id_PC_in        => id_PC_in,
         id_PCadj_out    => id_PCadj_out,
         id_REGa_out     => id_REGa_out,
         id_REGb_out     => id_REGb_out,
         id_SEXT5_out    => id_SEXT5_out,
         id_SEXT6_out    => id_SEXT6_out,
         id_ZEXT8_out    => id_ZEXT8_out,
         id_controls_out => id_controls_out,
         ex_ADJ6_in      => ex_ADJ6_in,
         ex_IR_in        => ex_IR_in,
         ex_PC_in        => ex_PC_in,
         EX_PCadj_in     => EX_PCadj_in,
         ex_REGa_in      => ex_REGa_in,
         ex_REGB_IN      => ex_REGB_IN,
         ex_SEXT5_in     => ex_SEXT5_in,
         ex_SEXT6_in     => ex_SEXT6_in,
         ex_ZEXT8_in     => ex_ZEXT8_in,
         ex_controls_in  => ex_controls_in,
         id_DR_out       => id_DR_out,
         id_REGaNum_out  => id_REGaNum_out,
         id_REGbNum_out  => id_REGbNum_out,
         ex_REGaNum_in   => ex_REGaNum_in,
         ex_REGbNum_in   => ex_REGbNum_in,
         ex_DR_in        => ex_DR_in,
         RESET_IDEX_L    => RESET_IDEX_L,
         id_BHT_in       => id_BHT_in,
         ex_BHT_in       => ex_BHT_in,
         FLUSH_L         => FLUSH_L
      );
   ifid : IF_ID
      PORT MAP (
         CLK        => CLK,
         RESET_L    => RESET_L,
         if_IR_out  => if_IR_out,
         if_PC_out  => if_PC_out,
         id_IR_in   => id_IR_in,
         id_PC_in   => id_PC_in,
         LOAD_IFID  => LOAD_IFID,
         IF_BHT_Out => IF_BHT_Out,
         id_BHT_in  => id_BHT_in,
         FLUSH_L    => FLUSH_L
      );
   memwb : MEM_WB
      PORT MAP (
         CLK             => CLK,
         LOAD_MEMWB      => LOAD_MEMWB,
         RESET_L         => RESET_L,
         Mem_ALU_In      => Mem_ALU_In,
         mem_DATAIN_out  => mem_DATAIN_out,
         mem_IR_in       => mem_IR_in,
         mem_PC_in       => mem_PC_in,
         mem_controls_in => mem_controls_in,
         wb_ALU_in       => wb_ALU_in,
         wb_DATAIN_in    => wb_DATAIN_in,
         wb_IR_in        => wb_IR_in,
         wb_controls_in  => wb_controls_in,
         mem_PCadj_in    => mem_PCadj_in,
         wb_PC_in        => wb_PC_in,
         wb_PCadj_in     => wb_PCadj_in,
         mem_DR_in       => mem_DR_in
      );
   PipeControl : Pipeline_Control
      PORT MAP (
         CLK              => CLK,
         D_MREAD_L        => D_MREAD_L_internal,
         d_mresp_h        => d_mresp_h,
         D_MWRITEH_L      => D_MWRITEH_L_internal,
         D_MWRITEL_L      => D_MWRITEL_L_internal,
         I_MREAD_L        => I_MREAD_L_internal,
         I_MRESP_H        => I_MRESP_H,
         RESET_L          => RESET_L,
         ex_DR_in         => ex_DR_in,
         ex_MemRead_out   => ex_MemRead_out,
         id_REGaNum_out   => id_REGaNum_out,
         id_REGbNum_out   => id_REGbNum_out,
         LOAD_EXMEM       => LOAD_EXMEM,
         LOAD_IDEX        => LOAD_IDEX,
         LOAD_IF          => LOAD_IF,
         LOAD_IFID        => LOAD_IFID,
         LOAD_MEMWB       => LOAD_MEMWB,
         RESET_IDEX_L     => RESET_IDEX_L,
         state            => state,
         mem_mresp        => mem_mresp,
         ldi              => ldi,
         sti              => sti,
         LDISIG           => LDISIG,
         STISIG2          => STISIG2,
         STISIG           => STISIG,
         id_Opcode_out    => id_Opcode_out,
         mem_Opcode_out   => mem_Opcode_out,
         FLUSH_L          => FLUSH_L,
         flush            => flush,
         BR_Miss          => BR_Miss,
         Bubble           => Bubble,
         mem_BTBWrite_out => mem_BTBWrite_out,
         ex_ALUX_ready    => ex_ALUX_ready
      );
   U_2 : Plus1
      PORT MAP (
         CLK     => CLK,
         DataIn  => BubbleCount,
         DataOut => BubbleCountPlus1
      );
   U_4 : Plus1
      PORT MAP (
         CLK     => CLK,
         DataIn  => BRMissCount1,
         DataOut => BrMissPlus1
      );
   BRMissCounter1 : Reg16
      PORT MAP (
         Input  => BrMissPlus1,
         RESET  => RESET_L,
         clk    => BR_Miss,
         load   => dout1,
         Output => BRMissCount1
      );
   BubbleCounter : Reg16
      PORT MAP (
         Input  => BubbleCountPlus1,
         RESET  => RESET_L,
         clk    => Bubble,
         load   => dout,
         Output => BubbleCount
      );
   sEX : Stage_ex
      PORT MAP (
         CLK              => CLK,
         EX_PCadj_in      => EX_PCadj_in,
         Mem_ALU_In       => Mem_ALU_In,
         RESET_L          => RESET_L,
         WB_RegIN         => WB_RegIN,
         ex_ADJ6_in       => ex_ADJ6_in,
         ex_REGB_IN       => ex_REGB_IN,
         ex_REGaNum_in    => ex_REGaNum_in,
         ex_REGa_in       => ex_REGa_in,
         ex_REGbNum_in    => ex_REGbNum_in,
         ex_SEXT5_in      => ex_SEXT5_in,
         ex_SEXT6_in      => ex_SEXT6_in,
         ex_controls_in   => ex_controls_in,
         mem_DR_in        => mem_DR_in,
         mem_RegWrite_out => mem_RegWrite_out,
         wb_DR            => wb_DR,
         wb_regWrite_Out  => wb_regWrite_Out,
         ex_ALUX_ready    => ex_ALUX_ready,
         ex_ALU_out       => ex_ALU_out,
         ex_JMPaddr_out   => ex_JMPaddr_out,
         ex_MemRead_out   => ex_MemRead_out,
         ex_nzp_out       => ex_nzp_out,
         ex_regb_out      => ex_regb_out
      );
   sID : Stage_id
      PORT MAP (
         CLK             => CLK,
         RESET_L         => RESET_L,
         WB_RegIN        => WB_RegIN,
         id_IR_in        => id_IR_in,
         id_PC_in        => id_PC_in,
         wb_DR           => wb_DR,
         wb_DRMUXSel_out => wb_DRMUXSel_out,
         wb_regWrite     => wb_regWrite,
         id_ADJ6_out     => id_ADJ6_out,
         id_DR_out       => id_DR_out,
         id_Opcode_out   => id_Opcode_out,
         id_PCadj_out    => id_PCadj_out,
         id_REGaNum_out  => id_REGaNum_out,
         id_REGa_out     => id_REGa_out,
         id_REGbNum_out  => id_REGbNum_out,
         id_REGb_out     => id_REGb_out,
         id_SEXT5_out    => id_SEXT5_out,
         id_SEXT6_out    => id_SEXT6_out,
         id_ZEXT8_out    => id_ZEXT8_out,
         id_controls_out => id_controls_out
      );
   sIF : Stage_if
      PORT MAP (
         CLK              => CLK,
         I_DATAIN         => I_DATAIN,
         I_MRESP_H        => I_MRESP_H,
         LOAD_IF          => LOAD_IF,
         RESET_L          => RESET_L,
         mem_BHT_in       => mem_BHT_in,
         mem_BTBWrite_out => mem_BTBWrite_out,
         mem_DR_in        => mem_DR_in,
         mem_JMPaddr_in   => mem_JMPaddr_in,
         mem_PC_in        => mem_PC_in,
         mem_PCadj_in     => mem_PCadj_in,
         mem_ZEXT8_in     => mem_ZEXT8_in,
         mem_controls_in  => mem_controls_in,
         wb_nzp_out       => wb_nzp_out,
         IF_BHT_Out       => IF_BHT_Out,
         I_ADDRESS        => I_ADDRESS,
         I_MREAD_L        => I_MREAD_L_internal,
         flush            => flush,
         if_IR_out        => if_IR_out,
         if_PC_out        => if_PC_out
      );
   sMEM : Stage_mem
      PORT MAP (
         CLK              => CLK,
         D_DATAIN         => D_DATAIN,
         Mem_ALU_In       => Mem_ALU_In,
         RESET_L          => RESET_L,
         d_mresp_h        => d_mresp_h,
         mem_IR_in        => mem_IR_in,
         mem_REGb_in      => mem_REGb_in,
         mem_ZEXT8_in     => mem_ZEXT8_in,
         mem_controls_in  => mem_controls_in,
         D_ADDRESS        => D_ADDRESS,
         D_DATAOUT        => D_DATAOUT,
         D_MREAD_L        => D_MREAD_L_internal,
         D_MWRITEH_L      => D_MWRITEH_L_internal,
         D_MWRITEL_L      => D_MWRITEL_L_internal,
         ldi              => ldi,
         mem_BTBWrite_out => mem_BTBWrite_out,
         mem_DATAIN_out   => mem_DATAIN_out,
         mem_Opcode_out   => mem_Opcode_out,
         mem_RegWrite_out => mem_RegWrite_out,
         sti              => sti
      );
   sWB : Stage_wb
      PORT MAP (
         CLK             => CLK,
         RESET_L         => RESET_L,
         wb_ALU_in       => wb_ALU_in,
         wb_DATAIN_in    => wb_DATAIN_in,
         wb_IR_in        => wb_IR_in,
         wb_PC_in        => wb_PC_in,
         wb_PCadj_in     => wb_PCadj_in,
         wb_controls_in  => wb_controls_in,
         WB_RegIN        => WB_RegIN,
         wb_DR           => wb_DR,
         wb_DRMUXSel_out => wb_DRMUXSel_out,
         wb_nzp_out      => wb_nzp_out,
         wb_regWrite     => wb_regWrite,
         wb_regWrite_Out => wb_regWrite_Out
      );

   -- Implicit buffered output assignments
   D_MREAD_L   <= D_MREAD_L_internal;
   D_MWRITEH_L <= D_MWRITEH_L_internal;
   D_MWRITEL_L <= D_MWRITEL_L_internal;
   I_MREAD_L   <= I_MREAD_L_internal;

END struct;
