----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2024 01:21:09 PM
-- Design Name: 
-- Module Name: RAM - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
  Port ( 
    address: in std_logic_vector(5 downto 0);
    WR: in std_logic;
    CS: in std_logic;
    data: inout std_logic_vector(7 downto 0)
  );
end RAM;

architecture Behavioral of RAM is

type MEMORY is array(0 to 63) of std_logic_vector(7 downto 0);
signal mem: MEMORY := (others => x"00");

begin

    mem(TO_INTEGER (unsigned (address))) <= data when CS = '0' and WR = '0' else (others => 'Z');
    data <= mem(TO_INTEGER (unsigned (address))) when CS = '0' and WR = '1' else (others => 'Z');

end Behavioral;
