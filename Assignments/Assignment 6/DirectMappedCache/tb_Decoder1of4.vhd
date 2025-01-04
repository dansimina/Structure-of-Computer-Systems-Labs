----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2025 01:18:55 PM
-- Design Name: 
-- Module Name: tb_Decoder1of4 - Behavioral
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

entity tb_Decoder1of4 is
--  Port ( );
end tb_Decoder1of4;

architecture Behavioral of tb_Decoder1of4 is

component Decoder1of4 is
  Port ( 
    sel: in std_logic_vector (1 downto 0);
    output: out std_logic_vector (3 downto 0)
  );
end component;

signal sel: std_logic_vector (1 downto 0) := (others => '0');
signal output: std_logic_vector (3 downto 0) := (others => '0');

constant T: time := 5ns;

begin

    tb_Decoder1of4: Decoder1of4 port map(
        sel => sel,
        output => output
    );
    
    process
    begin
        sel <= "00";
        wait for T;
        
        sel <= "01";
        wait for T;
        
        sel <= "10";
        wait for T;
        
        sel <= "11";
        wait;
    end process;

end Behavioral;
