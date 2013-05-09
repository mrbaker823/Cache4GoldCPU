--
-- VHDL Architecture ece411.JMPCheck.untitled
--
-- Created:
--          by - lachman1.ews (gelib-057-14.ews.illinois.edu)
--          at - 01:58:28 04/24/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY JMPCheck IS
   PORT( 
      Opcode : IN     OPNAME;
      clk    : IN     STD_LOGIC;
      Sel    : OUT    std_logic
   );

-- Declarations

END JMPCheck ;

--
ARCHITECTURE untitled OF JMPCheck IS
BEGIN
  process(opcode)
  begin
    if(opcode = jmp_op) then
      sel <= '1';
    else
      sel <= '0';
    end if;
  end process;
      
END ARCHITECTURE untitled;

