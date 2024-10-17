----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 01:40:53 PM
-- Design Name: 
-- Module Name: tb_Register8 - Behavioral
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

entity tb_Register8 is
--  Port ( );
end tb_Register8;

architecture Behavioral of tb_Register8 is
    component Register8 is
    port (clk: in std_logic;
         ce: in std_logic;
         d: in std_logic_vector (7 downto 0);
         q: out std_logic_vector (7 downto 0));
         
    end component;
    
    constant T: time := 10ns;
    signal clk, ce: std_logic := '0';
    signal d, q: std_logic_vector (7 downto 0) := (others => '0');
    
begin

    tb_Register8: Register8 port map (
        clk => clk,
        ce => ce,
        d => d,
        q => q
    );
    
    process
    begin
        clk <= '1';
        wait for T / 2;
        clk <= '0';
        wait for T / 2;
    end process;
    
    process
    begin
        d <= x"FF";
        wait for 2 * T;
        d <= x"0F";
        wait for 2 * T;
        d <= x"F0";
        wait for 2 * T;
        d <= x"00";
        wait for 2 * T;
        
        wait;
    end process;
    
end Behavioral;
