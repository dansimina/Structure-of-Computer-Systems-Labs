----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 01:10:17 PM
-- Design Name: 
-- Module Name: FullAdder - Behavioral
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

entity FullAdder is
    Port ( c_in : in STD_LOGIC;
           x : in STD_LOGIC;
           y : in STD_LOGIC;
           s : out STD_LOGIC;
           c_out : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

begin
    s <= x xor y xor c_in;
    c_out <= (x and y) or ((x or y) and c_in);

end Behavioral;
