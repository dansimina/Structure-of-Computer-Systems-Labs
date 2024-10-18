----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 11:54:58 PM
-- Design Name: 
-- Module Name: tb_BCD_decoder - Behavioral
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

entity tb_BCD_decoder is
--  Port ( );
end tb_BCD_decoder;

architecture Behavioral of tb_BCD_decoder is

component BCD_decoder is
    port (a: in std_logic_vector (3 downto 0);
          y: out std_logic_vector (6 downto 0));
end component;

constant T: time := 10ns;

signal a: std_logic_vector (3 downto 0);
signal y: std_logic_vector (6 downto 0);

begin

    tb_BCD_decoder: BCD_decoder port map (
        a => a,
        y => y
    );

    process
    begin
        
        a <= "0000";
        wait for T;
        
        a <= "0001";
        wait for T;
        
        a <= "0010";
        wait for T;
        
        a <= "0011";
        wait for T;
        
        a <= "0100";
        wait for T;
        
        a <= "0101";
        wait for T;
        
        a <= "0110";
        wait for T;
        
        a <= "0111";
        wait for T;
        
        a <= "1000";
        wait for T;
        
        a <= "1001";
        wait for T;
        
        a <= "1111";
        wait for T;
        
        wait;
    end process;

end Behavioral;
