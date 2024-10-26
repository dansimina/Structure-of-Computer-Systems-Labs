----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 10:51:05 PM
-- Design Name: 
-- Module Name: CarrySaveAdder - Behavioral
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

entity CarrySaveAdder is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           z : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (8 downto 0));
end CarrySaveAdder;

architecture Behavioral of CarrySaveAdder is

begin
    s(0) <= x(0) xor y(0) xor z(0);
    s(1) <= x(1) xor y(1) xor z(1);
    s(2) <= x(2) xor y(2) xor z(2);
    s(3) <= x(3) xor y(3) xor z(3);
    s(4) <= x(4) xor y(4) xor z(4);
    s(5) <= x(5) xor y(5) xor z(5);
    s(6) <= x(6) xor y(6) xor z(6);
    s(7) <= x(7) xor y(7) xor z(7);
    
    c(0) <= '0';
    c(1) <= (x(0) and y(0)) or (y(0) and z(0)) or (z(0) and x(0));
    c(2) <= (x(1) and y(1)) or (y(1) and z(1)) or (z(1) and x(1));
    c(3) <= (x(2) and y(2)) or (y(2) and z(2)) or (z(2) and x(2));
    c(4) <= (x(3) and y(3)) or (y(3) and z(3)) or (z(3) and x(3));
    c(5) <= (x(4) and y(4)) or (y(4) and z(4)) or (z(4) and x(4));
    c(6) <= (x(5) and y(5)) or (y(5) and z(5)) or (z(5) and x(5));
    c(7) <= (x(6) and y(6)) or (y(6) and z(6)) or (z(6) and x(6));
    c(8) <= (x(7) and y(7)) or (y(7) and z(7)) or (z(7) and x(7));

end Behavioral;
