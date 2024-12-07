import pandas as pd

class EvaluationTestbench(Component):
    def construct(s, nbits=8):
        BitsN = mk_bits(nbits)

        # Define inputs
        s.a = InPort(BitsN)
        s.b = InPort(BitsN)

        # Instantiate all adders
        s.exact = RippleCarryAdder(nbits)
        s.truncated = TruncatedAdder(nbits, truncate_bits=nbits // 2)
        s.simplified = SimplifiedLogicAdder(nbits)
        s.reduced = ReducedCarryAdder(nbits, carry_limit=nbits // 2)
        s.stochastic = StochasticAdder(nbits)

        # Connect exact adder
        s.exact.a //= s.a
        s.exact.b //= s.b
        s.exact.cin //= Bits1(0)

        # Connect approximate adders
        s.truncated.a //= s.a
        s.truncated.b //= s.b

        s.simplified.a //= s.a
        s.simplified.b //= s.b

        s.reduced.a //= s.a
        s.reduced.b //= s.b

        s.stochastic.a //= s.a
        s.stochastic.b //= s.b

        # Output dictionary to store results
        s.results = []

        @update
        def evaluate_outputs():
            abs_error_truncated = abs(int(s.exact.sum) - int(s.truncated.sum))
            rel_error_truncated = abs_error_truncated / max(1, int(s.exact.sum))

            abs_error_simplified = abs(int(s.exact.sum) - int(s.simplified.sum))
            rel_error_simplified = abs_error_simplified / max(1, int(s.exact.sum))

            abs_error_reduced = abs(int(s.exact.sum) - int(s.reduced.sum))
            rel_error_reduced = abs_error_reduced / max(1, int(s.exact.sum))

            abs_error_stochastic = abs(int(s.exact.sum) - int(s.stochastic.sum))
            rel_error_stochastic = abs_error_stochastic / max(1, int(s.exact.sum))

            # Collect results for this cycle
            s.results.append({
                "A": int(s.a),
                "B": int(s.b),
                "BitWidth": nbits,
                "Exact": int(s.exact.sum),
                "Truncated": int(s.truncated.sum),
                "Simplified": int(s.simplified.sum),
                "Reduced": int(s.reduced.sum),
                "Stochastic": int(s.stochastic.sum),
                "AbsError_Truncated": abs_error_truncated,
                "RelError_Truncated": rel_error_truncated,
                "AbsError_Simplified": abs_error_simplified,
                "RelError_Simplified": rel_error_simplified,
                "AbsError_Reduced": abs_error_reduced,
                "RelError_Reduced": rel_error_reduced,
                "AbsError_Stochastic": abs_error_stochastic,
                "RelError_Stochastic": rel_error_stochastic,
            })

def run_evaluation_testbench_bit_widths(bit_widths, input_range):
    all_results = []  # Collect results for all configurations

    for nbits in bit_widths:
        print(f"Running evaluation for bit width: {nbits}")
        BitsN = mk_bits(nbits)

        tb = EvaluationTestbench(nbits)
        tb.apply(DefaultPassGroup())
        tb.sim_reset()

        for a_val in range(input_range):
            for b_val in range(input_range):
                tb.a @= BitsN(a_val)
                tb.b @= BitsN(b_val)
                tb.sim_tick()

        # Collect results
        all_results.extend(tb.results)

    # Convert results to DataFrame for analysis
    df = pd.DataFrame(all_results)
    df.to_csv("evaluation_results_bit_widths.csv", index=False)
    print("Results saved to evaluation_results_bit_widths.csv")

run_evaluation_testbench_bit_widths(bit_widths=[4, 8, 16, 32, 64], input_range=16)