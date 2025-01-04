----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2024 09:37:02 PM
-- Design Name: 
-- Module Name: tb_BasicMemory - Behavioral
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

entity tb_BasicMemory is
--  Port ( );
end tb_BasicMemory;

architecture Behavioral of tb_BasicMemory is

component BasicMemory is
    Port(
        A: in std_logic_vector(15 downto 0);
        D: inout std_logic_vector(7 downto 0);
        CS : in std_logic;
        WR : in std_logic
    );
end component;

signal A : std_logic_vector(15 downto 0) := (others => '0');
signal D: std_logic_vector(7 downto 0) := (others => '0');
signal CS : std_logic := '1';
signal WR : std_logic := '1';

constant T : time := 5ns;

begin

    tb_BasicMemory: BasicMemory port map (
        A => A,
        D => D,
        CS => CS,
        WR => WR
    );
    
    process
    begin
        wait for T;
        CS <= '0';
        wait for T;
        
        WR <= '0';
        A <= x"0001";
        D <= x"AA";
        wait for T;
        
        A <= x"0002";
        D <= x"BB";
        wait for T;
        
        A <= x"0003";
        D <= x"CC";
        wait for T;
        
        WR <= '1';
        D <= "ZZZZZZZZ";
        A <= x"0002";
        wait for T;
        
        A <= x"0001";
        wait for T;
        
        WR <= '0';
        A <= x"0002";
        D <= x"DD";
        wait for T;
        
        WR <= '1';
        D <= "ZZZZZZZZ";
        A <= x"0003";
        wait for T;
        
        A <= x"0002";
        wait for T;
        
        CS <= '1';
        wait;
        
    end process;

end Behavioral;
