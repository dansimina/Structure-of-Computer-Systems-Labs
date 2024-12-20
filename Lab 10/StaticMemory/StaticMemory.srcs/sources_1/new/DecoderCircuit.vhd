----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2024 08:38:20 PM
-- Design Name: 
-- Module Name: DecoderCircuit - Behavioral
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

entity DecoderCircuit is
  Port ( 
    A: in std_logic_vector (6 downto 0);
    RD: in std_logic;
    WR: in std_logic;
    Sel: out std_logic_vector (7 downto 0);
    SelModule: out std_logic
  );
end DecoderCircuit;

architecture Behavioral of DecoderCircuit is

component Decoder3to8 is
  Port ( 
    A: in std_logic_vector(2 downto 0);
    E1: in std_logic;
    E2: in std_logic;
    E3: in std_logic;
    O: out std_logic_vector (7 downto 0) 
  );
end component;

signal E1: std_logic := '0';
signal E2: std_logic := '0';
signal E3: std_logic := '1';

begin
    
    etDecoder3to8: Decoder3to8 port map (
        A => A(2 downto 0),
        E1 => E1,
        E2 => E2,
        E3 => '1',
        O => Sel
    );
    
    E1 <= '0' when A(6 downto 3) = "1100" else '1';
    E2 <= '1' when RD = '1' and WR = '1' else '0';
    
    SelModule <= E1 or E2;

end Behavioral;
