----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2024 10:44:46 PM
-- Design Name: 
-- Module Name: tb_SubModule - Behavioral
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

entity tb_SubModule is
--  Port ( );
end tb_SubModule;

architecture Behavioral of tb_SubModule is

component SubModule is
  Port ( 
    A: in std_logic_vector(16 downto 0);
    D: inout std_logic_vector(15 downto 0);
    WR : in std_logic;
    SEL : in std_logic;
    BHE : in std_logic
  );
end component;

signal A: std_logic_vector(16 downto 0) := (others => '0');
signal D: std_logic_vector(15 downto 0) := (others => '0');
signal WR : std_logic := '0';
signal SEL : std_logic := '0';
signal BHE : std_logic := '0';

constant T : time := 5ns;

begin
    
    tb_SubModule: SubModule port map (
        A => A,
        D => D,
        WR => WR,
        SEL => SEL,
        BHE => BHE
    );
    
    process
    begin
        wait for T;
        SEL <= '0';
        wait for T;
        
        WR <= '0';
        A <= "00000000000000010";
        D <= x"AABB";
        wait for T;
        
        A <= "00000000000000100";
        D <= x"CCDD";
        wait for T;
        
        A <= "00000000000000110";
        D <= x"EEFF";
        wait for T;
        
        WR <= '1';
        D <= "ZZZZZZZZZZZZZZZZ";
        A <= "00000000000000100";
        wait for T;
        
        A <= "00000000000000010";
        wait for T;
        
        WR <= '0';
        A <= "00000000000000100";
        D <= x"1234";
        wait for T;
        
        WR <= '1';
        D <= "ZZZZZZZZZZZZZZZZ";
        A <= "00000000000000110";
        wait for T;
        
        A <= "00000000000000100";
        wait for T;
        
        SEL <= '1';
        wait;
        
    end process;

end Behavioral;
