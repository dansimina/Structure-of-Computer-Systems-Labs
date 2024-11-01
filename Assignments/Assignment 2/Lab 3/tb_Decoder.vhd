----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 10:53:42 PM
-- Design Name: 
-- Module Name: tb_Decoder - Behavioral
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

entity tb_Decoder is
--  Port ( );
end tb_Decoder;

architecture Behavioral of tb_Decoder is

component Decoder is
    port (a: in std_logic_vector (2 downto 0);
          y: out std_logic_vector (7 downto 0));
end component;

constant T: time := 10ns;

signal a: std_logic_vector (2 downto 0) := (others => '0');
signal y: std_logic_vector (7 downto 0) := (others => '0');

begin

    tb_Decoder: Decoder port map (
        a => a,
        y => y
    );

    process
    begin
    
        a <= "000";
        wait for T;
        
        a <= "001";
        wait for T;
        
        a <= "010";
        wait for T;
        
        a <= "011";
        wait for T;
        
        a <= "100";
        wait for T;
        
        a <= "101";
        wait for T;
        
        a <= "110";
        wait for T;
        
        a <= "111";    
        wait;
    end process;

end Behavioral;
