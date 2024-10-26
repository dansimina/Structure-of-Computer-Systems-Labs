----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 01:16:09 PM
-- Design Name: 
-- Module Name: CarryLookaheadAdder - Behavioral
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

entity CarryLookaheadAdder is
    Port ( c_in : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0);
           c_out : out STD_LOGIC);
end CarryLookaheadAdder;

architecture Behavioral of CarryLookaheadAdder is

component FullAdder is
    Port ( c_in : in STD_LOGIC;
           x : in STD_LOGIC;
           y : in STD_LOGIC;
           s : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

signal C0, C1, C2, C3, C4: std_logic := '0';

begin

    C0 <= c_in;
    FullAdder1: FullAdder port map (c_in => c_in, x => x(0), y => y(0), s => s(0));
    FullAdder2: FullAdder port map (c_in => C1, x => x(1), y => y(1), s => s(1));
    FullAdder3: FullAdder port map (c_in => C2, x => x(2), y => y(2), s => s(2));
    FullAdder4: FullAdder port map (c_in => C3, x => x(3), y => y(3), s => s(3));
    c_out <= C4;
    
    C1 <= (x(0) AND y(0)) OR ((x(0) OR y(0)) AND C0);
    C2 <= (x(1) AND y(1)) OR ((x(1) OR y(1)) AND ((x(0) AND y(0)) OR ((x(0) OR y(0)) AND C0)));
    C3 <= (x(2) AND y(2)) OR ((x(2) OR y(2)) AND ((x(1) AND y(1)) OR ((x(1) OR y(1)) AND ((x(0) AND y(0)) OR ((x(0) OR y(0)) AND C0)))));
    C4 <= (x(3) AND y(3)) OR ((x(3) OR y(3)) AND ((x(2) AND y(2)) OR ((x(2) OR y(2)) AND ((x(1) AND y(1)) OR ((x(1) OR y(1)) AND ((x(0) AND y(0)) OR ((x(0) OR y(0)) AND C0)))))));  
end Behavioral;
