import matplotlib.pyplot as plt

df = pd.read_csv("evaluation_results_bit_widths.csv")

# Group by bit width and compute average errors
avg_errors = df.groupby("BitWidth")[["AbsError_Truncated", "AbsError_Simplified", "AbsError_Reduced", "AbsError_Stochastic"]].mean()

# abs er vs bit width
avg_errors.plot(kind="bar", figsize=(10, 6))
plt.title("Average Absolute Error Across Bit Widths")
plt.ylabel("Average Absolute Error")
plt.xlabel("Bit Width")
plt.show()

# relative er vs bit width
rel_errors = df.groupby("BitWidth")[["RelError_Truncated", "RelError_Simplified", "RelError_Reduced", "RelError_Stochastic"]].mean()

rel_errors.plot(kind="line", marker="o", figsize=(10, 6))
plt.title("Average Relative Error Across Bit Widths")
plt.ylabel("Average Relative Error")
plt.xlabel("Bit Width")
plt.legend(title="Adder Type")
plt.show()
