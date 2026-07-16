# Results Summary

This directory provides a summary of the experimental results obtained during the implementation of the Ultra-Low Power IoT Sensor Node.

The project was evaluated using three different implementation stages:

- **Baseline Design** – Initial RTL implementation without power optimization.
- **Optimized Design** – RTL synthesized using optimized Synopsys Design Constraints (SDC).
- **Optimized + UPF Design** – Combined implementation using optimized timing constraints and Unified Power Format (UPF)-based power intent.

The comparison focuses on the impact of these optimization techniques on total power consumption.

---

## Key Results

The project demonstrates the effectiveness of applying timing optimization and UPF-based power intent to reduce the power consumption of an ASIC-based IoT sensor node.

| Metric | Baseline | Optimized | Optimized + UPF |
|--------|---------:|----------:|----------------:|
| Total Power | **1.67 mW** | **68.8 µW** | **0.917 µW** |
| Power Reduction | — | **95.88%** | **99.95%** |

The final implementation achieved a **99.95% reduction in total power consumption** compared to the baseline design through the combined application of optimized timing constraints (SDC) and UPF-based power management.


For detailed synthesis reports, refer to the `reports/` directory.
