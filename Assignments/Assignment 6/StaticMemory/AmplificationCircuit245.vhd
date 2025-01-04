----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2024 11:04:26 AM
-- Design Name: 
-- Module Name: AmplificationCircuit245 - Behavioral
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

entity AmplificationCircuit245 is
  Port ( 
    A: inout std_logic_vector(7 downto 0);
    B: inout std_logic_vector(7 downto 0);
    Dir: in std_logic;
    CS: in std_logic
  );
end AmplificationCircuit245;

architecture Behavioral of AmplificationCircuit245 is

begin
    
    B <= A when Dir = '0' and CS = '0' else "ZZZZZZZZ";   
    A <= B when Dir = '1' and CS = '0' else "ZZZZZZZZ";
    
end Behavioral;
