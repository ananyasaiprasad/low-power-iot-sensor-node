# Ultra-Low Power IoT Sensor Node

An ASIC implementation of an ultra-low power IoT sensor node demonstrating low-power digital design techniques using Verilog HDL, Synopsys Design Constraints (SDC), and Unified Power Format (UPF). The project explores power optimization strategies by comparing a baseline implementation with progressively optimized designs.

---

## Project Overview

Battery-operated IoT devices demand highly energy-efficient hardware to maximize operational lifetime. This project investigates the impact of timing optimization and power-aware design methodologies on an ASIC-based IoT sensor node.

The implementation follows a standard ASIC synthesis flow using Cadence Genus and evaluates multiple design configurations through timing, area, power, and Quality of Results (QoR) analysis.

---

## Key Features

- RTL implementation in Verilog HDL
- Logic synthesis using Cadence Genus
- Timing optimization using SDC
- UPF-based power intent implementation
- Clock gating and power gating
- Multi-voltage power domains
- Power, timing, area and QoR analysis
- Comparative evaluation of multiple design configurations

---

## Design Flow

```text
RTL Design
      │
      ▼
Functional Verification
      │
      ▼
Logic Synthesis
      │
      ▼
Timing Constraint Optimization (SDC)
      │
      ▼
Power Intent Specification (UPF)
      │
      ▼
Power, Timing & Area Analysis
      │
      ▼
Design Comparison
```

---

## Project Structure

```text
low-power-iot-sensor-node/

├── docs/            Project documentation
├── rtl/             Verilog source files
├── constraints/     SDC constraint files
├── upf/             UPF power intent
├── scripts/         Cadence Genus TCL scripts
├── reports/         Power, timing, area and QoR reports
├── images/          Architecture diagrams and screenshots
└── README.md
```

---

## Design Configurations

The project compares four different implementations to evaluate the effectiveness of low-power optimization techniques.

| Configuration | SDC | UPF | Purpose |
|---------------|:---:|:---:|---------|
| Baseline | ✗ | ✗ | Reference implementation |
| Optimized SDC | ✓ | ✗ | Timing optimization |
| UPF Implementation | ✗ | ✓ | Power-aware implementation |
| Optimized Design | ✓ | ✓ | Combined low-power optimization |

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Verilog HDL | RTL Design |
| Cadence Genus | Logic Synthesis |
| SDC | Timing Constraints |
| UPF | Power Intent Specification |
| TCL | Design Automation |

---

## Results

The optimized implementation demonstrates improvements in power efficiency through:

- Reduced switching activity using clock gating
- Leakage reduction through power gating
- Structured power management using UPF
- Improved synthesis quality using optimized timing constraints

Detailed synthesis reports and implementation results are available in the `reports/` directory.

---

## Repository Contents

This repository includes:

- RTL source code
- SDC constraint files
- UPF power intent files
- Cadence Genus synthesis scripts
- Timing, power, area and QoR reports
- Project documentation and implementation results

---

## Author

**Ananya Sai Prasad**

B.Tech Electronics and Communication Engineering  
(VLSI Design and Technology)

VIT University, Vellore
