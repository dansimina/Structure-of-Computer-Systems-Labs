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
         m_axis_label_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)     
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
    aresetn : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axis_tready : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0) 
  );
END COMPONENT;

--fifo 0
signal m_axis0_tvalid : STD_LOGIC := '0';
signal m_axis0_tready : STD_LOGIC := '0';
signal m_axis0_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 1
signal m_axis1_tvalid : STD_LOGIC := '0';
signal m_axis1_tready : STD_LOGIC := '0';
signal m_axis1_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 2
signal s_axis2_tvalid : STD_LOGIC := '0';
signal s_axis2_tready : STD_LOGIC := '0';
signal s_axis2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis2_tvalid : STD_LOGIC := '0';
signal m_axis2_tready : STD_LOGIC := '0';
signal m_axis2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 3
signal s_axis3_tvalid : STD_LOGIC := '0';
signal s_axis3_tready : STD_LOGIC := '0';
signal s_axis3_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis3_tvalid : STD_LOGIC := '0';
signal m_axis3_tready : STD_LOGIC := '0';
signal m_axis3_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 4
signal s_axis4_tvalid : STD_LOGIC := '0';
signal s_axis4_tready : STD_LOGIC := '0';
signal s_axis4_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis4_tvalid : STD_LOGIC := '0';
signal m_axis4_tready : STD_LOGIC := '0';
signal m_axis4_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 5
signal s_axis5_tvalid : STD_LOGIC := '0';
signal s_axis5_tready : STD_LOGIC := '0';
signal s_axis5_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis5_tvalid : STD_LOGIC := '0';
signal m_axis5_tready : STD_LOGIC := '0';
signal m_axis5_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 6
signal s_axis6_tvalid : STD_LOGIC := '0';
signal s_axis6_tready : STD_LOGIC := '0';
signal s_axis6_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis6_tvalid : STD_LOGIC := '0';
signal m_axis6_tready : STD_LOGIC := '0';
signal m_axis6_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 7
signal s_axis7_tvalid : STD_LOGIC := '0';
signal s_axis7_tready : STD_LOGIC := '0';
signal s_axis7_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis7_tvalid : STD_LOGIC := '0';
signal m_axis7_tready : STD_LOGIC := '0';
signal m_axis7_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 8
signal s_axis8_tvalid : STD_LOGIC := '0';
signal s_axis8_tready : STD_LOGIC := '0';
signal s_axis8_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis8_tvalid : STD_LOGIC := '0';
signal m_axis8_tready : STD_LOGIC := '0';
signal m_axis8_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 9
signal s_axis9_tvalid : STD_LOGIC := '0';
signal s_axis9_tready : STD_LOGIC := '0';
signal s_axis9_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis9_tvalid : STD_LOGIC := '0';
signal m_axis9_tready : STD_LOGIC := '0';
signal m_axis9_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

--fifo 10
signal s_axis10_tvalid : STD_LOGIC := '0';
signal s_axis10_tready : STD_LOGIC := '0';
signal s_axis10_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis10_tvalid : STD_LOGIC := '0';
signal m_axis10_tready : STD_LOGIC := '0';
signal m_axis10_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

begin


end Behavioral;
