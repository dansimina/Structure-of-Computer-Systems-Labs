----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2024 03:28:00 PM
-- Design Name: 
-- Module Name: tb_WallaceTreeMultiplication - Behavioral
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

entity tb_WallaceTreeMultiplication is
--  Port ( );
end tb_WallaceTreeMultiplication;

architecture Behavioral of tb_WallaceTreeMultiplication is
component WallaceTreeMultiplication is
Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
       y : in STD_LOGIC_VECTOR (3 downto 0);
       p : out STD_LOGIC_VECTOR (7 downto 0));
end component;

constant T: time := 10ns;

signal x, y: std_logic_vector (3 downto 0) := "0000";
signal p: std_logic_vector (7 downto 0) := "00000000";
begin

    tb_WallaceTreeMultiplication: WallaceTreeMultiplication port map (
        x => x,
        y => y,
        p => p
    );
    
    process
    begin 
        x <= "0111";
        y <= "0101";
        wait for T * 2;
        
        x <= "1111";
        y <= "1111";
        wait for T * 2;
        
        wait;
    end process;

end Behavioral;
