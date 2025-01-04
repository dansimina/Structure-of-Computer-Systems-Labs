----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2025 01:18:26 PM
-- Design Name: 
-- Module Name: tb_CMP - Behavioral
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

entity tb_CMP is
--  Port ( );
end tb_CMP;

architecture Behavioral of tb_CMP is

component CMP is
  Port ( 
    input1: in std_logic_vector(7 downto 0);
    input2: in std_logic_vector(7 downto 0);
    result: out std_logic
  );
end component;

signal input1: std_logic_vector(7 downto 0) := (others => '0');
signal input2: std_logic_vector(7 downto 0) := (others => '0');
signal result: std_logic := '0';

constant T: time := 5ns;

begin

    tb_CMP: CMP port map(
        input1 => input1,
        input2 => input2,
        result => result
    );
    
    process
    begin
        input1 <= x"AB";
        input2 <= x"BB";
        wait for T;
        
        input1 <= x"AB";
        input2 <= x"AB";
        wait for T;
        
        input1 <= x"AA";
        input2 <= x"AB";
        wait;
    end process;

end Behavioral;
