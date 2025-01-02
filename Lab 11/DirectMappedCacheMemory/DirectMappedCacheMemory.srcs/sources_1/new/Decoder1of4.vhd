----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2024 01:20:32 PM
-- Design Name: 
-- Module Name: Decoder1of4 - Behavioral
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

entity Decoder1of4 is
  Port ( 
    sel: in std_logic_vector (1 downto 0);
    output: out std_logic_vector (3 downto 0)
  );
end Decoder1of4;

architecture Behavioral of Decoder1of4 is
begin
    process(sel)
    begin
        case sel is
            when "00" => output <= "1110";
            when "01" => output <= "1101";
            when "10" => output <= "1011";
            when "11" => output <= "0111";
            when others => output <= "1111";
        end case;
    end process;

end Behavioral;
