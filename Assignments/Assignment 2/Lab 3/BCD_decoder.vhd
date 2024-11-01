----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 11:43:18 PM
-- Design Name: 
-- Module Name: BCD_decoder - Behavioral
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

entity BCD_decoder is
    port (a: in std_logic_vector (3 downto 0);
          y: out std_logic_vector (6 downto 0));
end BCD_decoder;

architecture Behavioral of BCD_decoder is

begin

    process(a)
    begin
        case a is
            when "0000" => y <= "1111110";
            when "0001" => y <= "0110000";
            when "0010" => y <= "1101101";
            when "0011" => y <= "1111001";
            when "0100" => y <= "0110011";
            when "0101" => y <= "1011011";
            when "0110" => y <= "1011111";
            when "0111" => y <= "1110000";
            when "1000" => y <= "1111111";
            when "1001" => y <= "1111011";
            when others => y <= "0000000";
        end case;
    end process;

end Behavioral;
