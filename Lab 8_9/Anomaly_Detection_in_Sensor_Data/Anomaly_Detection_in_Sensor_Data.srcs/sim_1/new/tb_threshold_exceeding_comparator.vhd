----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2024 07:08:22 PM
-- Design Name: 
-- Module Name: tb_threshold_exceeding_comparator - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_threshold_exceeding_comparator is
--  Port ( );
end tb_threshold_exceeding_comparator;

architecture Behavioral of tb_threshold_exceeding_comparator is

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

signal aclk : STD_LOGIC := '0';
signal s_axis_gtp_tvalid : STD_LOGIC := '0';
signal s_axis_gtp_tready : STD_LOGIC := '0';
signal s_axis_gtp_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_gtm_tvalid : STD_LOGIC := '0';
signal s_axis_gtm_tready : STD_LOGIC := '0';
signal s_axis_gtm_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_threshold_tvalid : STD_LOGIC := '0';
signal s_axis_threshold_tready : STD_LOGIC := '0';
signal s_axis_threshold_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis_gtpOut_tvalid : STD_LOGIC := '0';
signal m_axis_gtpOut_tready : STD_LOGIC := '0';
signal m_axis_gtpOut_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis_gtmOut_tvalid : STD_LOGIC := '0';
signal m_axis_gtmOut_tready : STD_LOGIC := '0';
signal m_axis_gtmOut_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis_result_tvalid : STD_LOGIC := '0';
signal m_axis_result_tready : STD_LOGIC := '0';
signal m_axis_result_tdata : STD_LOGIC  := '0'; 

constant T : TIME := 10ns;

begin

    tb_threshold_exceeding_comparator: threshold_exceeding_comparator port map(
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
        m_axis_result_tvalid => m_axis_result_tvalid,
        m_axis_result_tready => m_axis_result_tready,
        m_axis_result_tdata => m_axis_result_tdata
    );
    
    process
    begin
        aclk <= '1';
        wait for T / 2;
        aclk <= '0';
        wait for T / 2;
    end process;
    
    process
    begin
        s_axis_gtp_tvalid <= '1';
        s_axis_gtm_tvalid <= '1';
        s_axis_threshold_tvalid <= '1';
        
        m_axis_gtpOut_tready <= '1';
        m_axis_gtmOut_tready <= '1';
        m_axis_result_tready <= '1';
        
        s_axis_gtp_tdata <= std_logic_vector (TO_UNSIGNED (5, 32));
        s_axis_gtm_tdata <= std_logic_vector (TO_UNSIGNED (7, 32));
        s_axis_threshold_tdata <= std_logic_vector (TO_UNSIGNED (10, 32));
        wait for 2 * T;
        
        s_axis_gtp_tdata <= std_logic_vector (TO_UNSIGNED (12, 32));
        s_axis_gtm_tdata <= std_logic_vector (TO_UNSIGNED (7, 32));
        wait for 2 * T;
        
        s_axis_gtp_tdata <= std_logic_vector (TO_UNSIGNED (4, 32));
        s_axis_gtm_tdata <= std_logic_vector (TO_UNSIGNED (29, 32));
        wait for 2 * T;
        
        s_axis_gtp_tdata <= std_logic_vector (TO_UNSIGNED (12, 32));
        s_axis_gtm_tdata <= std_logic_vector (TO_UNSIGNED (17, 32));
        wait for 2 * T;
        
        s_axis_gtp_tdata <= std_logic_vector (TO_UNSIGNED (4, 32));
        s_axis_gtm_tdata <= std_logic_vector (TO_UNSIGNED (3, 32));
        wait for 2 * T;
        
        wait;
        
    end process;


end Behavioral;
