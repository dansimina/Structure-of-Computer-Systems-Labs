----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 01:23:54 PM
-- Design Name: 
-- Module Name: D_flip_flop - Behavioral
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

entity D_flip_flop is
    Port ( d_in : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC;
           not_q : out STD_LOGIC);
end D_flip_flop;

architecture Behavioral of D_flip_flop is

begin
    process(clk)
    begin
        if rising_edge(clk) then
            q <= d_in;
            not_q <= not d_in;
        end if;
    end process;

end Behavioral;
