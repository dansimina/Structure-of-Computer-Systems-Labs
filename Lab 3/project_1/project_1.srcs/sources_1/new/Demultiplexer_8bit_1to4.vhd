----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 11:23:13 PM
-- Design Name: 
-- Module Name: Demultiplexer_8bit_1to4 - Behavioral
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

entity Demultiplexer_8bit_1to4 is
    port (
        x: in std_logic_vector (7 downto 0);
        s: in std_logic_vector (1 downto 0);
        a, b, c, d: out std_logic_vector (7 downto 0));
end Demultiplexer_8bit_1to4;

architecture Behavioral of Demultiplexer_8bit_1to4 is
    
begin
    
    process(x, s) 
    begin
        case s is
            when "00" => a <= x;              
            when "01" => b <= x;         
            when "10" => c <= x;
            when others => d <= x;
        end case;
    end process;

end Behavioral;
