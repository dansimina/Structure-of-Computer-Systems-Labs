----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 10:02:27 PM
-- Design Name: 
-- Module Name: Shift_register - Behavioral
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

entity Shift_register is
    port (clk: in std_logic;
         ce: in std_logic;
         si: in std_logic;
         so: out std_logic);
end Shift_register;

architecture Behavioral of Shift_register is
signal data: std_logic_vector(7 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then 
            if ce = '1' then
                for i in 0 to 6 loop
                    data(i + 1) <= data(i);
                end loop;
                data(0) <= si;
            end if;
        end if; 
    end process;
    
    so <= data(7);

end Behavioral;
