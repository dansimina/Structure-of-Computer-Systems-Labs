----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 10:25:29 PM
-- Design Name: 
-- Module Name: tb_Multiplexer - Behavioral
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

entity tb_Multiplexer is
--  Port ( );
end tb_Multiplexer;

architecture Behavioral of tb_Multiplexer is

component Multiplexer is
    port (
        a, b, c, d: in std_logic_vector (3 downto 0);
        s: in std_logic_vector (1 downto 0);
        x: out std_logic_vector (3 downto 0));
end component;

constant T: time := 10ns;

signal a, b, c, d: std_logic_vector (3 downto 0) := (others => '0');
signal s: std_logic_vector (1 downto 0) := (others => '0');
signal x: std_logic_vector (3 downto 0) := (others => '0');

begin
    
    tb_Multiplexer: Multiplexer port map(
        a => a,
        b => b,
        c => c,
        d => d,
        s => s,
        x => x
    );
    
    process
    begin
    
    a <= "0001";
    b <= "0010";
    c <= "0100";
    d <= "1000";
    s <= "00";
    wait for T;
    
    s <= "01"; 
    wait for T;
    
    s <= "10"; 
    wait for T;
    
    s <= "11"; 
    wait for T;
    
    a <= "1010";
    s <= "00";
    
    wait;
    end process;

end Behavioral;
