import time
import random
import matplotlib.pyplot as plt

def full_adder(a, b, carry_in):
    # Calculate sum and carry-out
    sum_bit = a ^ b ^ carry_in  # XOR for sum
    carry_out = (a & b) | (carry_in & (a ^ b))  # Carry logic
    return sum_bit, carry_out

# ripple carry using full-adder
def multi_bit_adder(a, b, bit_width):
    carry = 0
    result = 0

    for i in range(bit_width):
        # Extract the i-th bit of a and b
        bit_a = (a >> i) & 1
        bit_b = (b >> i) & 1
        
        # Compute the sum and carry for this bit
        sum_bit, carry = full_adder(bit_a, bit_b, carry)
        
        # Add the sum bit to the result
        result |= (sum_bit << i)
    
    return result

# bit truncation
def truncated_adder(a, b, bit_width):
    truncation_bits = bit_width // 2  # Truncate half the bits
    truncation_mask = (1 << (bit_width - truncation_bits)) - 1
    a_truncated = a & truncation_mask
    b_truncated = b & truncation_mask
    return multi_bit_adder(a_truncated, b_truncated, bit_width)

# reduced carry propagation
def reduced_carry_adder(a, b, bit_width):
    carry_limit = bit_width // 2  # Limit carry propagation to half the bits
    carry = 0
    result = 0

    for i in range(bit_width):
        if i >= carry_limit:
            carry = 0  # Ignore carry beyond the limit
        bit_a = (a >> i) & 1
        bit_b = (b >> i) & 1
        sum_bit, carry = full_adder(bit_a, bit_b, carry)
        result |= (sum_bit << i)

    return result

# stochastic
def stochastic_adder(a, b, bit_width):
    error_rate = 1 / (bit_width / 2)  # Adjust error rate based on bit width
    result = 0

    for i in range(bit_width):
        if random.random() < error_rate:
            sum_bit = random.randint(0, 1)  # Introduce error
        else:
            bit_a = (a >> i) & 1
            bit_b = (b >> i) & 1
            sum_bit, _ = full_adder(bit_a, bit_b, 0)
        result |= (sum_bit << i)

    return result

# simplified logic gates
def simplified_logic_adder(a, b, bit_width):
    result = 0

    for i in range(bit_width):
        bit_a = (a >> i) & 1
        bit_b = (b >> i) & 1
        
        # Use OR gate approximation for the sum
        sum_bit = bit_a | bit_b
        result |= (sum_bit << i)
    
    return result

# Generate random test inputs
def generate_test_cases(bit_width, num_cases=10000):
    return [(random.randint(0, (1 << bit_width) - 1), random.randint(0, (1 << bit_width) - 1)) for _ in range(num_cases)]

def calculate_errors(exact, approx, bit_width):
    max_possible_sum = (1 << bit_width) * 2 - 1  # Max sum for given bit width
    absolute_error = abs(exact - approx)
    relative_error = absolute_error / max_possible_sum if max_possible_sum != 0 else 0
    percentage_error = relative_error * 100
    return absolute_error, relative_error, percentage_error

# Breakdown results for specific bit widths
def breakdown_results(test_cases, bit_width):
    results = {}
    for method in ["Truncated", "Reduced Carry", "Simplified", "Stochastic"]:
        results[method] = {"abs_errors": [], "rel_errors": [], "exec_times": []}

    for a, b in test_cases:
        exact = multi_bit_adder(a, b, bit_width)

        # Measure time and calculate errors for each technique
        start = time.time()
        truncated = truncated_adder(a, b, bit_width)
        results["Truncated"]["exec_times"].append(time.time() - start)
        abs_err, rel_err, _ = calculate_errors(exact, truncated, bit_width)
        results["Truncated"]["abs_errors"].append(abs_err)
        results["Truncated"]["rel_errors"].append(rel_err)

        start = time.time()
        reduced_carry = reduced_carry_adder(a, b, bit_width)
        results["Reduced Carry"]["exec_times"].append(time.time() - start)
        abs_err, rel_err, _ = calculate_errors(exact, reduced_carry, bit_width)
        results["Reduced Carry"]["abs_errors"].append(abs_err)
        results["Reduced Carry"]["rel_errors"].append(rel_err)

        start = time.time()
        simplified = simplified_logic_adder(a, b, bit_width)
        results["Simplified"]["exec_times"].append(time.time() - start)
        abs_err, rel_err, _ = calculate_errors(exact, simplified, bit_width)
        results["Simplified"]["abs_errors"].append(abs_err)
        results["Simplified"]["rel_errors"].append(rel_err)

        start = time.time()
        stochastic = stochastic_adder(a, b, bit_width)
        results["Stochastic"]["exec_times"].append(time.time() - start)
        abs_err, rel_err, _ = calculate_errors(exact, stochastic, bit_width)
        results["Stochastic"]["abs_errors"].append(abs_err)
        results["Stochastic"]["rel_errors"].append(rel_err)

    # Calculate averages for each method
    for method in results:
        results[method]["avg_abs_error"] = sum(results[method]["abs_errors"]) / len(results[method]["abs_errors"])
        results[method]["avg_rel_error"] = sum(results[method]["rel_errors"]) / len(results[method]["rel_errors"])
        results[method]["avg_exec_time"] = sum(results[method]["exec_times"]) / len(results[method]["exec_times"])

    return results


if __name__ == "__main__":
    # Evaluate and compare results
    bit_widths = [2, 4, 8, 16, 32, 64]
    errors = {
        "Truncated": [],
        "Reduced Carry": [],
        "Simplified": [],
        "Stochastic": []
    }
    total_errors = {
        "Truncated": 0,
        "Reduced Carry": 0,
        "Simplified": 0,
        "Stochastic": 0
    }
    error_data = {"Truncated": [], "Reduced Carry": [], "Simplified": [], "Stochastic": []}
    time_data = {"Truncated": [], "Reduced Carry": [], "Simplified": [], "Stochastic": []}

    for bit_width in bit_widths:
        print(f"--- Testing for {bit_width}-bit integers ---")
        test_cases = generate_test_cases(bit_width)
        
        for a, b in test_cases:
            exact = multi_bit_adder(a, b, bit_width)
            # Approximate results
            truncated = truncated_adder(a, b, bit_width)
            reduced_carry = reduced_carry_adder(a, b, bit_width)
            simplified = simplified_logic_adder(a, b, bit_width)
            stochastic = stochastic_adder(a, b, bit_width)
            # Calculate errors
            abs_err_trunc, rel_err_trunc, _ = calculate_errors(exact, truncated, bit_width)
            abs_err_rc, rel_err_rc, _ = calculate_errors(exact, reduced_carry, bit_width)
            abs_err_simp, rel_err_simp, _ = calculate_errors(exact, simplified, bit_width)
            abs_err_stoch, rel_err_stoch, _ = calculate_errors(exact, stochastic, bit_width)
            # Accumulate errors
            total_errors["Truncated"] += rel_err_trunc
            total_errors["Reduced Carry"] += rel_err_rc
            total_errors["Simplified"] += rel_err_simp
            total_errors["Stochastic"] += rel_err_stoch
        # Calculate average relative error
        num_cases = len(test_cases)
        errors["Truncated"].append(total_errors["Truncated"] / num_cases)
        errors["Reduced Carry"].append(total_errors["Reduced Carry"] / num_cases)
        errors["Simplified"].append(total_errors["Simplified"] / num_cases)
        errors["Stochastic"].append(total_errors["Stochastic"] / num_cases)

        results = breakdown_results(test_cases, bit_width)

        for method, data in results.items():
            print(f"{method}:")
            print(f"  Average Absolute Error: {data['avg_abs_error']:.2f}")
            print(f"  Average Relative Error: {data['avg_rel_error'] * 100:.2f}%")
            print(f"  Average Execution Time: {data['avg_exec_time'] * 1e6:.2f} µs")
            error_data[method].append(results[method]["avg_rel_error"] * 100)
            time_data[method].append(results[method]["avg_exec_time"] * 1e6)

    # plt.figure(figsize=(10, 6))
    # plt.plot(bit_widths, [e * 100 for e in errors["Truncated"]], label="Truncated")
    # plt.plot(bit_widths, [e * 100 for e in errors["Reduced Carry"]], label="Reduced Carry")
    # plt.plot(bit_widths, [e * 100 for e in errors["Simplified"]], label="Simplified Logic")
    # plt.plot(bit_widths, [e * 100 for e in errors["Stochastic"]], label="Stochastic")

    # plt.xlabel("Bit Width")
    # plt.ylabel("Average Relative Error (%)")
    # plt.title("Average Relative Error vs. Bit Width")
    # plt.legend()
    # plt.grid(True)
    # plt.show()

    # Plot Relative Error
    plt.figure(figsize=(10, 5))
    for method, errors2 in error_data.items():
        plt.plot(bit_widths, errors2, label=f"{method} (Error)", marker='o')

    plt.xlabel("Bit Width")
    plt.ylabel("Average Relative Error (%)")
    plt.title("Relative Error Across Approximation Techniques")
    plt.legend()
    plt.grid(True)
    plt.show()

    # Plot Execution Time
    plt.figure(figsize=(10, 5))
    for method, times in time_data.items():
        plt.plot(bit_widths, times, label=f"{method} (Time)", marker='o')

    plt.xlabel("Bit Width")
    plt.ylabel("Average Execution Time (µs)")
    plt.title("Execution Time Across Approximation Techniques")
    plt.legend()
    plt.grid(True)
    plt.show()
