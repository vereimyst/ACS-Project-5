import pandas as pd
import matplotlib.pyplot as plt

class EvaluationTestbench(Component):
    def construct(s, nbits=8, adder_type="exact"):
        BitsN = mk_bits(nbits)

        # Define inputs and outputs
        s.a = InPort(BitsN)
        s.b = InPort(BitsN)
        s.sum = OutPort(BitsN)

        # Instantiate the selected adder
        if adder_type == "exact":
            s.adder = RippleCarryAdder(nbits)
            s.adder.a //= s.a
            s.adder.b //= s.b
            s.adder.cin //= Bits1(0)
            s.adder.sum //= s.sum

        elif adder_type == "truncated":
            s.adder = TruncatedAdder(nbits, truncate_bits=nbits // 2)
            s.adder.a //= s.a
            s.adder.b //= s.b
            s.adder.sum //= s.sum

        elif adder_type == "simplified":
            s.adder = SimplifiedLogicAdder(nbits)
            s.adder.a //= s.a
            s.adder.b //= s.b
            s.adder.sum //= s.sum

        elif adder_type == "reduced":
            s.adder = ReducedCarryAdder(nbits, carry_limit=nbits // 2)
            s.adder.a //= s.a
            s.adder.b //= s.b
            s.adder.sum //= s.sum

        elif adder_type == "stochastic":
            s.adder = StochasticAdder(nbits)
            s.adder.a //= s.a
            s.adder.b //= s.b
            s.adder.sum //= s.sum


def run_evaluation_testbench(bit_widths, input_range):
    results = []

    for adder_type in ["truncated", "simplified", "reduced", "stochastic"]:
        print(f"Evaluating error for {adder_type} adder...")
        for nbits in bit_widths:
            BitsN = mk_bits(nbits)
            exact_tb = EvaluationTestbench(nbits=nbits, adder_type="exact")
            approx_tb = EvaluationTestbench(nbits=nbits, adder_type=adder_type)

            # Apply passes
            exact_tb.apply(DefaultPassGroup())
            approx_tb.apply(DefaultPassGroup())
            exact_tb.sim_reset()
            approx_tb.sim_reset()

            total_abs_error = 0
            total_rel_error = 0
            num_samples = 0

            for a_val in range(input_range):
                for b_val in range(input_range):
                    # Apply inputs
                    exact_tb.a @= BitsN(a_val)
                    exact_tb.b @= BitsN(b_val)
                    approx_tb.a @= BitsN(a_val)
                    approx_tb.b @= BitsN(b_val)

                    # Tick simulation
                    exact_tb.sim_tick()
                    approx_tb.sim_tick()

                    # Collect outputs
                    exact_sum = int(exact_tb.sum)
                    approx_sum = int(approx_tb.sum)

                    # Calculate errors
                    abs_error = abs(exact_sum - approx_sum)
                    rel_error = abs_error / max(abs(exact_sum), 1)

                    total_abs_error += abs_error
                    total_rel_error += rel_error
                    num_samples += 1

            # Average errors
            avg_abs_error = total_abs_error / num_samples
            avg_rel_error = total_rel_error / num_samples

            # Save results
            results.append({
                "BitWidth": nbits,
                "AdderType": adder_type,
                "AvgAbsError": avg_abs_error,
                "AvgRelError": avg_rel_error
            })

    # Save results to CSV
    df = pd.DataFrame(results)
    df.to_csv("evaluation_error_results.csv", index=False)
    print("Error evaluation results saved to 'evaluation_error_results.csv'")

    return df


def plot_evaluation_results(csv_file):
    df = pd.read_csv(csv_file)

    # Plot absolute errors
    plt.figure(figsize=(12, 6))
    for adder_type in df["AdderType"].unique():
        adder_data = df[df["AdderType"] == adder_type]
        plt.plot(adder_data["BitWidth"], adder_data["AvgAbsError"], marker="o", label=f"{adder_type} (Abs Error)")
    plt.title("Average Absolute Error Across Bit Widths")
    plt.xlabel("Bit Width")
    plt.ylabel("Average Absolute Error")
    plt.legend(title="Adder Type")
    plt.grid()
    plt.tight_layout()
    plt.savefig("absolute_error_plot.png")
    plt.show()

    # Plot relative errors
    plt.figure(figsize=(12, 6))
    for adder_type in df["AdderType"].unique():
        adder_data = df[df["AdderType"] == adder_type]
        plt.plot(adder_data["BitWidth"], adder_data["AvgRelError"], marker="o", label=f"{adder_type} (Rel Error)")
    plt.title("Average Relative Error Across Bit Widths")
    plt.xlabel("Bit Width")
    plt.ylabel("Average Relative Error")
    plt.legend(title="Adder Type")
    plt.grid()
    plt.tight_layout()
    plt.savefig("relative_error_plot.png")
    plt.show()


# Run the Testbench
if __name__ == "__main__":
    bit_widths = [8, 16, 32]  # Define bit widths
    input_range = 16  # Define input range for testing
    df = run_evaluation_testbench(bit_widths, input_range)
    plot_evaluation_results("evaluation_error_results.csv")
