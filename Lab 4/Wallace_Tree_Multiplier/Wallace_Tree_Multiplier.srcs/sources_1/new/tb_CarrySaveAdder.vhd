----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 11:03:45 PM
-- Design Name: 
-- Module Name: tb_CarrySaveAdder - Behavioral
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

entity tb_CarrySaveAdder is
--  Port ( );
end tb_CarrySaveAdder;

architecture Behavioral of tb_CarrySaveAdder is

component CarrySaveAdder is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           z : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (8 downto 0));
end component;

constant T: time := 10ns;

signal x, y, z, s: std_logic_vector (7 downto 0) := "00000000";
signal c: std_logic_vector (8 downto 0) := "000000000";

begin
    
    tb_CarrySaveAdder: CarrySaveAdder port map (
        x => x,
        y => y,
        z => z,
        s => s,
        c => c
    );
    
    process
    begin
        x <= "00001001";
        y <= "00000110";
        z <= "00000011";
        wait for 2 * T;
        
        x <= "00010011";
        y <= "00011001";
        z <= "00001011";
        wait for 2 * T;
        wait;
    end process;

end Behavioral;
