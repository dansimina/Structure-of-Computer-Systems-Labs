----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 01:36:53 PM
-- Design Name: 
-- Module Name: Register8 - Behavioral
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

entity Register8 is
    port (clk: in std_logic;
     ce: in std_logic;
     d: in std_logic_vector (7 downto 0);
     q: out std_logic_vector (7 downto 0));
     
end Register8;

architecture Behavioral of Register8 is

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                q <= d;
            end if;
        end if;
    end process;
end Behavioral;
