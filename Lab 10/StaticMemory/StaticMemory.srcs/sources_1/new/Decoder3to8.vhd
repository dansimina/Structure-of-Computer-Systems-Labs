----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2024 08:40:04 PM
-- Design Name: 
-- Module Name: Decoder3to8 - Behavioral
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

entity Decoder3to8 is
  Port ( 
    A: in std_logic_vector(2 downto 0);
    E1: in std_logic;
    E2: in std_logic;
    E3: in std_logic;
    O: out std_logic_vector (7 downto 0) 
  );
end Decoder3to8;

architecture Behavioral of Decoder3to8 is

begin
    
    process(A, E1, E2, E3)
    begin 
        if E1 = '0' and E2 = '0' and E3 = '1' then
            case A is
                when "000" => O <= "00000001";
                when "001" => O <= "00000010";
                when "010" => O <= "00000100";
                when "011" => O <= "00001000";
                when "100" => O <= "00010000";
                when "101" => O <= "00100000";                
                when "110" => O <= "01000000";
                when "111" => O <= "10000000";
                when others => O <= "00000000";
            end case;   
        else
            O <= "00000000";               
        end if;
    end process;
      

end Behavioral;
