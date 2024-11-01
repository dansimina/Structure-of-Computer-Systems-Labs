----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 10:19:43 PM
-- Design Name: 
-- Module Name: Multiplexer - Behavioral
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

entity Multiplexer is
    port (
        a, b, c, d, e, f, g, h: in std_logic_vector (7 downto 0);
        sel: in std_logic_vector (2 downto 0);
        data_out: out std_logic_vector (7 downto 0));
end Multiplexer;

architecture Behavioral of Multiplexer is

begin

    with sel select data_out <= a when "000",
                               b when "001",
                               c when "010",
                               d when "011",
                               e when "100",
                               f when "101",
                               g when "110",
                               h when others;

end Behavioral;
