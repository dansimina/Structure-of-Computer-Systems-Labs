----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2024 01:35:03 PM
-- Design Name: 
-- Module Name: BasicMemory - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BasicMemory is
    Port(
        A: in std_logic_vector(15 downto 0);
        D: inout std_logic_vector(8 downto 0);
        CS : in std_logic;
        WR : in std_logic
    );
end BasicMemory;

architecture Behavioral of BasicMemory is

type MemoryType is array (0 to 65535) of std_logic_vector(7 downto 0);
signal memory: MemoryType := (others => "00000000");

begin
    
    D <= memory(TO_INTEGER (unsigned(A))) when CS = '0' else "ZZZZZZZZ";
    memory(TO_INTEGER (unsigned(A))) <= D when CS = '0' and WR = '0';

end Behavioral;
