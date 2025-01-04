----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2025 01:23:13 PM
-- Design Name: 
-- Module Name: tb_RAM_64x9 - Behavioral
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

entity tb_RAM_64x9 is
--  Port ( );
end tb_RAM_64x9;

architecture Behavioral of tb_RAM_64x9 is

component RAM_64x9 is
  Port ( 
    address: in std_logic_vector(5 downto 0);
    WR: in std_logic;
    CS: in std_logic;
    data: inout std_logic_vector(8 downto 0)
  );
end component;

signal address: std_logic_vector(5 downto 0) := (others => '0');
signal WR: std_logic := '1';
signal CS: std_logic := '1';
signal data: std_logic_vector(8 downto 0) := (others => 'Z');

constant T: time := 5ns;

begin
    tb_RAM_64x9: RAM_64x9 port map(
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
        data <= '1' & x"AA";
        wait for T;
        
        address <= "000010";
        data <= '0' & x"BB";
        wait for T;
        
        address <= "000011";
        data <= '0' & x"CC";
        wait for T;
        
        WR <= '1';
        data <= "ZZZZZZZZZ";
        address <= "000001";
        wait for T;
        
        address <= "000010";
        wait for T;
        
        address <= "000011";
        wait;
    end process;

end Behavioral;
