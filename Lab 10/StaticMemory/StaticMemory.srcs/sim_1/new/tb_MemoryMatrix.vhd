----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2024 09:55:54 PM
-- Design Name: 
-- Module Name: tb_MemoryMatrix - Behavioral
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

entity tb_MemoryMatrix is
--  Port ( );
end tb_MemoryMatrix;

architecture Behavioral of tb_MemoryMatrix is

component MemoryMatrix is
  Port ( 
    A: in std_logic_vector(16 downto 0);
    WR : in std_logic;
    BHE : in std_logic;
    SEL: in std_logic_vector (7 downto 0);
    D: inout std_logic_vector(15 downto 0)
  );
end component;

signal A: std_logic_vector(16 downto 0) := (others => '0');
signal WR : std_logic := '0';
signal BHE : std_logic := '0';
signal SEL: std_logic_vector (7 downto 0) := (others => '0');
signal D: std_logic_vector(15 downto 0) := (others => '0');

constant T : time := 5ns;

begin

    tb_MemoryMatrix: MemoryMatrix port map (
        A => A,
        WR => WR,
        BHE => BHE,
        SEL => SEL,
        D => D
    );
    
    process
    begin
        WR <= '0';
        SEL <= "11111110";
        A <= "00000000000000010";
        D <= x"AABB";
        wait for T;
        
        WR <= '0';
        SEL <= "11111101";
        A <= "00000000000000010";
        D <= x"CCDD";
        wait for T;
        
        WR <= '0';
        SEL <= "10111111";
        A <= "00000000000000110";
        D <= x"EEFF";
        wait for T;
        
        WR <= '1';
        wait for T;
        
        SEL <= "11111110";
        A <= "00000000000000010";
        D <= "ZZZZZZZZZZZZZZZZ";
        wait for T;
        
        SEL <= "11111101";
        A <= "00000000000000010";
        D <= "ZZZZZZZZZZZZZZZZ";
        wait for T;
        
        SEL <= "10111111";
        A <= "00000000000000110";
        D <= "ZZZZZZZZZZZZZZZZ";
        wait for T;
        
        BHE <= '1';
        wait for T;
        
        A <= "00000000000000111";
        BHE <= '0';
        wait for T;
        
        A <= "00000000000000110";
        BHE <= '0';
        wait for T;
        
        SEL <= "11111111";
        
        wait;
    end process;

end Behavioral;
