--
-- VHDL Architecture ece411.CondGen.untitled
--
-- Created:
--          by - lachman1.ews (gelib-057-02.ews.illinois.edu)
--          at - 17:23:27 04/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CondGen IS
   PORT( 
      CLK       : IN     STD_LOGIC;
      mem_DR_in : IN     LC3B_REG;
      CondIn    : OUT    std_logic
   );

-- Declarations

END CondGen ;

--
ARCHITECTURE untitled OF CondGen IS
BEGIN
  process(mem_DR_in)
  begin
  if(mem_Dr_in = "111") then
    CondIn <= '1';
  else
    CondIn <= '0';
  end if;
  end process;
END ARCHITECTURE untitled;

