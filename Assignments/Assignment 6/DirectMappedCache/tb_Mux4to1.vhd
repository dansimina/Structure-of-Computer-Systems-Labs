----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2025 01:19:36 PM
-- Design Name: 
-- Module Name: tb_Mux4to1 - Behavioral
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

entity tb_Mux4to1 is
--  Port ( );
end tb_Mux4to1;

architecture Behavioral of tb_Mux4to1 is

component Mux4to1 is
  Port ( 
    input0: inout std_logic_vector(7 downto 0);
    input1: inout std_logic_vector(7 downto 0);
    input2: inout std_logic_vector(7 downto 0);
    input3: inout std_logic_vector(7 downto 0);
    sel: in std_logic_vector (1 downto 0);
    dir: in std_logic;
    output: inout std_logic_vector (7 downto 0)
  );
end component;

signal input0: std_logic_vector(7 downto 0) := (others => 'Z');
signal input1: std_logic_vector(7 downto 0) := (others => 'Z');
signal input2: std_logic_vector(7 downto 0) := (others => 'Z');
signal input3: std_logic_vector(7 downto 0) := (others => 'Z');
signal sel: std_logic_vector (1 downto 0) := (others => '0');
signal dir: std_logic := '0';
signal output: std_logic_vector (7 downto 0) := (others => 'Z');

constant T: time := 5ns;

begin

    tb_Mux4to1: Mux4to1 port map(
        input0 => input0,
        input1 => input1,
        input2 => input2,
        input3 => input3,
        sel => sel,
        dir => dir,
        output => output
    );
    
    process
    begin
        
        input0 <= x"AA";
        input1 <= x"BB";
        input2 <= x"CC";
        input3 <= x"DD";
        output <= "ZZZZZZZZ";
        
        sel <= "00";
        dir <= '1';
        wait for T;
        
        
        sel <= "01";
        dir <= '1';
        wait for T;
        
        
        sel <= "10";
        dir <= '1';
        wait for T;

        
        sel <= "11";
        dir <= '1';
        wait for T;
        
        input0 <= "ZZZZZZZZ";
        output <= x"EA";
        sel <= "00";
        dir <= '0';
        wait for T;
        
        input1 <= "ZZZZZZZZ";
        output <= x"EB";
        sel <= "01";
        dir <= '0';
        wait for T;
        
        input2 <= "ZZZZZZZZ";
        output <= x"EC";
        sel <= "10";
        dir <= '0';
        wait for T;
        
        input3 <= "ZZZZZZZZ";
        output <= x"ED";
        sel <= "11";
        dir <= '0';
        wait;
        
    end process;

end Behavioral;
