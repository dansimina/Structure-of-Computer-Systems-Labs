----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2024 08:26:49 PM
-- Design Name: 
-- Module Name: CUSUM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CUSUM is
    Port (
         aclk : IN STD_LOGIC;
         aresetn : IN STD_LOGIC;
         s_axis_currentX_tvalid : IN STD_LOGIC;
         s_axis_currentX_tready : OUT STD_LOGIC;
         s_axis_currentX_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_previousX_tvalid : IN STD_LOGIC;
         s_axis_previousX_tready : OUT STD_LOGIC;
         s_axis_previousX_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_drift_tvalid : IN STD_LOGIC;
         s_axis_drift_tready : OUT STD_LOGIC;
         s_axis_drift_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_threshold_tvalid : IN STD_LOGIC;
         s_axis_threshold_tready : OUT STD_LOGIC;
         s_axis_threshold_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_label_tvalid : OUT STD_LOGIC;
         m_axis_label_tready : IN STD_LOGIC;
         m_axis_label_tdata : OUT STD_LOGIC
    );
end CUSUM;

architecture Behavioral of CUSUM is

component adder is
    Port (
         aclk : IN STD_LOGIC;
         s_axis_a_tvalid : IN STD_LOGIC;
         s_axis_a_tready : OUT STD_LOGIC;
         s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_b_tvalid : IN STD_LOGIC;
         s_axis_b_tready : OUT STD_LOGIC;
         s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_result_tvalid : OUT STD_LOGIC;
         m_axis_result_tready : IN STD_LOGIC;
         m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)     
    );
end component;

component subtractor is
    Port (
         aclk : IN STD_LOGIC;
         s_axis_a_tvalid : IN STD_LOGIC;
         s_axis_a_tready : OUT STD_LOGIC;
         s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_b_tvalid : IN STD_LOGIC;
         s_axis_b_tready : OUT STD_LOGIC;
         s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_result_tvalid : OUT STD_LOGIC;
         m_axis_result_tready : IN STD_LOGIC;
         m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)     
    );
end component;

component max is
    Port (
         aclk : IN STD_LOGIC;
         s_axis_a_tvalid : IN STD_LOGIC;
         s_axis_a_tready : OUT STD_LOGIC;
         s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_b_tvalid : IN STD_LOGIC;
         s_axis_b_tready : OUT STD_LOGIC;
         s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_result_tvalid : OUT STD_LOGIC;
         m_axis_result_tready : IN STD_LOGIC;
         m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)     
    );
end component;

component threshold_exceeding_comparator is
    Port (
         aclk : IN STD_LOGIC;
         s_axis_gtp_tvalid : IN STD_LOGIC;
         s_axis_gtp_tready : OUT STD_LOGIC;
         s_axis_gtp_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_gtm_tvalid : IN STD_LOGIC;
         s_axis_gtm_tready : OUT STD_LOGIC;
         s_axis_gtm_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_threshold_tvalid : IN STD_LOGIC;
         s_axis_threshold_tready : OUT STD_LOGIC;
         s_axis_threshold_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_gtpOut_tvalid : OUT STD_LOGIC;
         m_axis_gtpOut_tready : IN STD_LOGIC;
         m_axis_gtpOut_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_gtmOut_tvalid : OUT STD_LOGIC;
         m_axis_gtmOut_tready : IN STD_LOGIC;
         m_axis_gtmOut_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_result_tvalid : OUT STD_LOGIC;
         m_axis_result_tready : IN STD_LOGIC;
         m_axis_result_tdata : OUT STD_LOGIC     
    );
end component;

COMPONENT fifo
  PORT (
    s_axis_aresetn : IN STD_LOGIC;
    s_axis_aclk : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;

COMPONENT broadcaster
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis1_tvalid : OUT STD_LOGIC;
    m_axis1_tready : IN STD_LOGIC;
    m_axis1_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
    m_axis2_tvalid : OUT STD_LOGIC;
    m_axis2_tready : IN STD_LOGIC;
    m_axis2_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;


--adder
signal s_axis_aADD_tvalid : STD_LOGIC := '0';
signal s_axis_aADD_tready : STD_LOGIC := '0';
signal s_axis_aADD_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal s_axis_bADD_tvalid : STD_LOGIC := '0';
signal s_axis_bADD_tready : STD_LOGIC := '0';
signal s_axis_bADD_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal m_axis_resultADD_tvalid : STD_LOGIC := '0';
signal m_axis_resultADD_tready : STD_LOGIC := '0';
signal m_axis_resultADD_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

--subtractor 1
signal s_axis_aSUB1_tvalid : STD_LOGIC := '0';
signal s_axis_aSUB1_tready : STD_LOGIC := '0';
signal s_axis_aSUB1_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal s_axis_bSUB1_tvalid : STD_LOGIC := '0';
signal s_axis_bSUB1_tready : STD_LOGIC := '0';
signal s_axis_bSUB1_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal m_axis_resultSUB1_tvalid : STD_LOGIC := '0';
signal m_axis_resultSUB1_tready : STD_LOGIC := '0';
signal m_axis_resultSUB1_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

--subtractor 2
signal s_axis_aSUB2_tvalid : STD_LOGIC := '0';
signal s_axis_aSUB2_tready : STD_LOGIC := '0';
signal s_axis_aSUB2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal s_axis_bSUB2_tvalid : STD_LOGIC := '0';
signal s_axis_bSUB2_tready : STD_LOGIC := '0';
signal s_axis_bSUB2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal m_axis_resultSUB2_tvalid : STD_LOGIC := '0';
signal m_axis_resultSUB2_tready : STD_LOGIC := '0';
signal m_axis_resultSUB2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

--subtractor 3
signal s_axis_aSUB3_tvalid : STD_LOGIC := '0';
signal s_axis_aSUB3_tready : STD_LOGIC := '0';
signal s_axis_aSUB3_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal s_axis_bSUB3_tvalid : STD_LOGIC := '0';
signal s_axis_bSUB3_tready : STD_LOGIC := '0';
signal s_axis_bSUB3_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal m_axis_resultSUB3_tvalid : STD_LOGIC := '0';
signal m_axis_resultSUB3_tready : STD_LOGIC := '0';
signal m_axis_resultSUB3_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

--subtractor 4
signal s_axis_aSUB4_tvalid : STD_LOGIC := '0';
signal s_axis_aSUB4_tready : STD_LOGIC := '0';
signal s_axis_aSUB4_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal s_axis_bSUB4_tvalid : STD_LOGIC := '0';
signal s_axis_bSUB4_tready : STD_LOGIC := '0';
signal s_axis_bSUB4_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal m_axis_resultSUB4_tvalid : STD_LOGIC := '0';
signal m_axis_resultSUB4_tready : STD_LOGIC := '0';
signal m_axis_resultSUB4_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

--max 1
signal s_axis_aMAX1_tvalid : STD_LOGIC := '0';
signal s_axis_aMAX1_tready : STD_LOGIC := '0';
signal s_axis_aMAX1_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal s_axis_bMAX1_tvalid : STD_LOGIC := '1';
signal s_axis_bMAX1_tready : STD_LOGIC := '0';
signal s_axis_bMAX1_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal m_axis_resultMAX1_tvalid : STD_LOGIC := '0';
signal m_axis_resultMAX1_tready : STD_LOGIC := '0';
signal m_axis_resultMAX1_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

--max 2
signal s_axis_aMAX2_tvalid : STD_LOGIC := '0';
signal s_axis_aMAX2_tready : STD_LOGIC := '0';
signal s_axis_aMAX2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal s_axis_bMAX2_tvalid : STD_LOGIC := '1';
signal s_axis_bMAX2_tready : STD_LOGIC := '0';
signal s_axis_bMAX2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal m_axis_resultMAX2_tvalid : STD_LOGIC := '0';
signal m_axis_resultMAX2_tready : STD_LOGIC := '0';
signal m_axis_resultMAX2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

--broadcaster
signal s_axisBroadcaster_tvalid : STD_LOGIC := '0';
signal s_axisBroadcaster_tready : STD_LOGIC := '0';
signal s_axisBroadcaster_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axisBroadcaster1_tvalid : STD_LOGIC := '0';
signal m_axisBroadcaster1_tready : STD_LOGIC := '0';
signal m_axisBroadcaster1_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axisBroadcaster2_tvalid : STD_LOGIC := '0';
signal m_axisBroadcaster2_tready : STD_LOGIC := '0';
signal m_axisBroadcaster2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--threshold exceeding comparator
signal s_axis_gtp_tvalid : STD_LOGIC := '0';
signal s_axis_gtp_tready : STD_LOGIC := '0';
signal s_axis_gtp_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_gtm_tvalid : STD_LOGIC := '0';
signal s_axis_gtm_tready : STD_LOGIC := '0';
signal s_axis_gtm_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
--signal s_axis_threshold_tvalid : STD_LOGIC := '0';
--signal s_axis_threshold_tready : STD_LOGIC := '0';
--signal s_axis_threshold_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis_gtpOut_tvalid : STD_LOGIC := '0';
signal m_axis_gtpOut_tready : STD_LOGIC := '0';
signal m_axis_gtpOut_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis_gtmOut_tvalid : STD_LOGIC := '0';
signal m_axis_gtmOut_tready : STD_LOGIC := '0';
signal m_axis_gtmOut_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis_result_tvalid : STD_LOGIC := '0';
signal m_axis_result_tready : STD_LOGIC := '0';
signal m_axis_result_tdata : STD_LOGIC  := '0'; 

begin

fifo1 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => s_axis_currentX_tvalid,
        s_axis_tready => s_axis_currentX_tready,
        s_axis_tdata => s_axis_currentX_tdata,
        m_axis_tvalid => s_axis_aSUB1_tvalid,
        m_axis_tready => s_axis_aSUB1_tready,
        m_axis_tdata => s_axis_aSUB1_tdata
      );

fifo2 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => s_axis_previousX_tvalid,
        s_axis_tready => s_axis_previousX_tready,
        s_axis_tdata => s_axis_previousX_tdata,
        m_axis_tvalid => s_axis_bSUB1_tvalid,
        m_axis_tready => s_axis_bSUB1_tready,
        m_axis_tdata =>s_axis_bSUB1_tdata
      );
  
subtractor1 : subtractor 
    PORT MAP (
        aclk => aclk,
        s_axis_a_tvalid => s_axis_aSUB1_tvalid,
        s_axis_a_tready => s_axis_aSUB1_tready,
        s_axis_a_tdata => s_axis_aSUB1_tdata,
        s_axis_b_tvalid => s_axis_bSUB1_tvalid,
        s_axis_b_tready => s_axis_bSUB1_tready,
        s_axis_b_tdata => s_axis_bSUB1_tdata,
        m_axis_result_tvalid => m_axis_resultSUB1_tvalid,
        m_axis_result_tready =>  m_axis_resultSUB1_tready,
        m_axis_result_tdata => m_axis_resultSUB1_tdata
    );

fifo3 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => m_axis_resultSUB1_tvalid,
        s_axis_tready => m_axis_resultSUB1_tready,
        s_axis_tdata => m_axis_resultSUB1_tdata,
        m_axis_tvalid => s_axisBroadcaster_tvalid,
        m_axis_tready => s_axisBroadcaster_tready,
        m_axis_tdata => s_axisBroadcaster_tdata
      );

broadcaster1 : broadcaster
      PORT MAP (
        aclk => aclk,
        s_axis_tvalid => s_axisBroadcaster_tvalid,
        s_axis_tready => s_axisBroadcaster_tready,
        s_axis_tdata => s_axisBroadcaster_tdata,
        m_axis1_tvalid => m_axisBroadcaster1_tvalid,
        m_axis1_tready => m_axisBroadcaster1_tready,
        m_axis1_tdata => m_axisBroadcaster1_tdata,
        m_axis2_tvalid => m_axisBroadcaster2_tvalid,
        m_axis2_tready => m_axisBroadcaster2_tready,
        m_axis2_tdata => m_axisBroadcaster2_tdata
      );
  
adder1 : adder 
    PORT MAP (
        aclk => aclk,
        s_axis_a_tvalid => s_axis_aADD_tvalid,
        s_axis_a_tready => s_axis_aADD_tready,
        s_axis_a_tdata => s_axis_aADD_tdata,
        s_axis_b_tvalid =>  m_axisBroadcaster1_tvalid,
        s_axis_b_tready =>  m_axisBroadcaster1_tready,
        s_axis_b_tdata =>  m_axisBroadcaster1_tdata,
        m_axis_result_tvalid => m_axis_resultADD_tvalid,
        m_axis_result_tready => m_axis_resultADD_tready,
        m_axis_result_tdata => m_axis_resultADD_tdata
    );

subtractor2 : subtractor 
    PORT MAP (
        aclk => aclk,
        s_axis_a_tvalid => m_axisBroadcaster2_tvalid,
        s_axis_a_tready => m_axisBroadcaster2_tready,
        s_axis_a_tdata => m_axisBroadcaster2_tdata,
        s_axis_b_tvalid => s_axis_bSUB2_tvalid,
        s_axis_b_tready => s_axis_bSUB2_tready,
        s_axis_b_tdata => s_axis_bSUB2_tdata,
        m_axis_result_tvalid => m_axis_resultSUB2_tvalid,
        m_axis_result_tready => m_axis_resultSUB2_tready,
        m_axis_result_tdata => m_axis_resultSUB2_tdata
    );
    
fifo4 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => m_axis_resultADD_tvalid,
        s_axis_tready => m_axis_resultADD_tready,
        s_axis_tdata => m_axis_resultADD_tdata,
        m_axis_tvalid => s_axis_aSUB3_tvalid,
        m_axis_tready => s_axis_aSUB3_tready,
        m_axis_tdata => s_axis_aSUB3_tdata
      );
    
fifo5 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => m_axis_resultSUB2_tvalid,
        s_axis_tready => m_axis_resultSUB2_tready,
        s_axis_tdata => m_axis_resultSUB2_tdata,
        m_axis_tvalid => s_axis_aSUB4_tvalid,
        m_axis_tready => s_axis_aSUB4_tready,
        m_axis_tdata => s_axis_aSUB4_tdata
      );
      
subtractor3 : subtractor 
    PORT MAP (
        aclk => aclk,
        s_axis_a_tvalid => s_axis_aSUB3_tvalid,
        s_axis_a_tready => s_axis_aSUB3_tready,
        s_axis_a_tdata => s_axis_aSUB3_tdata,
        s_axis_b_tvalid => s_axis_drift_tvalid,
        s_axis_b_tready => s_axis_drift_tready,
        s_axis_b_tdata => s_axis_drift_tdata,
        m_axis_result_tvalid => m_axis_resultSUB3_tvalid,
        m_axis_result_tready => m_axis_resultSUB3_tready,
        m_axis_result_tdata => m_axis_resultSUB3_tdata
    );
    
subtractor4 : subtractor 
    PORT MAP (
        aclk => aclk,
        s_axis_a_tvalid => s_axis_aSUB4_tvalid,
        s_axis_a_tready => s_axis_aSUB4_tready,
        s_axis_a_tdata => s_axis_aSUB4_tdata,
        s_axis_b_tvalid => s_axis_drift_tvalid,
        s_axis_b_tready => s_axis_drift_tready,
        s_axis_b_tdata => s_axis_drift_tdata,
        m_axis_result_tvalid => m_axis_resultSUB4_tvalid,
        m_axis_result_tready => m_axis_resultSUB4_tready,
        m_axis_result_tdata => m_axis_resultSUB4_tdata
    );
    
fifo6 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => m_axis_resultSUB3_tvalid,
        s_axis_tready => m_axis_resultSUB3_tready,
        s_axis_tdata => m_axis_resultSUB3_tdata,
        m_axis_tvalid => s_axis_aMAX1_tvalid,
        m_axis_tready => s_axis_aMAX1_tready,
        m_axis_tdata => s_axis_aMAX1_tdata
      );
      
fifo7 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => m_axis_resultSUB4_tvalid,
        s_axis_tready => m_axis_resultSUB4_tready,
        s_axis_tdata => m_axis_resultSUB4_tdata,
        m_axis_tvalid => s_axis_aMAX2_tvalid,
        m_axis_tready => s_axis_aMAX2_tready,
        m_axis_tdata => s_axis_aMAX2_tdata
      );
      
max1 : max port map (
        aclk => aclk,
        s_axis_a_tvalid => s_axis_aMAX1_tvalid,
        s_axis_a_tready => s_axis_aMAX1_tready,
        s_axis_a_tdata => s_axis_aMAX1_tdata,
        s_axis_b_tvalid => s_axis_bMAX1_tvalid,
        s_axis_b_tready => s_axis_bMAX1_tready,
        s_axis_b_tdata => s_axis_bMAX1_tdata,
        m_axis_result_tvalid => m_axis_resultMAX1_tvalid,
        m_axis_result_tready => m_axis_resultMAX1_tready,
        m_axis_result_tdata => m_axis_resultMAX1_tdata
    );
    
max2 : max port map (
        aclk => aclk,
        s_axis_a_tvalid => s_axis_aMAX2_tvalid,
        s_axis_a_tready => s_axis_aMAX2_tready,
        s_axis_a_tdata => s_axis_aMAX2_tdata,
        s_axis_b_tvalid => s_axis_bMAX2_tvalid,
        s_axis_b_tready => s_axis_bMAX2_tready,
        s_axis_b_tdata => s_axis_bMAX2_tdata,
        m_axis_result_tvalid => m_axis_resultMAX2_tvalid,
        m_axis_result_tready => m_axis_resultMAX2_tready,
        m_axis_result_tdata => m_axis_resultMAX2_tdata
    );
    
fifo8 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => m_axis_resultMAX1_tvalid,
        s_axis_tready => m_axis_resultMAX1_tready,
        s_axis_tdata => m_axis_resultMAX1_tdata,
        m_axis_tvalid => s_axis_gtp_tvalid,
        m_axis_tready => s_axis_gtp_tready,
        m_axis_tdata => s_axis_gtp_tdata
      );
      
fifo9 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => m_axis_resultMAX2_tvalid,
        s_axis_tready => m_axis_resultMAX2_tready,
        s_axis_tdata => m_axis_resultMAX2_tdata,
        m_axis_tvalid => s_axis_gtm_tvalid,
        m_axis_tready => s_axis_gtm_tready,
        m_axis_tdata => s_axis_gtm_tdata
      );
      
threshold_exceeding_comparator1 : threshold_exceeding_comparator port map(
        aclk => aclk,
        s_axis_gtp_tvalid => s_axis_gtp_tvalid,
        s_axis_gtp_tready => s_axis_gtp_tready,
        s_axis_gtp_tdata => s_axis_gtp_tdata,
        s_axis_gtm_tvalid => s_axis_gtm_tvalid,
        s_axis_gtm_tready => s_axis_gtm_tready,
        s_axis_gtm_tdata => s_axis_gtm_tdata,
        s_axis_threshold_tvalid => s_axis_threshold_tvalid,
        s_axis_threshold_tready => s_axis_threshold_tready,
        s_axis_threshold_tdata => s_axis_threshold_tdata,
        m_axis_gtpOut_tvalid => m_axis_gtpOut_tvalid,
        m_axis_gtpOut_tready => m_axis_gtpOut_tready,
        m_axis_gtpOut_tdata => m_axis_gtpOut_tdata,
        m_axis_gtmOut_tvalid => m_axis_gtmOut_tvalid,
        m_axis_gtmOut_tready => m_axis_gtmOut_tready,
        m_axis_gtmOut_tdata => m_axis_gtmOut_tdata,
        m_axis_result_tvalid => m_axis_label_tvalid,
        m_axis_result_tready => m_axis_label_tready,
        m_axis_result_tdata => m_axis_label_tdata
    );
        
fifo10 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid =>  m_axis_gtpOut_tvalid,
        s_axis_tready =>  m_axis_gtpOut_tready,
        s_axis_tdata =>  m_axis_gtpOut_tdata,
        m_axis_tvalid => s_axis_aADD_tvalid,
        m_axis_tready => s_axis_aADD_tready,
        m_axis_tdata => s_axis_aADD_tdata
      );
      
fifo11 : fifo
      PORT MAP (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid =>  m_axis_gtmOut_tvalid,
        s_axis_tready =>  m_axis_gtmOut_tready,
        s_axis_tdata =>  m_axis_gtmOut_tdata,
        m_axis_tvalid => s_axis_bSUB2_tvalid,
        m_axis_tready => s_axis_bSUB2_tready,
        m_axis_tdata => s_axis_bSUB2_tdata
      );
      
end Behavioral;
