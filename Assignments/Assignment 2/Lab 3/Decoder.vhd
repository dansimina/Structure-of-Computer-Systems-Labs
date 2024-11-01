----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 10:43:52 PM
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

entity Decoder is
    port (a: in std_logic_vector (2 downto 0);
          y: out std_logic_vector (7 downto 0));
end Decoder;

architecture Behavioral of Decoder is

begin
    with a select y <= "00000001" when "000",
                       "00000010" when "001",
                       "00000100" when "010",
                       "00001000" when "011",
                       "00010000" when "100",
                       "00100000" when "101",
                       "01000000" when "110",
                       "10000000" when others;

end Behavioral;
