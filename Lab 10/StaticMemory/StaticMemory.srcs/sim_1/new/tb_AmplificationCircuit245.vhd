----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2024 11:20:43 AM
-- Design Name: 
-- Module Name: tb_AmplificationCircuit245 - Behavioral
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

entity tb_AmplificationCircuit245 is
--  Port ( );
end tb_AmplificationCircuit245;

architecture Behavioral of tb_AmplificationCircuit245 is

component AmplificationCircuit245 is
  Port ( 
    A: inout std_logic_vector(7 downto 0);
    B: inout std_logic_vector(7 downto 0);
    Dir: in std_logic;
    CS: in std_logic
  );
end component;

signal A: std_logic_vector(7 downto 0) := (others => '0');
signal B:  std_logic_vector(7 downto 0) := (others => '0');
signal Dir: std_logic := '0';
signal CS: std_logic := '0';

constant T : time := 5ns;

begin

    tb_AmplificationCircuit245: AmplificationCircuit245 port map (
        A => A,
        B => B,
        Dir => Dir,
        CS => CS
    );
    
    process
    begin
        Dir <= '0';
        A <= x"AA";
        B <= (others => 'Z');
        wait for T;
        
        Dir <= '1';
        A <= (others => 'Z');
        B <= x"BB";
        wait for T;
        
        CS <= '1';
        
        wait;
    
    end process;

end Behavioral;
