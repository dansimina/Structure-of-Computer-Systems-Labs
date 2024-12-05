----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2024 10:24:56 PM
-- Design Name: 
-- Module Name: tb_broadcaster - Behavioral
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

entity tb_broadcaster is
--  Port ( );
end tb_broadcaster;

architecture Behavioral of tb_broadcaster is

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

signal aclk : STD_LOGIC := '0';
signal s_axis_tvalid : STD_LOGIC := '0';
signal s_axis_tready : STD_LOGIC := '0';
signal s_axis_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis1_tvalid : STD_LOGIC := '0';
signal m_axis1_tready : STD_LOGIC := '0';
signal m_axis1_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis2_tvalid : STD_LOGIC := '0';
signal m_axis2_tready : STD_LOGIC := '0';
signal m_axis2_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

constant T : TIME := 10ns;

begin
your_instance_name : broadcaster
  PORT MAP (
    aclk => aclk,
    s_axis_tvalid => s_axis_tvalid,
    s_axis_tready => s_axis_tready,
    s_axis_tdata => s_axis_tdata,
    m_axis1_tvalid => m_axis1_tvalid,
    m_axis1_tready => m_axis1_tready,
    m_axis1_tdata => m_axis1_tdata,
    m_axis2_tvalid => m_axis2_tvalid,
    m_axis2_tready => m_axis2_tready,
    m_axis2_tdata => m_axis2_tdata
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
        s_axis_tvalid <= '1';
        m_axis1_tready <= '1';
        m_axis2_tready <= '1';
        
        s_axis_tdata <= x"0000F0F0";
        wait for T * 2;
        
        m_axis2_tready <= '0';
        wait for T * 2;
        
        m_axis2_tready <= '1'; 
        s_axis_tdata <= x"A0A0A0A0";
        wait for T * 2;
        
        wait;
    
    end process;

end Behavioral;
