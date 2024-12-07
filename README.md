# ACS-Project-5

Requires Library pymtl3:
```
!pip install pymtl3
```

## Python Code Files:
Each testbench produces both a graph for visualization and a csv file containing the results.
- approx_sim.ipynb - Jupyter Notebook file I used for running
- approx_sim_adders.py - all hardware simulation adder implementations using pymtl3
- approx_sim_error.py - testbench for adder performance measuring accuracy
- approx_sim_timing.py - testbench for adder performance measuring execution time
- approx_sim.py - software simulation and testbench for all adders
- export_to_verilog.py - conversion from python/pymtl3 to Verilog

## Incorrect Testbenches:
These files include the old implementations that are outdated and incorrect, but were used for the graphs included in the presentation.
- approx_sim_eval.py
- approx_sim_graph.py
- approx_sim_testbench.py

## Proj 5 Vivado:
Includes all vivado project files (except for the waveform file under `project-5.sim/sim_1/synth/func/xsim`).

## Verilog Files:
Self explanatory.
- full_adder.v
- ripple_carry.v
- reduced.v
- simplified.v
- stochastic.v
- truncated.v
- top_module.v
- testbench.v

## Other:
- Approximate_Computing_Slideshow.pptx