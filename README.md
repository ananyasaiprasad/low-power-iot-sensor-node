# Ultra-Low Power IoT Sensor Node

## Overview

This repository documents the design and optimization of an ultra-low power IoT sensor node implemented using industry-standard ASIC design methodologies.

The objective of this project was to investigate power-aware digital design techniques and evaluate their impact on power consumption, timing performance, and overall design quality. The implementation compares a conventional sensor node with progressively optimized versions using timing constraint optimization and Unified Power Format (UPF)-based power management.

The project was developed using Cadence Genus as part of an academic ASIC design workflow.

---

## Project Objectives

- Design a functional IoT sensor node in Verilog HDL
- Apply timing constraint optimization using SDC
- Implement power-aware design using UPF
- Analyze timing, area, and power characteristics
- Compare baseline and optimized implementations

---

## Low-Power Design Techniques

The optimized implementation incorporates several low-power design methodologies, including:

- Clock gating
- Power gating
- Always-on power domain
- Core power domain
- State retention
- Isolation cells
- Multi-voltage power domains
- Sleep and wake-up management

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
Timing Constraint Optimization
      │
      ▼
UPF-Based Power Intent
      │
      ▼
Power Analysis
      │
      ▼
Timing and Area Evaluation
```

---

## Experimental Configurations

The project evaluates multiple implementation scenarios:

| Configuration | Description |
|--------------|-------------|
| Baseline Design | Original RTL implementation |
| Optimized SDC | Timing constraint optimization |
| UPF Implementation | UPF-based power intent |
| Optimized Design | Combined SDC and UPF optimization |

---

## Repository Structure

```text
docs/
    Project documentation

images/
    Architecture diagrams
    RTL schematics
    Power analysis
    Timing analysis

results/
    Summary tables and implementation results
```

---

## Documentation

The repository includes:

- Project report
- Design methodology
- Experimental results
- ASIC implementation flow
- Power optimization analysis

---

## Important Note

The original RTL source code, UPF files, SDC constraints, TCL scripts, and generated implementation files are not included in this repository because they were developed using licensed university EDA tools and proprietary technology libraries.

This repository focuses on documenting the design methodology, implementation flow, and experimental results.

---

## Author

Ananya Sai Prasad

B.Tech Electronics and Communication Engineering (VLSI Design and Technology)

VIT University, Vellore
