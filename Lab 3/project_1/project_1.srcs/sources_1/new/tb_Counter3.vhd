----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 09:47:46 PM
-- Design Name: 
-- Module Name: tb_Counter3 - Behavioral
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

entity tb_Counter3 is
--  Port ( );
end tb_Counter3;

architecture Behavioral of tb_Counter3 is

component Counter3 is
     port (clk: in std_logic;
     count: out std_logic_vector (2 downto 0));
end component;

constant T: time := 10ns;
signal clk: std_logic := '0';
signal count: std_logic_vector(2 downto 0) := (others => '0');

begin
    
    tb_Counter3: Counter3 port map (
        clk => clk,
        count => count
    );
    
    process
    begin
        clk <= '1';
        wait for T / 2;
        clk <= '0';
        wait for T / 2;
    end process;

end Behavioral;
