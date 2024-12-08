----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2024 02:41:49 PM
-- Design Name: 
-- Module Name: tb_Decoder3to8 - Behavioral
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

entity tb_Decoder3to8 is
--  Port ( );
end tb_Decoder3to8;

architecture Behavioral of tb_Decoder3to8 is

component Decoder3to8 is
  Port ( 
    A: in std_logic_vector(2 downto 0);
    E1: in std_logic;
    E2: in std_logic;
    E3: in std_logic;
    O: out std_logic_vector (7 downto 0) 
  );
end component;

signal A: std_logic_vector(2 downto 0) := (others => '0');
signal E1: std_logic := '0';
signal E2: std_logic := '0';
signal E3: std_logic := '1';
signal O: std_logic_vector (7 downto 0) := (others => '0'); 

constant T : time := 5ns;

begin

    tb_Decoder3to8: Decoder3to8 port map (
        A => A,
        E1 => E1,
        E2 => E2,
        E3 => E3,
        O => O
    );
    
    
    process
    begin
        
        A <= "000";
        wait for T;
        
        A <= "001";
        wait for T;
        
        A <= "010";
        wait for T;
        
        E1 <= '1';
        wait for T;
        
        E1 <= '0';
        wait for T;
        
        E2 <= '1';
        wait for T;
        
        E2 <= '0';
        wait for T;
        
        E3 <= '0';
        wait for T;
        
        E3 <= '1';
        wait for T;
        
    wait;
    end process;

end Behavioral;
