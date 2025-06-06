# 32-bit Signed ALU (Gate-Level Design)

This repository contains the Verilog implementation, testbench, waveform output, and RTL schematic diagram for a **32-bit signed Arithmetic Logic Unit (ALU)** designed at the **gate level** for most operations.

---

## 📝 Project Description

This project implements a **32-bit signed ALU** capable of performing a wide range of operations:

### ✅ Supported Operations:
- **Logical Operations**: AND, OR, XOR, NOT  
- **Arithmetic Operations**:  
  - Addition (ADD)  
  - Subtraction (SUB)  
  - **Multiplication (MUL)**: Implemented using **shift-and-add logic** at gate level (not using `*` operator).  
- **Shifting Operations**:  
  - Left Shift  
  - Arithmetic Right Shift (using a **barrel shifter** design)  
- **Comparison Operations**:  
  - Signed less-than (LT)  
  - Signed greater-than (GT)  
  - Signed equal-to (EQ)

✅ **Gate-level implementation** for logical, arithmetic (ADD/SUB), shifting, and comparison operations.  
✅ **Multiplication** uses low-level shift-and-add modules for true gate-level operation.  
✅ **Overflow test cases** included in the testbench to verify behavior under edge conditions.  
✅ **Vivado RTL Analysis diagram** generated for easy understanding of module-level connections.

---

## 📂 Repository Contents

- `ALU.v`: Verilog source code for the 32-bit signed ALU  
- `TB_ALU.v`: Testbench for simulation, including overflow checks  
- `waveform.png`: Simulation waveform illustrating different operations  
- `rtl_schematic.png`: Vivado-generated RTL schematic diagram of the ALU (recommended to upload this)  
- `README.md`: This file!

---

## ⚙️ How to Simulate

1. Open Vivado or any Verilog simulator.  
2. Add `ALU.v` and `TB_ALU.v` to your project.  
3. Set `TB_ALU.v` as the top module.  
4. Run the simulation and observe the waveform (`waveform.png`) for operation verification.

---

## 🔍 RTL Schematic Diagram

The Vivado-generated RTL schematic (`rtl_schematic.png`) has also been included in this repository.  
⚠️ **Note:** Due to the **large gate-level implementation**, the schematic is very detailed and can appear cluttered. It’s included here for completeness and to show the final netlist structure generated by Vivado.


## 💡 FPGA Readiness

✅ **Ready for synthesis and FPGA implementation** on supported devices (like Artix-7, Spartan-7).  
⚠️ **Note:**  
- Vivado **WebPACK edition** (free) supports basic simulation, synthesis, and implementation for smaller FPGA devices.  
- For **advanced device support and bitstream generation** on larger devices, a **paid license** (Vivado Design Edition) is needed.  
- This design is fully compatible with **WebPACK** for simulation and small-to-medium FPGA boards.

---

## 🔬 Future Improvements

- **Gate-level Multiplication**: Enhance shift-and-add multiplication module to integrate fully with the existing gate-level approach (if not already).  
- **Division**: Add division functionality (using restoring or non-restoring division algorithms).  
- **Overflow/Underflow Handling**: Extend to hardware-accurate flags and exception handling.  
- **Timing Analysis**: Perform detailed timing analysis for critical paths (barrel shifter, adders, etc.).  
- **FPGA Testing**: Once licensed, synthesize and test the design on an FPGA board.

---

## 📜 License

This project is licensed under the MIT License.

---

## 🤝 Contributions

Suggestions and improvements are always welcome! Please open an issue or pull request if you find bugs or want to enhance the project.

---

Happy designing and keep tinkering with digital logic! 🚀🔧
