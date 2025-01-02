----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2025 05:32:54 PM
-- Design Name: 
-- Module Name: tb_DirectMappedCache - Behavioral
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

entity tb_DirectMappedCache is
--  Port ( );
end tb_DirectMappedCache;

architecture Behavioral of tb_DirectMappedCache is

component DirectMappedCache is
  Port ( 
    instruction: in std_logic_vector (15 downto 0);
    WR: in std_logic;
    update: in std_logic;
    aux: out std_logic_vector (7 downto 0);
    data: inout std_logic_vector(7 downto 0)
  );
end component;

signal instruction: std_logic_vector (15 downto 0) := (others => '0');
signal WR: std_logic := '1';
signal update: std_logic := '1';
signal data: std_logic_vector(7 downto 0) := (others => 'Z');
signal aux: std_logic_vector(7 downto 0) := (others => '0');

constant T: time := 5ns;

begin

    tb_DirectMappedCache: DirectMappedCache port map(
        instruction => instruction,
        WR => WR,
        update => update,
        aux => aux,
        data => data
    );
    
    process
    begin
        WR <= '1';
        update <= '1';
        wait for T;
        
        WR <= '0';
        update <= '0';
        wait for T;
        
        data <= x"AA";
        instruction <= B"00000001_000001_00";
        wait for T;
        

        data <= x"BB";
        instruction <= B"00000001_001001_01";
        wait for T;
        

        data <= x"CC";
        instruction <= B"00000001_100001_00";
        wait for T;
        

        data <= x"DD";
        instruction <= B"00000001_100001_10";
        wait for T;
                
        WR <= '1';
        update <= '1';
        wait for T;
        
        
        data <= "ZZZZZZZZ";
        instruction <= B"00000001_000001_00";
        wait for T;
        

        data <= "ZZZZZZZZ";
        instruction <= B"00000001_001001_01";
        wait for T;
        

        data <= "ZZZZZZZZ";
        instruction <= B"00000001_100001_00";
        wait for T;
        

        data <= "ZZZZZZZZ";
        instruction <= B"00000001_100001_10";
        wait;
        
    end process;

end Behavioral;
