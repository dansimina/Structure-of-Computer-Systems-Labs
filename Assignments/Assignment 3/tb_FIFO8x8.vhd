----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2024 01:33:44 PM
-- Design Name: 
-- Module Name: tb_FIFO8x8 - Behavioral
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

entity tb_FIFO8x8 is
--  Port ( );
end tb_FIFO8x8;

architecture Behavioral of tb_FIFO8x8 is

component FIFO8x8 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rd : in STD_LOGIC;
           wr : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           empty: out STD_LOGIC;
           full: out STD_LOGIC);
end component;

constant T: time := 10ns;

signal clk, rst, rd, wr, empty, full: std_logic := '0'; 
signal data_in, data_out: std_logic_vector(7 downto 0) := "00000000";

begin
    
    connect: FIFO8x8 port map(
        clk => clk,
        rst => rst,
        rd => rd,
        wr => wr,
        data_in => data_in,
        data_out => data_out,
        empty => empty,
        full => full
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
        wr <= '1';
        data_in <= x"AA";
        wait for T;
        
        data_in <= x"BB";
        wait for T;
        
        data_in <= x"CC";
        wait for T;
        
        data_in <= x"DD";
        wait for T;
        
        data_in <= x"EE";
        wait for T;
        
        data_in <= x"FF";
        wait for T;
        
        data_in <= x"AB";
        wait for T;
        
        data_in <= x"AC";
        wait for 2 * T;
        
        wr <= '0';
        wait for 2 * T;
        
        rd <= '1';
        wait for 4 * T;
        
        rd <= '0';
        wr <= '1';
        data_in <= x"FA";
        wait for T;
        
        data_in <= x"FB";
        wait for T;
        
        data_in <= x"FC";
        wait for T;
        
        data_in <= x"FD";
        wait for T;
        
        data_in <= x"FE";
        wait for T;
        
        rd <= '1';
        wait for T * 10;
        
        rst <= '1';
        
        wait;
        
    end process;

end Behavioral;
