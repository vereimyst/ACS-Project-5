from pymtl3 import *
from pymtl3.passes.backends.verilog import VerilogTranslationPass

def export_verilog(design, filename):
    # Apply the Verilog Translation Pass
    design = design.apply(VerilogTranslationPass())

    # Save the translated Verilog code to a file
    with open(filename, "w") as f:
        f.write(design.verilog_code)
    print(f"Verilog file saved to {filename}")

# Example: Export RippleCarryAdder
if __name__ == "__main__":
    # Instantiate your design
    nbits = 8
    ripple_adder = RippleCarryAdder(nbits)

    # Export Verilog
    export_verilog(ripple_adder, f"RippleCarryAdder_{nbits}bit.v")