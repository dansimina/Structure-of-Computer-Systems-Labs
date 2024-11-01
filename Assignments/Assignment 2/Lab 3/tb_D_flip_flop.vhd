----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 01:25:21 PM
-- Design Name: 
-- Module Name: tb_D_flip_flop - Behavioral
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

entity tb_D_flip_flop is
--  Port ( );
end tb_D_flip_flop;

architecture Behavioral of tb_D_flip_flop is

component D_flip_flop is
    Port ( d_in : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC;
           not_q : out STD_LOGIC);
end component;

constant T: time := 10ns;
signal d_in, clk, q, not_q: std_logic := '0';

begin
    
    tb_D_flip_flop: D_flip_flop port map (
        d_in => d_in,
        clk => clk,
        q => q,
        not_q => not_q
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
        d_in <= '0';
        wait for 2 * T;
        d_in <= '1';
        wait for 2 * T;
        d_in <= '0';
        wait for 2 * T;
        d_in <= '1';
        wait for 2 * T;
        
        wait;
    end process;

end Behavioral;
