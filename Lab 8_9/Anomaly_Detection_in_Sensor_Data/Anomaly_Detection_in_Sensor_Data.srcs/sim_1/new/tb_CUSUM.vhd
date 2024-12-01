----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2024 11:16:16 AM
-- Design Name: 
-- Module Name: tb_CUSUM - Behavioral
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

entity tb_CUSUM is
--  Port ( );
end tb_CUSUM;

architecture Behavioral of tb_CUSUM is

component CUSUM is
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
end component;

signal aclk : STD_LOGIC := '0';
signal aresetn : STD_LOGIC := '0';
signal s_axis_currentX_tvalid : STD_LOGIC := '0';
signal s_axis_currentX_tready : STD_LOGIC := '0';
signal s_axis_currentX_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_previousX_tvalid : STD_LOGIC := '0';
signal s_axis_previousX_tready : STD_LOGIC := '0';
signal s_axis_previousX_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_drift_tvalid : STD_LOGIC := '0';
signal s_axis_drift_tready : STD_LOGIC := '0';
signal s_axis_drift_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_threshold_tvalid : STD_LOGIC := '0';
signal s_axis_threshold_tready : STD_LOGIC := '0';
signal s_axis_threshold_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis_label_tvalid : STD_LOGIC := '0';
signal m_axis_label_tready : STD_LOGIC := '0';
signal m_axis_label_tdata : STD_LOGIC := '0';

constant T : TIME := 10ns;

begin

tb_CUSUM: CUSUM port map (
    aclk => aclk,
    aresetn => aresetn,
    s_axis_currentX_tvalid => s_axis_currentX_tvalid,
    s_axis_currentX_tready => s_axis_currentX_tready,
    s_axis_currentX_tdata => s_axis_currentX_tdata,
    s_axis_previousX_tvalid => s_axis_previousX_tvalid,
    s_axis_previousX_tready => s_axis_previousX_tready,
    s_axis_previousX_tdata => s_axis_previousX_tdata,
    s_axis_drift_tvalid => s_axis_drift_tvalid,
    s_axis_drift_tready => s_axis_drift_tready,
    s_axis_drift_tdata => s_axis_drift_tdata,
    s_axis_threshold_tvalid => s_axis_threshold_tvalid,
    s_axis_threshold_tready => s_axis_threshold_tready,
    s_axis_threshold_tdata => s_axis_threshold_tdata,
    m_axis_label_tvalid => m_axis_label_tvalid,
    m_axis_label_tready => m_axis_label_tready,
    m_axis_label_tdata => m_axis_label_tdata
);

process
begin
    aclk <= '1';
    wait for T / 2;
    aclk <= '0';
    wait for T / 2;
end process;

end Behavioral;
