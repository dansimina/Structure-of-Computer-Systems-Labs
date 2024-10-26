----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 09:58:00 PM
-- Design Name: 
-- Module Name: tb_CarryLookaheadAdder - Behavioral
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

entity tb_CarryLookaheadAdder is
--  Port ( );
end tb_CarryLookaheadAdder;

architecture Behavioral of tb_CarryLookaheadAdder is

component CarryLookaheadAdder is
    Port ( c_in : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0);
           c_out : out STD_LOGIC);
end component;

constant T: time := 10ns;

signal c_in, c_out: std_logic := '0';
signal x, y, s: std_logic_vector (3 downto 0) := "0000";

begin
    tb_CarryLookaheadAdder: CarryLookaheadAdder port map (
        c_in => c_in,
        x => x,
        y => y,
        s => s,
        c_out => c_out
    );

    process
    begin
        x <= "0011";
        y <= "1100";
        wait for 2 * T;
        
        x <= "0101";
        y <= "0011";
        wait for 2 * T;
        
        wait;
    end process;

end Behavioral;
