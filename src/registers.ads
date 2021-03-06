with Stack; use Stack;
with Types; use Types;
with Rom; use Rom;

package Registers is

   type Registers is record
      GeneralRegisters : GeneralRegs := (others => 0);
      I : Addr; -- Address pointer
      DT : Byte; -- Delay Timer
      ST : Byte; -- Sound Timer
      PC : Integer_16;
      Blocked : Integer := -1;
      stack : LifoStack := Stack_Init;
      Screen : Pixel_Buffer := (others => False);
      Pressed_keys : Keys := (others => False);
  end record;
  pragma Pack(Registers);

  mem: RAM := (16#F0#, 16#90#, 16#90#, 16#90#, 16#F0#, -- 0
               16#20#, 16#60#, 16#20#, 16#20#, 16#70#, -- 1
               16#F0#, 16#10#, 16#F0#, 16#80#, 16#F0#, -- 2
               16#F0#, 16#10#, 16#F0#, 16#10#, 16#F0#, -- 3
               16#90#, 16#90#, 16#F0#, 16#10#, 16#10#, -- 4
               16#F0#, 16#80#, 16#F0#, 16#10#, 16#F0#, -- 5
               16#F0#, 16#80#, 16#F0#, 16#90#, 16#F0#, -- 6
               16#F0#, 16#10#, 16#20#, 16#40#, 16#40#, -- 7
               16#F0#, 16#90#, 16#F0#, 16#90#, 16#F0#, -- 8
               16#F0#, 16#90#, 16#F0#, 16#10#, 16#F0#, -- 9
               16#F0#, 16#90#, 16#F0#, 16#90#, 16#90#, -- A
               16#E0#, 16#90#, 16#E0#, 16#90#, 16#E0#, -- B
               16#F0#, 16#80#, 16#80#, 16#80#, 16#F0#, -- C
               16#E0#, 16#90#, 16#90#, 16#90#, 16#E0#, -- D
               16#F0#, 16#80#, 16#F0#, 16#80#, 16#F0#, -- E
               16#F0#, 16#80#, 16#F0#, 16#80#, 16#80#, -- F
               others => 0);

  procedure dump_state(vm :Registers);

  procedure load_rom(index: Integer);

  type CodeAccess is access constant Code;

  function Get_Rom_Code (index: Integer) return CodeAccess;

end Registers;
