LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ControlBarrage IS
  PORT(a4, nwe       : IN    STD_LOGIC;
       a3, a2, a1, a0: IN    STD_LOGIC;
       d3, d2, d1, d0: BUFFER STD_LOGIC);
END ControlBarrage;
ARCHITECTURE Circuit OF ControlBarrage IS
  SIGNAL baddress, bdate_in, bdate_out: STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL uaddress, udate_in, udate_out, udate_out1: UNSIGNED(3 downto 0);
  SIGNAL na4: STD_LOGIC;
  COMPONENT RAM PORT(we, cs          : IN STD_LOGIC;
                     address, date_in: IN UNSIGNED(3 downto 0);
                     date_out        : OUT UNSIGNED(3 DOWNTO 0));
  END COMPONENT;
BEGIN
  baddress <= a3&a2&a1&a0;
  nA4      <= NOT a4;
  bdate_in <= d3&d2&d1&d0;
  d3 <= bdate_out(3); d2 <= bdate_out(2); d1 <= bdate_out(1); d0 <= bdate_out(0);
  uaddress  <= unsigned(baddress);
  udate_in  <= unsigned(bdate_in);
  bdate_out <= std_logic_vector(udate_out) WHEN a4 ='0' ELSE
               std_logic_vector(udate_out1);
  RAM1: RAM PORT MAP(nwe, a4, uaddress,udate_in,udate_out);
  RAM2: RAM PORT MAP(nwe, na4, uaddress,udate_in,udate_out1);
END Circuit;