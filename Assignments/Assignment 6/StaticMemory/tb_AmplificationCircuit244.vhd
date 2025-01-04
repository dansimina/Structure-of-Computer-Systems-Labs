----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2024 11:13:08 AM
-- Design Name: 
-- Module Name: tb_AmplificationCircuit244 - Behavioral
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

entity tb_AmplificationCircuit244 is
--  Port ( );
end tb_AmplificationCircuit244;

architecture Behavioral of tb_AmplificationCircuit244 is

component AmplificationCircuit244 is
  Port ( 
    INPUT : in std_logic_vector(7 downto 0);
    OUTPUT: out std_logic_vector(7 downto 0);
    G0: in std_logic;
    G1: in std_logic
  );
end component;

signal INPUT : std_logic_vector(7 downto 0) := (others => '0');
signal OUTPUT: std_logic_vector(7 downto 0) := (others => '0');
signal G0: std_logic := '0';
signal G1: std_logic := '0';

constant T : time := 5ns;

begin

    tb_AmplificationCircuit244: AmplificationCircuit244 port map (
        INPUT => INPUT,
        OUTPUT => OUTPUT,
        G0 => G0,
        G1 => G1
    );
    
    process
    begin
        INPUT <= x"AA";
        wait for T;
        
        INPUT <= x"BB";
        wait for T;
        
        G0 <= '1';
        wait for T;
        
        G1 <= '1';
        wait for T;
        
        G0 <= '0';
        wait for T;
        
        G1 <= '0';
        wait for T;
        wait;
    end process;

end Behavioral;
