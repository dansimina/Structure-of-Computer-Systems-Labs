----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2025 12:31:32 PM
-- Design Name: 
-- Module Name: RAM_64x9 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM_64x9 is
  Port ( 
    address: in std_logic_vector(5 downto 0);
    WR: in std_logic;
    CS: in std_logic;
    data: inout std_logic_vector(8 downto 0)
  );
end RAM_64x9;

architecture Behavioral of RAM_64x9 is

type MEMORY is array(0 to 63) of std_logic_vector(8 downto 0);
signal mem: MEMORY := (others => "000000000");

begin
    process (address, data, CS, WR) 
    begin 
        if CS = '0' and WR = '0' then 
            mem(TO_INTEGER (unsigned (address))) <= data;
            data <= (others => 'Z');
        elsif CS = '0' and WR = '1' then 
            data <= mem(TO_INTEGER (unsigned (address)));
        end if;
    end process;

end Behavioral;
