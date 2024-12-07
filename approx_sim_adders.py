from pymtl3 import *
import random

class FullAdder(Component):
    def construct(s):
        s.a = InPort()
        s.b = InPort()
        s.cin = InPort()
        s.sum = OutPort()
        s.cout = OutPort()

        @update
        def comb_logic():
            s.sum @= s.a ^ s.b ^ s.cin
            s.cout @= (s.a & s.b) | (s.cin & (s.a ^ s.b))

class RippleCarryAdder(Component):
    def construct(s, nbits=8):
        BitsN = mk_bits(nbits)  # Define dynamic bit type

        # Define ports
        s.a = InPort(BitsN)
        s.b = InPort(BitsN)
        s.cin = InPort(Bits1)
        s.sum = OutPort(BitsN)
        s.cout = OutPort(Bits1)

        # Carry chain
        s.carry = [Wire(Bits1) for _ in range(nbits + 1)]
        s.carry[0] //= s.cin

        # Instantiate full adders
        s.adders = [FullAdder() for _ in range(nbits)]
        for i in range(nbits):
            s.adders[i].a //= s.a[i]
            s.adders[i].b //= s.b[i]
            s.adders[i].cin //= s.carry[i]
            s.adders[i].sum //= s.sum[i]
            s.adders[i].cout //= s.carry[i + 1]

        # Connect the final carry-out
        s.cout //= s.carry[nbits]

class TruncatedAdder(Component):
    def construct(s, nbits=8, truncate_bits=4):
        BitsN = mk_bits(nbits)

        # Define ports
        s.a = InPort(BitsN)
        s.b = InPort(BitsN)
        s.sum = OutPort(BitsN)

        @update
        def comb_logic():
            s.sum @= (s.a >> truncate_bits) + (s.b >> truncate_bits)  # Add truncated MSBs
            s.sum @= truncate_bits  # Mask LSBs

class ReducedCarryAdder(Component):
    def construct(s, nbits=8, carry_limit=4):
        BitsN = mk_bits(nbits)
        BitsC = mk_bits(carry_limit)

        # Define ports
        s.a = InPort(BitsN)
        s.b = InPort(BitsN)
        s.sum = OutPort(BitsN)

        # Define partial wires for truncated inputs
        s.a_partial = Wire(BitsC)
        s.b_partial = Wire(BitsC)
        s.partial_sum = Wire(BitsC)
        s.partial_carry = Wire(Bits1)

        # Connect truncated inputs
        @update
        def assign_partial_inputs():
            s.a_partial @= s.a[:carry_limit]
            s.b_partial @= s.b[:carry_limit]

        # Instantiate the ripple carry adder for truncated bits
        s.ripple = RippleCarryAdder(carry_limit)
        s.ripple.a //= s.a_partial
        s.ripple.b //= s.b_partial
        s.ripple.cin //= Bits1(0)
        s.ripple.sum //= s.partial_sum
        s.ripple.cout //= s.partial_carry

        # Combine partial and upper bits
        @update
        def combine_logic():
            s.sum[:carry_limit] @= s.partial_sum  # Use partial sum
            s.sum[carry_limit:] @= s.a[carry_limit:] ^ s.b[carry_limit:]  # XOR upper bits directly

# class StochasticAdder(Component):
#     def construct(s, nbits=8):
#         BitsN = mk_bits(nbits)

#         # Define ports
#         s.a = InPort(BitsN)
#         s.b = InPort(BitsN)
#         s.sum = OutPort(BitsN)

#         @update
#         def comb_logic():
#             random_mask = BitsN(random.getrandbits(nbits))  # Random mask
#             s.sum @= (s.a ^ s.b) ^ random_mask  # XOR result with randomness

class StochasticAdder(Component):
    def construct(s, nbits=8, seed=0b10101010):
        BitsN = mk_bits(nbits)

        # Define inputs and outputs
        s.a = InPort(BitsN)
        s.b = InPort(BitsN)
        s.sum = OutPort(BitsN)

        # Ensure seed fits within the bit width
        adjusted_seed = seed & ((1 << nbits) - 1)  # Truncate seed to fit nbits

        # Internal state for LFSR
        s.lfsr_state = Wire(BitsN)  # Holds the LFSR current state

        # Register initialization logic
        @update_ff
        def lfsr_logic():
            if s.reset:  # Reset condition
                s.lfsr_state <<= BitsN(adjusted_seed)  # Initialize with adjusted seed value
            else:
                feedback = s.lfsr_state[nbits - 1] ^ s.lfsr_state[nbits - 2]  # Feedback taps
                s.lfsr_state <<= concat(feedback, s.lfsr_state[0:nbits - 1])  # Update LFSR state

        # Stochastic addition logic
        @update
        def comb_logic():
            random_mask = s.lfsr_state
            s.sum @= (s.a ^ s.b) ^ random_mask  # XOR randomness with addition

class SimplifiedLogicAdder(Component):
    def construct(s, nbits=8):
        BitsN = mk_bits(nbits)

        # Define ports
        s.a = InPort(BitsN)
        s.b = InPort(BitsN)
        s.sum = OutPort(BitsN)

        @update
        def comb_logic():
            s.sum @= s.a ^ s.b  # XOR the inputs