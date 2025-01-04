----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2024 04:08:42 PM
-- Design Name: 
-- Module Name: tb_MainBlock - Behavioral
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

entity tb_MainBlock is
--  Port ( );
end tb_MainBlock;

architecture Behavioral of tb_MainBlock is

component MainBlock is
  Port ( 
    AddressBus: in std_logic_vector (23 downto 0);
    DataBus: inout std_logic_vector (15 downto 0);
    BHE: in std_logic;
    RD: in std_logic;
    WR: in std_logic
--    aux: out std_logic_vector (16 downto 0)
  );
end component;

signal AddressBus: std_logic_vector (23 downto 0) := (others => '0');
signal DataBus: std_logic_vector (15 downto 0) := (others => '0');
signal BHE: std_logic := '0';
signal RD: std_logic := '0';
signal WR: std_logic := '0';
--signal aux: std_logic_vector (16 downto 0) := (others => '0');

constant T : time := 5ns;

begin

    tb_MainBlock: MainBlock port map(
        AddressBus => AddressBus,
        DataBus => DataBus,
        BHE => BHE,
        RD => RD,
        WR => WR
--        aux => aux
    );
    
    process
    begin
        BHE <= '0';
        RD <= '1';
        WR <= '0'; 
        wait for T;
        
        DataBus <= x"AABB";
        AddressBus <= x"C01010";
        wait for T;
        
        DataBus <= x"CCDD";
        AddressBus <= x"CA0270";
        wait for T;
        
        DataBus <= x"EEFF";
        AddressBus <= x"CE2000";
        wait for T;
        
        RD <= '0';
        WR <= '1';
        AddressBus <= x"000000";
        DataBus <= (others => 'Z');
        wait for T;
        
        AddressBus <= x"CA0270";
        wait for T;
       
        AddressBus <= x"C01010";
        wait for T;
        
        AddressBus <= x"CE2000";
        wait for T;
        
        AddressBus <= x"CE2001";
        wait for T;
        
        AddressBus <= x"CE2000";
        BHE <= '1';
        wait for T;
        
        BHE <= '0';
        wait for T;
        
        RD  <= '1';
        wait for T;
        
        wait;       
    end process;

end Behavioral;