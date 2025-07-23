# vhdl-four-bit-adder-multiregister-system
A hardware-based 4-bit adder system with multiple registers, debounced button inputs, clock division, and seven-segment display output built using VHDL on the Basys3 FPGA board, with interactive input handling (switches/buttons) and real-time output display (LEDs/seven segment).

## Features

- **4-bit Adder**  
  Built from cascading full adders, which themselves use half adders internally. It handles carry propagation and outputs a 4-bit sum and a carry-out.

- **Registers (A, B, and Sum)**  
  Three separate 4-bit registers controlled by button inputs. You can load operand A, operand B, and then store the result using the center button.

- **Debounce Module**  
  Each button is debounced to prevent glitches due to mechanical bouncing.

- **Clock Divider**  
  Slows down the system clock to a usable frequency for debouncing and display timing.

- **Seven Segment Display**  
  Displays the current value (A, B, or Sum) depending on the last button pressed. Display selection is handled with a simple state logic.

- **LEDs**  
  Show the current value of the switches for feedback during input.

## Controls

- **Switches (SW0–SW3)**: Used to input 4-bit numbers.
- **Buttons**:  
  - `btnL`: Load input into Register A  
  - `btnR`: Load input into Register B  
  - `btnC`: Store Sum  
  - `btnD`: Clear all registers

## File Breakdown

- `half_adder.vhd`: Basic half adder logic.
- `Full_Adder.vhd`: 1-bit full adder built from two half adders.
- `Four_Bit_Adder_Top.vhd`: Top-level module that wires everything together.
- `Four_Bit_Register.vhd` & `One_Bit_Reg.vhd`: Register implementation for storing 4-bit values.
- `Debounce.vhd`: Debouncing logic for stable button input.
- `Clock_Divider.vhd`: Divides the main clock for timing control.
- `Seven_Segment_Decoder.vhd`: Converts binary input to displayable segments.
- `Adder_Constraints.xdc`: Pin mapping for the Basys3 board.
- `Four_Bit_Adder_Top.bit`: Compiled bitstream for FPGA programming.

## Notes on Design Practice

- No inferred latches are present—every storage element is explicitly clocked.
- Clear signal separation and modular structure to support reuse and testing.
- Designed with simulation and synthesis in mind.
