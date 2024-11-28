----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2024 12:32:53 PM
-- Design Name: 
-- Module Name: FIFO8x8 - Behavioral
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
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO8x8 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rd : in STD_LOGIC;
           wr : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           empty: out STD_LOGIC;
           full: out STD_LOGIC);
end FIFO8x8;

architecture Behavioral of FIFO8x8 is

component Multiplexer is
    port (
        a, b, c, d, e, f, g, h: in std_logic_vector (7 downto 0);
        sel: in std_logic_vector (2 downto 0);
        data_out: out std_logic_vector (7 downto 0));
end component;

component Decoder is
    port (sel: in std_logic_vector (2 downto 0);
          data_out: out std_logic_vector (7 downto 0));
end component;

type fifoRegisters is array(0 to 7) of std_logic_vector(7 downto 0);
signal reg: fifoRegisters := (others => "00000000");

signal wrptr: std_logic_vector(2 downto 0) := "000";
signal rdptr: std_logic_vector(2 downto 0) := "000";
signal counter: std_logic_vector(3 downto 0) := "0000";

signal decoder_out, mux_out: std_logic_vector(7 downto 0) := (others => '0');

signal flagFull: std_logic := '0';
signal flagEmpty: std_logic := '1';

begin

    mux: Multiplexer port map(
        a => reg(0),
        b => reg(1),
        c => reg(2),
        d => reg(3),
        e => reg(4),
        f => reg(5),
        g => reg(6),
        h => reg(7),
        sel => rdptr,
        data_out => mux_out
    );
    
    dec: Decoder port map(
        sel => wrptr,
        data_out => decoder_out
    );

    process(clk, rst) 
    begin 
        if rst = '1' then
            data_out <= "ZZZZZZZZ";
            counter <= "0000";
            wrptr <= "000";
            rdptr <= "000";
            reg <= (others => "00000000");
            
        elsif rising_edge(clk) then
            if wr = '1' and flagFull = '0' then
                if decoder_out(0) = '1' then
                    reg(0) <= data_in;
                
                elsif decoder_out(1) = '1' then
                    reg(1) <= data_in;
                
                elsif decoder_out(2) = '1' then
                    reg(2) <= data_in;
                    
                elsif decoder_out(3) = '1' then
                    reg(3) <= data_in;
                    
                elsif decoder_out(4) = '1' then
                    reg(4) <= data_in;
                    
                elsif decoder_out(5) = '1' then
                    reg(5) <= data_in;
                    
                elsif decoder_out(6) = '1' then
                    reg(6) <= data_in;
                    
                elsif decoder_out(7) = '1' then
                    reg(7) <= data_in;
                    
                end if;
                
                if counter + 1 = "1000" then 
                    flagFull <= '1';   
                end if;  
                
                flagEmpty <= '0';
                wrptr <= wrptr + 1;
                counter <= counter + 1;
            end if;
            
            if rd = '1' and flagEmpty = '0' then
                if counter - 1 = "0000" then
                    flagEmpty <= '1';
                end if;
                
                flagFull <= '0';
                rdptr <= rdptr + 1;
                counter <= counter - 1;
                
                data_out <= mux_out;
            else 
                data_out <= "ZZZZZZZZ";
            end if;
        end if;
        
    end process;
    
    full <= flagFull;
    empty <= flagEmpty;
    
    
end Behavioral;
