# Power Consumption Comparison

The table below summarizes the total power consumption obtained for each implementation.

| Implementation | Total Power (W) | Total Power | Improvement |
|---------------|----------------:|------------:|------------:|
| Baseline Design | 1.67 × 10⁻³ | 1.67 mW | — |
| Optimized Design | 6.88 × 10⁻⁵ | 68.8 µW | 95.88% Reduction |
| Optimized + UPF | 9.17 × 10⁻⁷ | 0.917 µW | 99.95% Reduction |

## Discussion

The baseline implementation consumed **1.67 mW** of total power. Applying optimized timing constraints through SDC reduced the power consumption to **68.8 µW**, achieving a **95.88% reduction**.

The final implementation combined optimized timing constraints with UPF-based power intent, reducing total power consumption further to **0.917 µW**. This represents an overall **99.95% reduction** compared to the baseline implementation.

These results demonstrate that integrating timing optimization with structured power management techniques significantly improves the energy efficiency of ASIC-based IoT sensor nodes.
