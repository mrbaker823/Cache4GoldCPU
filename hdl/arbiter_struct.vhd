-- VHDL Entity ece411.Arbiter.symbol
--
-- Created:
--          by - mcasano2.ews (evrt-252-14.ews.illinois.edu)
--          at - 19:55:59 04/24/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Arbiter IS
   PORT( 
      CLK          : IN     std_logic;
      D_ADDRESS    : IN     LC3B_WORD;
      D_DATAOUT    : IN     LC3B_OWORD;
      D_MREAD_L    : IN     STD_LOGIC;
      D_MWRITEL_L  : IN     STD_LOGIC;
      I_ADDRESS    : IN     LC3B_WORD;
      I_MREAD_L    : IN     std_logic;
      L2_DATAIN    : IN     LC3B_OWORD;
      L2_MRESP_H   : IN     std_logic;
      RESET_L      : IN     std_logic;
      D_DATAIN     : OUT    LC3B_OWORD;
      D_L2_MRESP_H : OUT    std_logic;
      I_DATAIN     : OUT    LC3B_OWORD;
      I_L2_MRESP_H : OUT    std_logic;
      L2_ADDRESS   : OUT    LC3B_WORD;
      L2_DATAOUT   : OUT    LC3B_OWORD;
      MREAD_L      : OUT    std_logic;
      MWRITE_L     : OUT    STD_LOGIC
   );

-- Declarations

END Arbiter ;

--
-- VHDL Architecture ece411.Arbiter.struct
--
-- Created:
--          by - mcasano2.ews (evrt-252-14.ews.illinois.edu)
--          at - 19:55:59 04/24/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Arbiter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ArbiterSel : std_logic;
   SIGNAL D_Access   : std_logic;


   -- Component Declarations
   COMPONENT ArbiterControl
   PORT (
      D_Access   : IN     std_logic ;
      I_Access   : IN     std_logic ;
      L2_MRESP_H : IN     std_logic ;
      clk        : IN     std_logic ;
      rst        : IN     std_logic ;
      ArbiterSel : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ArbiterDatapath
   PORT (
      ArbiterSel   : IN     std_logic ;
      D_ADDRESS    : IN     LC3B_WORD ;
      D_DATAOUT    : IN     LC3b_oword ;
      D_MREAD_L    : IN     std_logic ;
      D_MWRITE_L   : IN     STD_LOGIC ;
      I_ADDRESS    : IN     LC3B_WORD ;
      I_MREAD_L    : IN     std_logic ;
      L2_DATAIN    : IN     LC3B_OWORD ;
      L2_MRESP_H   : IN     std_logic ;
      D_DATAIN     : OUT    LC3B_OWORD ;
      D_L2_MRESP_H : OUT    std_logic ;
      I_DATAIN     : OUT    LC3B_OWORD ;
      I_L2_MRESP_H : OUT    std_logic ;
      L2_ADDRESS   : OUT    LC3B_WORD ;
      L2_DATAOUT   : OUT    LC3b_oword ;
      MREAD_L      : OUT    std_logic ;
      MWRITE_L     : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : ArbiterControl USE ENTITY ece411.ArbiterControl;
   FOR ALL : ArbiterDatapath USE ENTITY ece411.ArbiterDatapath;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   ArbFSM : ArbiterControl
      PORT MAP (
         D_Access   => D_Access,
         I_Access   => I_MREAD_L,
         L2_MRESP_H => L2_MRESP_H,
         clk        => CLK,
         rst        => RESET_L,
         ArbiterSel => ArbiterSel
      );
   ArbDP : ArbiterDatapath
      PORT MAP (
         ArbiterSel   => ArbiterSel,
         D_ADDRESS    => D_ADDRESS,
         D_DATAOUT    => D_DATAOUT,
         D_MREAD_L    => D_MREAD_L,
         D_MWRITE_L   => D_MWRITEL_L,
         I_ADDRESS    => I_ADDRESS,
         I_MREAD_L    => I_MREAD_L,
         L2_DATAIN    => L2_DATAIN,
         L2_MRESP_H   => L2_MRESP_H,
         D_DATAIN     => D_DATAIN,
         D_L2_MRESP_H => D_L2_MRESP_H,
         I_DATAIN     => I_DATAIN,
         I_L2_MRESP_H => I_L2_MRESP_H,
         L2_ADDRESS   => L2_ADDRESS,
         L2_DATAOUT   => L2_DATAOUT,
         MREAD_L      => MREAD_L,
         MWRITE_L     => MWRITE_L
      );
   U_0 : AND2
      PORT MAP (
         A => D_MREAD_L,
         B => D_MWRITEL_L,
         F => D_Access
      );

END struct;
