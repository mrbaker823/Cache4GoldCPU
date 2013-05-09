--
-- VHDL Architecture ece411.BTBWriteGen.untitled
--
-- Created:
--          by - lachman1.ews (gelib-057-14.ews.illinois.edu)
--          at - 23:58:10 04/23/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTBWriteGen IS
   PORT( 
      CLK              : IN     STD_LOGIC;
      mem_BTBWrite_out : IN     std_logic;
      BTBwriteMOD      : OUT    std_logic
   );

-- Declarations

END BTBWriteGen ;

--
ARCHITECTURE untitled OF BTBWriteGen IS
  signal temp_write : std_logic;
BEGIN
  process(mem_BTBWrite_out)
  begin
      temp_write <= '0' after 0 ns, mem_BTBWrite_out after 30 ns, '0' after 40 ns;
  end process;
  BTBwriteMOD <= temp_write;
END ARCHITECTURE untitled;

