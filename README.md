# Breakout Game on Nexys 4 DDR FPGA

This project implements a hardware-based version of the classic arcade game **Breakout** using **Verilog HDL** and the **Digilent Nexys 4 DDR FPGA Board (Artix-7 XC7A100T)**. The game features real-time VGA graphics, user controls via onboard buttons and switches, and score/life tracking using the seven-segment display (SSD). It was completed as a final project for EE 354: Introduction to Digital Systems at USC.

---

## 🎮 Features

- VGA-based graphical output (ball, paddle, blocks)
- Real-time paddle and ball motion with collision physics
- SSD-based scoring and win/lose message display
- Difficulty selection (Easy, Medium, Hard, Impossible) via switches
- Finite State Machine (FSM) controlling gameplay logic
- Win condition: destroy all 24 blocks  
- Lose condition: run out of 3 lives  
- Resettable and replayable design

---

## 🛠️ Tools & Technologies Used

- **Verilog HDL**
- **Vivado Design Suite**
- **Nexys 4 DDR FPGA (Artix-7 XC7A100T-1CSG324C)**
- VGA Interface
- 7-Segment Display Control
- FSM (Moore, one-hot encoding)
- Switch/Button Debouncing
- Synchronous Logic with Clock Divider

---

## 🧩 Project Structure

```bash
├── breakout_game.v         # Core game logic (FSM, collisions, scoring)
├── breakout_top.v          # Top-level integration (I/O, VGA, SSD, game control)
├── display_controller.v    # VGA sync generator and pixel position tracking
├── constraints.xdc         # Pin configuration for Nexys4 DDR board
├── README.md               # Project overview
