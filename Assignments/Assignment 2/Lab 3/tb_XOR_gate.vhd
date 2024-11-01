----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 12:56:08 PM
-- Design Name: 
-- Module Name: tb_XOR_gate - Behavioral
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

entity tb_XOR_gate is
--  Port ( );
end tb_XOR_gate;

architecture Behavioral of tb_XOR_gate is
component XOR_gate is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end component;
 constant T : time := 10 ns;
 signal a, b, x: std_logic := '0';
begin
    tb_XOR_gate: XOR_gate port map (
        a => a,
        b => b,
        x => x
    );
    
    process
    begin
        a <= '0';
        b <= '0';
        wait for T;
        a <= '1';
        b <= '0';
        wait for T;
        a <= '0';
        b <= '1';
        wait for T;
        a <= '1';
        b <= '1';
        wait;
    end process;
        
end Behavioral;
