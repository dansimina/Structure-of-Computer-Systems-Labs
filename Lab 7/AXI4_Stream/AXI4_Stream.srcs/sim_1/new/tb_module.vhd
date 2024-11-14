----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2024 01:29:22 PM
-- Design Name: 
-- Module Name: tb_module - Behavioral
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

entity tb_module is
--  Port ( );
end tb_module;

architecture Behavioral of tb_module is

component module is
    Port (
        aclk : IN STD_LOGIC;
        s_axis_val_tvalid : IN STD_LOGIC;
        s_axis_val_tready : OUT STD_LOGIC;
        s_axis_val_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_max_tvalid : IN STD_LOGIC;
        s_axis_max_tready : OUT STD_LOGIC;
        s_axis_max_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_min_tvalid : IN STD_LOGIC;
        s_axis_min_tready : OUT STD_LOGIC;
        s_axis_min_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_sum_tvalid : OUT STD_LOGIC;
        m_axis_sum_tready : IN STD_LOGIC;
        m_axis_sum_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
end component;

signal aclk : STD_LOGIC := '0';
signal s_axis_val_tvalid : STD_LOGIC := '0';
signal s_axis_val_tready : STD_LOGIC := '0';
signal s_axis_val_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal s_axis_max_tvalid : STD_LOGIC := '0';
signal s_axis_max_tready : STD_LOGIC := '0';
signal s_axis_max_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal s_axis_min_tvalid : STD_LOGIC := '0';
signal s_axis_min_tready : STD_LOGIC := '0';
signal s_axis_min_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
signal m_axis_sum_tvalid : STD_LOGIC := '0';
signal m_axis_sum_tready : STD_LOGIC := '0';
signal m_axis_sum_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

constant T : TIME := 10ns;

begin

    module_et: module port map(
        aclk => aclk,
        s_axis_val_tvalid => s_axis_val_tvalid,
        s_axis_val_tready => s_axis_val_tready,
        s_axis_val_tdata => s_axis_val_tdata,
        s_axis_max_tvalid => s_axis_max_tvalid,
        s_axis_max_tready => s_axis_max_tready,
        s_axis_max_tdata => s_axis_max_tdata,
        s_axis_min_tvalid => s_axis_min_tvalid,
        s_axis_min_tready => s_axis_min_tready,
        s_axis_min_tdata => s_axis_min_tdata,
        m_axis_sum_tvalid => m_axis_sum_tvalid,
        m_axis_sum_tready => m_axis_sum_tready,
        m_axis_sum_tdata => m_axis_sum_tdata
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
        s_axis_val_tvalid <= '1';
        s_axis_max_tvalid <= '1';
        s_axis_min_tvalid <= '1';
        
        s_axis_val_tdata <= std_logic_vector (TO_UNSIGNED (1, 32));
        s_axis_max_tdata <= std_logic_vector (TO_UNSIGNED (20, 32));
        s_axis_min_tdata <= std_logic_vector (TO_UNSIGNED (5, 32));
        
        wait for 2 * T;
        
        s_axis_val_tdata <= std_logic_vector (TO_UNSIGNED (5, 32));
        wait for 2 * T;
        
        s_axis_val_tdata <= std_logic_vector (TO_UNSIGNED (10, 32));
        wait for 2 * T;
        
        s_axis_val_tdata <= std_logic_vector (TO_UNSIGNED (15, 32));
        wait for 2 * T;
        
        s_axis_val_tdata <= std_logic_vector (TO_UNSIGNED (20, 32));
        wait for 2 * T;
        
        s_axis_val_tdata <= std_logic_vector (TO_UNSIGNED (25, 32));
        wait for 2 * T;
        
        wait;
        
    end process;

end Behavioral;
