----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2024 11:26:01 PM
-- Design Name: 
-- Module Name: tb_basys3_fifo8x8 - Behavioral
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

entity tb_basys3_fifo8x8 is
--  Port ( );
end tb_basys3_fifo8x8;

architecture Behavioral of tb_basys3_fifo8x8 is

component basys3_fifo8x8 is
     Port ( clk : in STD_LOGIC;
     btn : in STD_LOGIC_VECTOR (4 downto 0);
     sw : in STD_LOGIC_VECTOR (15 downto 0);
     led : out STD_LOGIC_VECTOR (15 downto 0);
     an : out STD_LOGIC_VECTOR (3 downto 0);
     cat : out STD_LOGIC_VECTOR (6 downto 0));
end component;

constant T: time := 10ns;

signal clk : STD_LOGIC := '0';
signal btn : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
signal sw : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal led : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal an : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal cat : STD_LOGIC_VECTOR (6 downto 0) := (others => '0');

begin
    tb_basys3_fifo8x8: basys3_fifo8x8 port map(
        clk => clk,
        btn => btn,
        sw => sw,
        led => led,
        an => an,
        cat => cat
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
        btn(2) <= '1';
        sw(7 downto 0) <= x"15";
        wait for 4 * T;
            
        sw(7 downto 0) <= x"39";
        wait for 4 * T;
        
        btn(2) <= '0';
        btn(1) <= '1';
        wait;
    end process;

end Behavioral;
