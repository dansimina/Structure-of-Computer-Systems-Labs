----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2024 01:43:39 PM
-- Design Name: 
-- Module Name: CMP - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CMP is
  Port ( 
    input1: in std_logic_vector(7 downto 0);
    input2: in std_logic_vector(7 downto 0);
    result: out std_logic
  );
end CMP;

architecture Behavioral of CMP is

begin

    result <= '1' when input1 = input2 else '0';

end Behavioral;
