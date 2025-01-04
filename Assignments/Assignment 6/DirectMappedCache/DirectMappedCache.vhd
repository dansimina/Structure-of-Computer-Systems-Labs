----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2025 04:58:46 PM
-- Design Name: 
-- Module Name: DirectMappedCache - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DirectMappedCache is
  Port ( 
    instruction: in std_logic_vector (15 downto 0);
    WR: in std_logic;
    update: in std_logic;
    aux: out std_logic_vector (8 downto 0);
    data: inout std_logic_vector(7 downto 0)
  );
end DirectMappedCache;

architecture Behavioral of DirectMappedCache is

component Decoder1of4 is
  Port ( 
    sel: in std_logic_vector (1 downto 0);
    output: out std_logic_vector (3 downto 0)
  );
end component;

signal CS: std_logic_vector(3 downto 0) := (others => '0');
signal CS0: std_logic := '0';
signal CS1: std_logic := '0';
signal CS2: std_logic := '0';
signal CS3: std_logic := '0';

component RAM_64x8 is
  Port ( 
    address: in std_logic_vector(5 downto 0);
    WR: in std_logic;
    CS: in std_logic;
    data: inout std_logic_vector(7 downto 0)
  );
end component;

signal data0: std_logic_vector(7 downto 0) := (others => '0');
signal data1: std_logic_vector(7 downto 0) := (others => '0');
signal data2: std_logic_vector(7 downto 0) := (others => '0');
signal data3: std_logic_vector(7 downto 0) := (others => '0');
signal data_aux: std_logic_vector(7 downto 0) := (others => 'Z');

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

component RAM_64x9 is
  Port ( 
    address: in std_logic_vector(5 downto 0);
    WR: in std_logic;
    CS: in std_logic;
    data: inout std_logic_vector(8 downto 0)
  );
end component;

signal tag: std_logic_vector(8 downto 0) := (others => 'Z');

component CMP is
  Port ( 
    input1: in std_logic_vector(7 downto 0);
    input2: in std_logic_vector(7 downto 0);
    result: out std_logic
  );
end component;

signal hit, valid_and_hit: std_logic := '0';

begin

    et_Decoder1of4: Decoder1of4 port map(
        sel => instruction(1 downto 0),
        output => CS
    );
    
    CS0 <= update and CS(0);
    CS1 <= update and CS(1);
    CS2 <= update and CS(2);
    CS3 <= update and CS(3);
    
    et0_RAM_64x8: RAM_64x8 port map(
        address => instruction(7 downto 2),
        WR => WR,
        CS => CS0,
        data => data0
    );
    
    et1_RAM_64x8: RAM_64x8 port map(
        address => instruction(7 downto 2),
        WR => WR,
        CS => CS1,
        data => data1
    );
    
    et2_RAM_64x8: RAM_64x8 port map(
        address => instruction(7 downto 2),
        WR => WR,
        CS => CS2,
        data => data2
    );
    
    et3_RAM_64x8: RAM_64x8 port map(
        address => instruction(7 downto 2),
        WR => WR,
        CS => CS3,
        data => data3
    );
    
    et_Mux4to1: Mux4to1 port map(
        input0 => data0,
        input1 => data1,
        input2 => data2,
        input3 => data3,
        sel => instruction(1 downto 0),
        dir => WR,
        output => data_aux
    );
    
    et_RAM_64x9: RAM_64x9 port map(
        address => instruction(7 downto 2),
        WR => update,
        CS => '0',
        data => tag
    );
    
    process(update, instruction)
    begin
        if update = '0' then 
            tag <= '1' & instruction(15 downto 8);
        else
            tag <= (others => 'Z');
        end if;
    end process;
        
    et_CMP: CMP port map(
        input1 => tag(7 downto 0),
        input2 => instruction(15 downto 8),
        result => hit
    );
    
    valid_and_hit <= tag(8) and hit;
    
    aux <= "00000000" & valid_and_hit;
    
    process(data, data_aux, WR, valid_and_hit) 
    begin
        if WR = '0' then
            data_aux <= data;
            data <= (others => 'Z');
        elsif WR = '1' then
            if valid_and_hit = '1' then
                data <= data_aux;
                data_aux <= (others => 'Z');
            else 
                data <= (others => 'Z');
            end if;
        end if;
    end process;
    
end Behavioral;
