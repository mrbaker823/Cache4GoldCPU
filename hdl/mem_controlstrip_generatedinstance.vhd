-- VHDL Entity ece411.mem_controlStrip.generatedInstance
--
-- Created:
--          by - baker30.ews (gelib-057-15.ews.illinois.edu)
--          at - 03:11:59 03/13/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mem_controlStrip IS
   PORT( 
      CLK             : IN     STD_LOGIC;
      d_MREAD_L       : OUT    STD_LOGIC;
      D_MWRITEH_L     : OUT    STD_LOGIC;
      D_MWRITEL_L     : OUT    STD_LOGIC;
      LoadMAR         : OUT    std_logic;
      MARMUXSel       : OUT    std_logic;
      mem_controls_in : IN     CONTROL_WORD
   );

END mem_controlStrip ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF mem_controlStrip IS 
BEGIN


END generatedInstance;