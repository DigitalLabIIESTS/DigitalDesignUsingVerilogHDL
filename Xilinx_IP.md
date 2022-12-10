# Using Xilinx IP Cores within our Design
- Some IPs can't be inferred from our coding, like PLL, MMCM(Used to change clock frequency), etc.
- Maybe more optimized as provided by Xilinx.
- IP Catalog -> Search for the IP.

## Out-of-context Module Runs
- Generate -> Out-of-context per IP (provided by the vendors) used in the Verilog Design code.
- Xilinx (Vendors) doesn't provide the IP's actual code.
- Generate -> Provides a synthesized netlist of the IP used.
- .dcp: Stands for Design Checkpoints. It is a proprietary netlist whose content can only be understood by the Xilinx Vivado.
- .xci: Xilinx Core Integrator.
- .veo: Verilog Instantiation Template of the IP.
