--
-- VHDL Architecture ece411.BTBMuxSelGen.untitled
--
-- Created:
--          by - lachman1.ews (gelib-057-14.ews.illinois.edu)
--          at - 22:55:54 04/23/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTBMuxSelGen IS
   PORT( 
      BHT1           : IN     std_logic;
      BTBPred        : IN     std_logic;
      CLK            : IN     STD_LOGIC;
      flush          : IN     STD_LOGIC;
      Sel            : IN     LC3B_4MUX_Sel;
      BTBMUXselector : OUT    LC3B_4MUX_Sel
   );

-- Declarations

END BTBMuxSelGen ;

--
ARCHITECTURE untitled OF BTBMuxSelGen IS
BEGIN
  process(BHT1, BTBPred, flush, sel, clk)
  begin
    if(sel = "00") then
      if (flush = '1') then
        if(BHT1 = '0') then
          BTBMUXselector <= "10";
        else
          BTBMUXselector <= "11";
        end if;
      else
        if(BTBPred = '1') then
          BTBMUXselector <= "01";
        else
          BTBMUXselector <= "00";
        end if;
      end if;
    else
      BTBMUXselector <= "00";
    end if;
  end process;        
        
END ARCHITECTURE untitled;

