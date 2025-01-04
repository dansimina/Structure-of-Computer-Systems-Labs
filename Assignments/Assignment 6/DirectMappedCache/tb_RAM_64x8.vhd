----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2025 01:20:19 PM
-- Design Name: 
-- Module Name: tb_RAM_64x8 - Behavioral
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

entity tb_RAM_64x8 is
--  Port ( );
end tb_RAM_64x8;

architecture Behavioral of tb_RAM_64x8 is

component RAM_64x8 is
  Port ( 
    address: in std_logic_vector(5 downto 0);
    WR: in std_logic;
    CS: in std_logic;
    data: inout std_logic_vector(7 downto 0)
  );
end component;

signal address: std_logic_vector(5 downto 0) := (others => '0');
signal WR: std_logic := '1';
signal CS: std_logic := '1';
signal data: std_logic_vector(7 downto 0) := (others => 'Z');

constant T: time := 5ns;

begin

    tb_RAM_64x8: RAM_64x8 port map(
        address => address,
        WR => WR,
        CS => CS,
        data => data
    );
    
    process
    begin
        WR <= '0';
        CS <= '0';
        address <= "000001";
        data <= x"AA";
        wait for T;
        
        address <= "000010";
        data <= x"BB";
        wait for T;
        
        address <= "000011";
        data <= x"CC";
        wait for T;
        
        WR <= '1';
        data <= "ZZZZZZZZ";
        address <= "000001";
        wait for T;
        
        address <= "000010";
        wait for T;
        
        address <= "000011";
        wait;
    end process;

end Behavioral;
