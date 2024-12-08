----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2024 10:33:31 PM
-- Design Name: 
-- Module Name: SubModule - Behavioral
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

entity SubModule is
  Port ( 
    A: in std_logic_vector(16 downto 0);
    D: inout std_logic_vector(15 downto 0);
    WR : in std_logic;
    SEL : in std_logic;
    BHE : in std_logic
  );
end SubModule;

architecture Behavioral of SubModule is

component BasicMemory is
    Port(
        A: in std_logic_vector(15 downto 0);
        D: inout std_logic_vector(7 downto 0);
        CS : in std_logic;
        WR : in std_logic
    );
end component;

signal A1 : std_logic_vector(15 downto 0) := (others => '0');
signal D1 : std_logic_vector(7 downto 0) := (others => '0');
signal CS1 : std_logic := '1';
signal WR1 : std_logic := '1';

signal A2 : std_logic_vector(15 downto 0) := (others => '0');
signal D2 : std_logic_vector(7 downto 0) := (others => '0');
signal CS2 : std_logic := '1';
signal WR2 : std_logic := '1';

begin

    BasicMemory1: BasicMemory port map (
        A => A1,
        D => D1,
        CS => CS1,
        WR => WR1
    );
    
    BasicMemory2: BasicMemory port map (
        A => A2,
        D => D2,
        CS => CS2,
        WR => WR2
    );
    
    A1 <= A(16 downto 1);
    A2 <= A(16 downto 1);
    
    WR1 <= WR;
    WR2 <= WR;
    
    CS1 <= '0' when SEL = '0' and A(0) = '0' else '1';
    CS2 <= '0' when SEL = '0' and BHE = '0' else '1';
    
    D(7 downto 0) <= D1 when WR = '1' else (others => 'Z');
    D(15 downto 8) <= D2 when WR = '1' else (others => 'Z');
    
    D1 <= D(7 downto 0) when WR = '0' else (others => 'Z');
    D2 <= D(15 downto 8) when WR = '0' else (others => 'Z');
    
end Behavioral;
