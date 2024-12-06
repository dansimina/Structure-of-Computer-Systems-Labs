----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2024 10:44:46 PM
-- Design Name: 
-- Module Name: tb_SubModule - Behavioral
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

entity tb_SubModule is
--  Port ( );
end tb_SubModule;

architecture Behavioral of tb_SubModule is

component SubModule is
  Port ( 
    A: in std_logic_vector(16 downto 0);
    D: inout std_logic_vector(15 downto 0);
    WR : in std_logic;
    SEL : in std_logic;
    BHE : in std_logic
  );
end component;

signal A: std_logic_vector(16 downto 0) := (others => '0');
signal D: std_logic_vector(15 downto 0) := (others => '0');
signal WR : std_logic := '0';
signal SEL : std_logic := '0';
signal BHE : std_logic := '0';

begin


end Behavioral;
