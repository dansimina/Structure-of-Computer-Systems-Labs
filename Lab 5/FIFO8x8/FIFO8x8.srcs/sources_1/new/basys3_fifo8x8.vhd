----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2024 11:44:07 AM
-- Design Name: 
-- Module Name: basys3_fifo8x8 - Behavioral
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

 entity basys3_fifo8x8 is
     Port ( clk : in STD_LOGIC;
     btn : in STD_LOGIC_VECTOR (4 downto 0);
     sw : in STD_LOGIC_VECTOR (15 downto 0);
     led : out STD_LOGIC_VECTOR (15 downto 0);
     an : out STD_LOGIC_VECTOR (3 downto 0);
     cat : out STD_LOGIC_VECTOR (6 downto 0));
 end basys3_fifo8x8;

architecture Behavioral of basys3_fifo8x8 is

begin


end Behavioral;
