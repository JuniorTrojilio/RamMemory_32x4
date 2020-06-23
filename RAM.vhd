LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RAM IS
  PORT(we,cs   : IN  STD_LOGIC;
       address : IN  UNSIGNED (3 downto 0);
       date_in : IN  UNSIGNED (3 downto 0);
       date_out: OUT UNSIGNED (3 downto 0));
END RAM;
ARCHITECTURE Logic OF RAM IS
  TYPE memory_array IS ARRAY(0 to 16) OF UNSIGNED(3 downto 0);
  SIGNAL memory : memory_array;
BEGIN
  PROCESS (cs, address,we)
    BEGIN
      IF cs = '0' THEN
        IF we = '0' THEN
          memory(to_integer(address)) <= date_in;
        ELSE
          date_out <= memory(to_integer(address));
        END IF;
      END IF;
    END PROCESS;
END Logic;