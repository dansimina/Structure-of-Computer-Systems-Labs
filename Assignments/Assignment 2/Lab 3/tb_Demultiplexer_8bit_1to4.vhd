----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 11:35:05 PM
-- Design Name: 
-- Module Name: tb_Demultiplexer_8bit_1to4 - Behavioral
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

entity tb_Demultiplexer_8bit_1to4 is
--  Port ( );
end tb_Demultiplexer_8bit_1to4;

architecture Behavioral of tb_Demultiplexer_8bit_1to4 is

component Demultiplexer_8bit_1to4 is
    port (
        x: in std_logic_vector (7 downto 0);
        s: in std_logic_vector (1 downto 0);
        a, b, c, d: out std_logic_vector (7 downto 0));
end component;

constant T: time := 10ns;

signal s: std_logic_vector (1 downto 0) := (others => '0');
signal x, a, b, c, d: std_logic_vector (7 downto 0) := (others => '0');

begin

    tb_Demultiplexer_8bit_1to4: Demultiplexer_8bit_1to4 port map (
        x => x,
        s => s,
        a => a,
        b => b,
        c => c,
        d => d
    );
    
    process
    begin
        x <= x"AB";
        s <= "00";
        wait for T;
        
        x <= x"CD";
        s <= "01";
        wait for T;
        
        x <= x"EF";
        s <= "10";
        wait for T;
        
        x <= x"AF";
        s <= "11";
        wait for T;
        
        x <= x"FF";
        s <= "00";
        wait;
    
    end process;

end Behavioral;
