----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2024 03:01:32 PM
-- Design Name: 
-- Module Name: tb_DecoderCircuit - Behavioral
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

entity tb_DecoderCircuit is
--  Port ( );
end tb_DecoderCircuit;

architecture Behavioral of tb_DecoderCircuit is

component DecoderCircuit is
  Port ( 
    A: in std_logic_vector (6 downto 0);
    RD: in std_logic;
    WR: in std_logic;
    SEL: out std_logic_vector (7 downto 0);
    SelModule: out std_logic
  );
end component;

signal A: std_logic_vector (6 downto 0) := (others => '0');
signal RD: std_logic := '0';
signal WR: std_logic := '0';
signal SEL: std_logic_vector (7 downto 0) := (others => '0');
signal SelModule: std_logic := '0';

constant T : time := 5ns;

begin

    tb_DecoderCircuit: DecoderCircuit port map(
        A => A,
        RD => RD,
        WR => WR,
        SEL => SEL,
        SelModule => SelModule
    );
    
    process
    begin
        
        A <= B"1100_000";
        wait for T;
        
        A <= B"1100_001";
        wait for T;
        
        A <= B"1100_010";
        wait for T;
        
        A <= B"1101_010";
        wait for T;
        
        A <= B"1100_010";
        wait for T;
        
        WR <= '1';
        RD <= '1';
        wait for T;
        
        WR <= '0';
        RD <= '1';
        wait for T;
        
        WR <= '1';
        RD <= '0';
        wait;
        
    end process;    

end Behavioral;
