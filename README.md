# Banked Memory Architecture for Low Power VLSI

![Project Status](https://img.shields.io/badge/status-completed-brightgreen)
![Verilog](https://img.shields.io/badge/language-Verilog-blue)
![Tool](https://img.shields.io/badge/tool-Yosys%20%7C%20STA%20%7C%20GTKWave-orange)
![PDK](https://img.shields.io/badge/PDK-Nangate45%2090nm-yellow)

## 🏗️ **Architecture Diagram**

<img width="3454" height="1534" alt="graphviz (2)" src="https://github.com/user-attachments/assets/34eccb59-7833-4839-aae5-c15e5fd9e178" />


*4-Bank Memory Architecture with Decoder, Mux, and Power FSM*

A 4-bank low-power SRAM architecture with clock gating and power FSM, achieving ~74% dynamic power reduction compared to monolithic memory.

---

## 📋 **Project Overview**

| Parameter | Value |
|-----------|-------|
| **Total Memory** | 256 bytes (4 banks × 64 bytes) |
| **Bank Size** | 64 × 8 SRAM |
| **Technology** | Nangate45 90nm PDK |
| **Clock Frequency** | 100 MHz |
| **Total Power** | 15.0 mW |
| **Timing Slack** | +9.68 ns |

---

## 📁 **Project Structure**

```
banked_memory_project/
├── 📄 RTL Source Files
│ ├── memory_bank.v # Single bank with FSM
│ ├── decoder.v # 2-to-4 decoder
│ ├── mux.v # 4-to-1 multiplexer
│ └── banked_memory.v # Top level (4 banks)
│
├── 🧪 Testbench
│ └── tb_banked_memory.v # Testbench for top level
│
├── 🔧 Synthesis Scripts
│ ├── synth_for_sta.ys # Yosys synthesis script
│ ├── synth_nangate45.ys # Nangate45 synthesis
│ └── synth_output.v # Generated netlist
│
├── 📊 Reports
│ ├── area_report.txt # Area analysis
│ ├── timing_power_nangate45.txt # Nangate45 results
│ └── timing_power_report.txt # Timing & power report
│
├── 🖼️ Schematics
│ ├── banked_memory_diagram.dot
│ ├── banked_memory_diagram.png
│ └── banked_memory_diagram.svg
│
├── 📈 Waveforms
│ ├── banked_memory.vcd
│ ├── memory_bank.vcd
│ └── memory_bank_waveforms.vcd
│
├── 🔍 Equivalence Check
│ └── equiv_check.ys
│
└── 📐 STA Scripts
├── sta_nangate45.tcl
└── sta_synth.tcl


```

## 🚀 **How to Run**

### 1. Simulation
```bash
iverilog -o test_top banked_memory.v memory_bank.v decoder.v mux.v tb_banked_memory.v
vvp test_top
gtkwave banked_memory.vcd
```
## 2. Synthesis (Nangate45)
```
yosys synth_nangate45.ys
```

## 3. STA (Timing/Power)
```
sta sta_nangate45.tcl | tee timing_power_nangate45.txt
```
📸 Schematic

<img width="2119" height="770" alt="banked_memory_diagram" src="https://github.com/user-attachments/assets/6a5df75c-0f17-47bf-9670-a878a4544b9a" />

## 🙏 **Acknowledgments**

- Thapar Institute of Engineering & Technology
- Nangate/Silvaco for 45nm Open Cell Library
- YosysHQ for open-source synthesis tools
- OpenSTA for timing analysis
