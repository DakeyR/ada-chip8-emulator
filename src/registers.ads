with Stack; use Stack;
with Types; use Types;

with Graphics; use Graphics;
with Keyboard; use Keyboard;

package Registers is
  type Registers is record
      GeneralRegisters : GeneralRegs := (others => 0);
      I : Addr; -- Address pointer
      -- VF : Unsigned_Int_8; -- Flag Register
      DT : Byte; -- Delay Timer
      ST : Byte; -- Sound Timer
      PC : Integer_16;
      SP : Byte;
      -- mem : RAM := (others => 0);
      stack : LifoStack := Stack_Init;
      Screen : Pixel_Buffer := (others => False);
      Pressed_keys : Keys := (others => False);
  end record;
  mem: RAM := (others => 0);
  pragma Pack(Registers);
  procedure dump_state(vm :Registers);
  procedure load_rom;
end Registers;
