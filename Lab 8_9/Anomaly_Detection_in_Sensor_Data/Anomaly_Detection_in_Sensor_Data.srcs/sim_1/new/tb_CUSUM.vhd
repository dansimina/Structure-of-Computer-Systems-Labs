----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2024 11:16:16 AM
-- Design Name: 
-- Module Name: tb_CUSUM - Behavioral
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
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_CUSUM is
--  Port ( );
end tb_CUSUM;

architecture Behavioral of tb_CUSUM is

component CUSUM is
    Port (
         aclk : IN STD_LOGIC;
         aresetn : IN STD_LOGIC;
         s_axis_currentX_tvalid : IN STD_LOGIC;
         s_axis_currentX_tready : OUT STD_LOGIC;
         s_axis_currentX_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_previousX_tvalid : IN STD_LOGIC;
         s_axis_previousX_tready : OUT STD_LOGIC;
         s_axis_previousX_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_drift_tvalid : IN STD_LOGIC;
         s_axis_drift_tready : OUT STD_LOGIC;
         s_axis_drift_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_threshold_tvalid : IN STD_LOGIC;
         s_axis_threshold_tready : OUT STD_LOGIC;
         s_axis_threshold_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_label_tvalid : OUT STD_LOGIC;
         m_axis_label_tready : IN STD_LOGIC;
         m_axis_label_tdata : OUT STD_LOGIC
    );
end component;

signal aclk : STD_LOGIC := '0';
signal aresetn : STD_LOGIC := '0';
signal s_axis_currentX_tvalid : STD_LOGIC := '0';
signal s_axis_currentX_tready : STD_LOGIC := '0';
signal s_axis_currentX_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_previousX_tvalid : STD_LOGIC := '0';
signal s_axis_previousX_tready : STD_LOGIC := '0';
signal s_axis_previousX_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_drift_tvalid : STD_LOGIC := '0';
signal s_axis_drift_tready : STD_LOGIC := '0';
signal s_axis_drift_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_threshold_tvalid : STD_LOGIC := '0';
signal s_axis_threshold_tready : STD_LOGIC := '0';
signal s_axis_threshold_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis_label_tvalid : STD_LOGIC := '0';
signal m_axis_label_tready : STD_LOGIC := '1';
signal m_axis_label_tdata : STD_LOGIC := '0';

constant T : TIME := 5ns;

signal rd_count, wr_count : integer := 0;
signal end_of_reading : std_logic := '0';

begin

tb_CUSUM: CUSUM port map (
    aclk => aclk,
    aresetn => aresetn,
    s_axis_currentX_tvalid => s_axis_currentX_tvalid,
    s_axis_currentX_tready => s_axis_currentX_tready,
    s_axis_currentX_tdata => s_axis_currentX_tdata,
    s_axis_previousX_tvalid => s_axis_previousX_tvalid,
    s_axis_previousX_tready => s_axis_previousX_tready,
    s_axis_previousX_tdata => s_axis_previousX_tdata,
    s_axis_drift_tvalid => s_axis_drift_tvalid,
    s_axis_drift_tready => s_axis_drift_tready,
    s_axis_drift_tdata => s_axis_drift_tdata,
    s_axis_threshold_tvalid => s_axis_threshold_tvalid,
    s_axis_threshold_tready => s_axis_threshold_tready,
    s_axis_threshold_tdata => s_axis_threshold_tdata,
    m_axis_label_tvalid => m_axis_label_tvalid,
    m_axis_label_tready => m_axis_label_tready,
    m_axis_label_tdata => m_axis_label_tdata
);

aclk <= not aclk after T / 2;
aresetn <= '0', '1' after T * 5;

s_axis_drift_tvalid <= '1';
s_axis_threshold_tvalid <= '1';
m_axis_label_tready <= '1';

s_axis_drift_tdata <= std_logic_vector (TO_UNSIGNED (50, 32));
s_axis_threshold_tdata <= std_logic_vector (TO_UNSIGNED (200, 32));

-- read values from the input file
    process (aclk)
        file sensor_data : text open read_mode is "DS18B20.txt";
        variable in_line : line;
        variable temperature : std_logic_vector(31 downto 0);
        variable oldTemperature : std_logic_vector(31 downto 0);
        variable space : character;
        variable comma : character;
    begin
        if rising_edge(aclk) then
            if aresetn = '1' and end_of_reading = '0' then
            
                if not endfile(sensor_data) then     
                    
                    if s_axis_currentX_tready = '1' and s_axis_previousX_tready = '1' then     -- read from the file only when the module is ready to accept data
                        readline(sensor_data, in_line);
                        read(in_line, temperature);
                        
                        s_axis_currentX_tvalid <= '1';
                        s_axis_previousX_tvalid <= '1';                        
                        
                        oldTemperature := s_axis_currentX_tdata;
                        
                        if rd_count = 0 then
                            s_axis_previousX_tdata <= temperature;
                        else
                            s_axis_previousX_tdata <= oldTemperature;
                        end if;
                        
                        s_axis_currentX_tdata <= temperature;
                        
                        rd_count <= rd_count + 1;                  
                    else
                        s_axis_currentX_tvalid <= '0';
                        s_axis_previousX_tvalid <= '0';
                    end if;
                        
                else
                    file_close(sensor_data);
                    end_of_reading <= '1';
                end if;
            end if;
        end if;
    end process;
    
    -- write results in the output file
    process 
        file results : text open write_mode is "D:\Documents\Facultate\SSC\Structure-of-Computer-Systems-Labs\Lab 8_9\DS18B20_results.csv"; -- TO DO: provide the absolute path of the project directory followed by "temperature_results.csv"
        variable out_line : line;
    begin
        wait until rising_edge(aclk);
            
        if aresetn = '0' then
            wait until rising_edge(aresetn);
        end if;
    
        if wr_count <= rd_count then
            if m_axis_label_tvalid = '1' then   -- write the result only when it is valid
                write(out_line, wr_count);
                write(out_line, string'(", "));
                write(out_line, m_axis_label_tdata);
                writeline(results, out_line);
                
                wr_count <= wr_count + 1;
            end if;
        elsif end_of_reading = '1' then
            file_close(results);
            wait;
        end if;
    end process;

end Behavioral;
