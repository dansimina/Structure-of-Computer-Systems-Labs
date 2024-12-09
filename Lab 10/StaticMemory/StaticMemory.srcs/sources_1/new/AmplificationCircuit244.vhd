----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2024 10:56:43 AM
-- Design Name: 
-- Module Name: AmplificationCircuit244 - Behavioral
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

entity AmplificationCircuit244 is
  Port ( 
    INPUT : in std_logic_vector(7 downto 0);
    OUTPUT: out std_logic_vector(7 downto 0);
    G0: in std_logic;
    G1: in std_logic
  );
end AmplificationCircuit244;

architecture Behavioral of AmplificationCircuit244 is

begin

    OUTPUT <= INPUT when G0 = '0' and G1 = '0' else "ZZZZZZZZ";

end Behavioral;
