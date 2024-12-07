import time
import pandas as pd
import matplotlib.pyplot as plt

class IndependentExecutionTimeTestbench(Component):
    def construct(s, nbits=8, adder_type="exact"):
        BitsN = mk_bits(nbits)

        # Define inputs
        s.a = InPort(BitsN)
        s.b = InPort(BitsN)

        # Instantiate selected adder
        if adder_type == "exact":
            s.adder = RippleCarryAdder(nbits)
            s.adder.a //= s.a
            s.adder.b //= s.b
            s.adder.cin //= Bits1(0)

        elif adder_type == "truncated":
            s.adder = TruncatedAdder(nbits, truncate_bits=nbits // 2)
            s.adder.a //= s.a
            s.adder.b //= s.b

        elif adder_type == "simplified":
            s.adder = SimplifiedLogicAdder(nbits)
            s.adder.a //= s.a
            s.adder.b //= s.b

        elif adder_type == "reduced":
            s.adder = ReducedCarryAdder(nbits, carry_limit=nbits // 2)
            s.adder.a //= s.a
            s.adder.b //= s.b

        elif adder_type == "stochastic":
            s.adder = StochasticAdder(nbits)
            s.adder.a //= s.a
            s.adder.b //= s.b

# Execution Time Measurement Function
def run_independent_execution_time_testbench(bit_widths, input_range=0):
    results = []

    for adder_type in ["exact", "truncated", "simplified", "reduced", "stochastic"]:
        print(f"Measuring execution time for {adder_type} adder...")
        for nbits in bit_widths:
            BitsN = mk_bits(nbits)
            tb = IndependentExecutionTimeTestbench(nbits=nbits, adder_type=adder_type)
            tb.apply(DefaultPassGroup())
            tb.sim_reset()

            start_time = time.time()  # Start timing

            for a_val in range(input_range):
                for b_val in range(input_range):
                    tb.a @= BitsN(a_val)
                    tb.b @= BitsN(b_val)
                    tb.sim_tick()

            end_time = time.time()  # End timing
            execution_time = end_time - start_time

            # Save results
            results.append({
                "BitWidth": nbits,
                "AdderType": adder_type,
                "ExecutionTime": execution_time
            })

    # Save results to CSV
    df = pd.DataFrame(results)
    df.to_csv("execution_time_independent_results.csv", index=False)
    print("Execution time results saved to 'execution_time_independent_results.csv'")

    return df

# Visualization Function
def plot_independent_execution_time_results(csv_file):
    df = pd.read_csv(csv_file)

    plt.figure(figsize=(12, 6))
    for adder_type in df["AdderType"].unique():
        adder_data = df[df["AdderType"] == adder_type]
        plt.plot(adder_data["BitWidth"], adder_data["ExecutionTime"], marker="o", label=adder_type)

    plt.title("Execution Time Comparison Across Adders and Bit Widths")
    plt.xlabel("Bit Width")
    plt.ylabel("Execution Time (seconds)")
    plt.legend(title="Adder Type")
    plt.grid()
    plt.tight_layout()
    plt.savefig("independent_execution_time_comparison.png")
    plt.show()

# Run the Testbench
if __name__ == "__main__":
    bit_widths = [8, 16, 32]  # Define the bit widths
    input_range = 16  # Define the range of inputs for testing
    df = run_independent_execution_time_testbench(bit_widths, input_range)
    plot_independent_execution_time_results("execution_time_independent_results.csv")
