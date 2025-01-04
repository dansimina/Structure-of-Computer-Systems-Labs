----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2024 01:37:50 PM
-- Design Name: 
-- Module Name: Mux4to1 - Behavioral
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

entity Mux4to1 is
  Port ( 
    input0: inout std_logic_vector(7 downto 0);
    input1: inout std_logic_vector(7 downto 0);
    input2: inout std_logic_vector(7 downto 0);
    input3: inout std_logic_vector(7 downto 0);
    sel: in std_logic_vector (1 downto 0);
    dir: in std_logic;
    output: inout std_logic_vector (7 downto 0)
  );
end Mux4to1;

architecture Behavioral of Mux4to1 is

begin
    process(input0, input1, input2, input3, sel, dir, output)
    begin    
        if dir = '1' then
            case sel is
                when "00" => output <= input0;
                when "01" => output <= input1;
                when "10" => output <= input2;
                when "11" => output <= input3;
                when others => output <= (others => 'Z');
            end case;
            input0 <= (others => 'Z');
            input1 <= (others => 'Z');
            input2 <= (others => 'Z');
            input3 <= (others => 'Z');
        else     
            case sel is
                when "00" => input0 <= output;
                when "01" => input1 <= output;
                when "10" => input2 <= output;
                when "11" => input3 <= output;
                when others => null;
            end case;
            output <= (others => 'Z');
        end if;
    end process;

end Behavioral;
