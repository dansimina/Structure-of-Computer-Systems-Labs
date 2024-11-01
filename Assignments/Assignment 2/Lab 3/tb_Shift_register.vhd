----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 10:17:30 PM
-- Design Name: 
-- Module Name: tb_Shift_register - Behavioral
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

entity tb_Shift_register is
--  Port ( );
end tb_Shift_register;

architecture Behavioral of tb_Shift_register is

component Shift_register is
    port (clk: in std_logic;
         ce: in std_logic;
         si: in std_logic;
         so: out std_logic);
end component;

constant T: time := 10ns;
signal clk, ce, si, so: std_logic := '0';

begin

    tb_Shift_register: Shift_register port map(
        clk => clk,
        ce => ce,
        si => si,
        so => so
    );
    
    process
    begin
        clk <= '1';
        wait for T / 2;
        clk <= '0';
        wait for T / 2;
    end process;
    
    process
    begin
        si <= '1';
        ce <= '1';
        wait for 4*T;
        si <= '0';
        wait for 2*T;
        si <= '1';
        wait for 6 * T;
        ce <= '0';
        wait for 2 * T;
        ce <= '1';
        wait;
    end process;
    
end Behavioral;
