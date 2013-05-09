--
-- VHDL Architecture ece411.Pipeline_Control.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-20.ews.illinois.edu)
--          at - 21:59:25 03/26/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Pipeline_Control IS
   PORT( 
      CLK              : IN     STD_LOGIC;
      D_MREAD_L        : IN     STD_LOGIC;
      d_mresp_h        : IN     STD_LOGIC;
      D_MWRITEH_L      : IN     STD_LOGIC;
      D_MWRITEL_L      : IN     STD_LOGIC;
      I_MREAD_L        : IN     STD_LOGIC;
      I_MRESP_H        : IN     STD_LOGIC;
      RESET_L          : IN     STD_LOGIC;
      ex_DR_in         : IN     LC3B_REG;
      ex_MemRead_out   : IN     std_logic;
      id_REGaNum_out   : IN     LC3B_REG;
      id_REGbNum_out   : IN     LC3B_REG;
      LOAD_EXMEM       : OUT    STD_LOGIC;
      LOAD_IDEX        : OUT    STD_LOGIC;
      LOAD_IF          : OUT    std_logic;
      LOAD_IFID        : OUT    STD_LOGIC;
      LOAD_MEMWB       : OUT    STD_LOGIC;
      RESET_IDEX_L     : OUT    std_logic;
      state            : IN     STD_LOGIC;
      mem_mresp        : IN     std_logic;
      ldi              : IN     STD_LOGIC;
      sti              : IN     STD_LOGIC;
      LDISIG           : OUT    std_logic;
      STISIG2          : OUT    std_logic;
      STISIG           : OUT    STD_LOGIC;
      id_Opcode_out    : IN     lc3b_opcode;
      mem_Opcode_out   : IN     LC3b_OPCODE;
      FLUSH_L          : OUT    STD_LOGIC;
      flush            : IN     STD_LOGIC;
      BR_Miss          : OUT    STD_LOGIC;
      Bubble           : OUT    STD_LOGIC;
      mem_BTBWrite_out : IN     STD_LOGIC;
      ex_ALUX_ready    : IN     STD_LOGIC
   );

-- Declarations

END Pipeline_Control ;

--
ARCHITECTURE untitled OF Pipeline_Control IS
  signal L_EXMEM : std_logic;
  signal L_IDEX : std_logic;
  signal L_IFID : std_logic;
  signal L_IF   : std_logic;
  signal L_MEMWB : std_logic;
  signal L_LDISIG : std_logic;
  signal L_STISIG : std_logic;
  signal L_STISIG2 : std_logic;
  signal L_RESET_IDEX_L : std_logic;
  signal L_FLUSH_L : std_logic;
  signal L_BR_Miss  : std_logic;
  signal L_Bubble   : std_logic;  
  
BEGIN
  PROCESS(D_MRESP_H, I_MRESP_H, CLK, RESET_L, I_MREAD_L, D_MREAD_L , D_MWRITEH_L, D_MWRITEL_L, ldi, sti, id_Opcode_out, mem_Opcode_out, flush, mem_BTBWrite_out)
  variable sti_flag :std_logic;
  variable rw_flag :std_logic;
  BEGIN
    IF (RESET_L = '0') THEN
      L_EXMEM  <= '1';
      L_IDEX   <= '1';
      L_IFID   <= '1';
      L_IF     <= '1';
      L_MEMWB  <= '1';
      L_RESET_IDEX_L <= '1';
      L_FLUSH_L <= '1'; 
      L_LDISIG       <= '0';
      L_STISIG       <= '0';
      L_STISIG2       <= '0'; 
      sti_flag := '0';
      rw_flag := '0'; 
      L_BR_MISS <= '0';    
      L_Bubble <= '0';
      
    ELSE --CLK'EVENT AND CLK = '1' THEN
        L_EXMEM  <= '1';
        L_IDEX   <= '1';
        L_IFID   <= '1';
        L_IF     <= '1';
        L_MEMWB  <= '1';
        L_RESET_IDEX_L <= '1';
        L_FLUSH_L <= '1';         
        L_LDISIG       <= '0';
        L_STISIG       <= '0';
        L_STISIG2       <= '0';
        sti_flag := sti_flag;
        rw_flag := rw_flag; 
        L_BR_MISS <= '0'; 
        L_Bubble <= '0';         
      IF((rw_flag ='1') and (D_MRESP_H = '1')) then
          rw_flag := '0';
          
      END If;
      -- OR (id_Opcode_out = op_RTI) OR (id_Opcode_out = op_NOT))
      -- case a: inserting a bubble for 1. load 2. add/and
      IF ( (ex_MemRead_out = '0') AND ((id_Opcode_out = op_AND) OR (id_Opcode_out = op_ADD)
      OR (id_Opcode_out = op_RTI) OR (id_Opcode_out = op_NOT))
      AND ((ex_DR_in = id_REGaNum_out) OR (ex_DR_in = id_REGbNum_out))) THEN
          L_IF            <= '0';
          L_IFID          <= '0';
          L_IDEX          <= '0';
          L_RESET_IDEX_L  <= '0';
          L_EXMEM         <= '1';
          L_MEMWB         <= '1';
          L_Bubble <= '1';    
      END IF;
      -- new case for only ops other than ADD/AND      
      IF((ex_MemRead_out = '0') AND (id_Opcode_out /= op_add) AND (id_Opcode_out /= op_and)
      AND (id_Opcode_out /= op_RTI) AND (id_Opcode_out /= op_NOT)
      AND (id_Opcode_out /= op_BR) AND (id_Opcode_out /= op_LEA) AND (id_Opcode_out /= op_TRAP)
      AND (ex_DR_in = id_REGaNum_out)) THEN
          L_IF            <= '0';
          L_IFID          <= '0';
          L_IDEX          <= '0';
          L_RESET_IDEX_L  <= '0';
          L_EXMEM         <= '1';
          L_MEMWB         <= '1';
          L_Bubble <= '1';   
      END IF;  
      
      IF( (ldi = '1')AND (D_MRESP_H = '0')) THEN
          L_IF            <= '0';
          L_IFID          <= '0';
          L_IDEX          <= '0';
          L_LDISIG       <= '0';
          L_EXMEM         <= '0';
          L_MEMWB         <= '0';    
      END IF;
      
      -- need to send the LDI and STI signals when MRESP goes from 1 to 0
      -- or else the values will not be stable if there is a miss
      -- perhaps and AND gate in the pipeline register which only does
      -- the changes when MRESP is 0
      -- when MRESP is 0 the first time, before the load has began
      -- the load latches need to go to 0
      -- when MRESP is 0 the second time (after memory is done)
      -- then the signal should be sent ideally
      IF( (ldi = '1')AND (D_MRESP_H = '1')) THEN
          L_IF            <= '0';
          L_IFID          <= '0';
          L_IDEX          <= '0';
          L_LDISIG       <= '1';
          L_EXMEM         <= '0';
          L_MEMWB         <= '0';    
      END IF;
      IF( (sti = '1')AND (D_MRESP_H = '0')) THEN
          L_IF            <= '0';
          L_IFID          <= '0';
          L_IDEX          <= '0';
          L_STISIG       <= '0';
          L_EXMEM         <= '0';
          L_MEMWB         <= '0';    
      END IF;
      IF( (sti = '1')AND (D_MRESP_H = '1')) THEN
          L_IF            <= '0';
          L_IFID          <= '0';
          L_IDEX          <= '0';
          L_STISIG2       <= '1';
          sti_flag := '1'; 
          L_EXMEM         <= '0';
          L_MEMWB         <= '0';    
      END IF; 
      IF( (sti_flag = '1')AND (D_MRESP_H = '0')) THEN
          L_IF            <= '0';
          L_IFID          <= '0';
          L_IDEX          <= '0';
          L_STISIG       <= '1';
          L_EXMEM         <= '0';
          L_MEMWB         <= '0';    
      END IF; 
      IF((sti_flag = '1') AND (sti = '0')) then
          sti_flag := '0'; 
      END If;
      IF((I_MREAD_L = '0') AND (I_MRESP_H = '0')) THEN
          L_EXMEM  <= '0';
          L_IDEX   <= '0';
          L_IFID   <= '0';
          L_IF     <= '0';
          L_MEMWB  <= '0';
          L_RESET_IDEX_L  <= '1';
          L_Bubble <= '0';
      END IF;
      IF((D_MREAD_L = '0' OR D_MWRITEL_L = '0' OR D_MWRITEH_L = '0') AND (D_MRESP_H = '0')) THEN
          L_EXMEM  <= '0';
          L_IDEX   <= '0';
          L_IFID   <= '0';
          L_IF     <= '0';
          L_MEMWB  <= '0';
          rw_flag := '1'; 
          L_RESET_IDEX_L  <= '1';
          L_Bubble <= '0';   
      END IF;
      
      If ( ex_ALUX_ready = '0' ) THEN
          L_EXMEM  <= '0';
          L_IDEX   <= '0';
          L_IFID   <= '0';
          L_IF     <= '0';
          L_MEMWB  <= '0';  
      END IF;
      
      -- JSR flushing
      IF( (mem_Opcode_out = op_jsr) OR (mem_Opcode_out = op_jmp) OR (mem_Opcode_out = op_trap)) THEN
        L_FLUSH_L <= '0';      
       END IF;      
       
      -- BR flushing
      IF( (mem_Opcode_out = op_br) AND (flush ='1') AND (mem_BTBWrite_out = '1')) THEN
        L_FLUSH_L <= '0';
        L_BR_Miss <= '1';     
       END IF;          
   END IF;
    
  END PROCESS;
  LOAD_EXMEM  <= L_EXMEM after 1ns;
  LOAD_IDEX   <= L_IDEX after 1ns;
  LOAD_IFID   <= L_IFID after 1ns;
  LOAD_IF     <= L_IF after 1ns;
  LOAD_MEMWB  <= L_MEMWB after 1ns; 
  RESET_IDEX_L <= L_RESET_IDEX_L after 1ns;
  LDISIG <= L_LDISIG after 1ns;
  STISIG <= L_STISIG after 1ns;
  STISIG2 <= L_STISIG2 after 1ns;
  FLUSH_L <= L_FLUSH_L after 1ns;
  BR_Miss <= L_BR_Miss after 1ns;
  Bubble  <= L_Bubble  after 1ns;
END ARCHITECTURE untitled;

