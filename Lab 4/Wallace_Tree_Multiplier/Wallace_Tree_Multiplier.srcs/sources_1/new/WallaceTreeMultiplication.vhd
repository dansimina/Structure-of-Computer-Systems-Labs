----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2024 02:55:26 PM
-- Design Name: 
-- Module Name: WallaceTreeMultiplication - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WallaceTreeMultiplication is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           p : out STD_LOGIC_VECTOR (7 downto 0));
end WallaceTreeMultiplication;

architecture Behavioral of WallaceTreeMultiplication is

component CarrySaveAdder is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           z : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component CarryLookaheadAdder is
    Port ( c_in : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0);
           c_out : out STD_LOGIC);
end component;

signal xy0, xy1, xy2, xy3: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal s1, s2: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal c1, c2: STD_LOGIC_VECTOR (8 downto 0) := "000000000";
signal c: std_logic := '0';
begin
    
    xy0 <= "0000" & x when y(0) = '1';
    xy1 <= "000" & x & "0" when y(1) = '1';
    xy2 <= "00" & x & "00" when y(2) = '1';
    xy3 <= "0" & x & "000" when y(3) = '1';
    
    CarrySaveAdder1: CarrySaveAdder port map(
        x => xy0,
        y => xy1,
        z => xy2,
        s => s1,
        c => c1
    );
    
    CarrySaveAdder2: CarrySaveAdder port map(
        x => xy3,
        y => s1,
        z => c1(7 downto 0),
        s => s2,
        c => c2
    );
    
    CarryLookaheadAdder1: CarryLookaheadAdder port map (
        c_in => '0',
        x => s2(3 downto 0),
        y => c2(3 downto 0),
        s => p(3 downto 0),
        c_out => c
    );
    
    CarryLookaheadAdder2: CarryLookaheadAdder port map (
        c_in => c,
        x => s2(7 downto 4),
        y => c2(7 downto 4),
        s => p(7 downto 4)
    );    

end Behavioral;
