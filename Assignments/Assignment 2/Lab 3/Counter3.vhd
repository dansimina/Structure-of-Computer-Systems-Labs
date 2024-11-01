----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 09:34:22 PM
-- Design Name: 
-- Module Name: Counter3 - Behavioral
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
 use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter3 is
     port (clk: in std_logic;
     count: out std_logic_vector (2 downto 0));
end Counter3;

architecture Behavioral of Counter3 is
signal aux: std_logic_vector(2 downto 0) := (others => '0');
begin
    
    process(clk)
    begin
        if rising_edge(clk) then
            aux <= aux + 1;
        end if;
    end process;
    
    count <= aux;

end Behavioral;
