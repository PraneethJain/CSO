.global divide

divide:
  movq %rdi, %r9                      # m
  movq %rsi, %r10                     # n
  movq %rdx, %r11                     # arr

  movq $0, %r14                       # Store quotient in r14 
  movq $0, %r15                       # Store remainder in r15
  
  cmpq $0, %r10                       # Compare 0 with denomatinator
  je .zero                            # If denominator is 0
  jg .denominator_positive            # If denominator is positive
  jl .denominator_negative            # If denominator is negative

.zero:
  movq $-1, %r14                      # Set quotient as -1
  movq $-1, %r15                      # Set remainder as -1
  jmp .done                           # Done

.denominator_positive:
  cmpq $0, %r9                        # Compare 0 with numerator
  je .all_zero                        # Return two zeros
  jg .all_positive                    # Solve with both positive
  jl .num_neg_den_pos                 # Solve with negative numerator and positive denominator

.denominator_negative:
  cmpq $0, %r9                        # Compare 0 with numerator
  je .all_zero                        # Return two zeros
  jg .num_pos_den_neg                 # Solve with positive numerator and negative denominator
  jl .all_negative                    # Solve with both negative

.all_zero:
  movq $0, %r14                       # Set quotient as 0
  movq $0, %r15                       # Set remainder as 0
  jmp .done                           # Done

.all_positive:
  cmpq %r10, %r9                      # Compare the current remainder with the divisor
  jl .finish_all_positive             # If it is smaller, the division is complete

  incq %r14                           # Increment the quotient
  subq %r10, %r9                      # Subtract divisor from current remainder

  jmp .all_positive                   # Loop

.finish_all_positive:
  movq %r9, %r15                      # Move latest remainder to remainder registor
  jmp .done                           # Done

.num_neg_den_pos:
  cmpq $0, %r9                        # Compare current remainder with zero
  jge .finish_num_neg_den_pos         # If it is non negative, the division is complete

  incq %r14                           # Increment the quotient
  addq %r10, %r9                      # Subtract the modulus of the divisor from the current remainder

  jmp .num_neg_den_pos                # Loop

.finish_num_neg_den_pos:
  negq %r14                           # The quotient will be negative
  movq %r9, %r15                      # Move latest remainder to remainder registor
  jmp .done                           # Done

.num_pos_den_neg:
  cmpq $0, %r9                        # Compare current remainder with zero
  jl .finish_num_pos_den_neg          # If it is negative, the division is one step after completion

  incq %r14                           # Increment the quotient
  addq %r10, %r9                      # Subtract the modulus of the divisor from the current remainder

  jmp .num_pos_den_neg                # Loop

.finish_num_pos_den_neg:
  movq %r9, %r15                      # Move latest remainder to remainder registor
  negq %r10                           # Negate the divisor so it becomes positive
  negq %r14                           # Negate the quotient so it becomes negative
  addq %r10, %r15                     # Add the divisor to the remainder to get positive remainder
  incq %r14                           # Increment the quotient as divisor was just added
  jmp .done                           # Done

.all_negative:
  cmpq $0, %r9                        # Compare current remainder with zero
  jge .finish_all_negative            # If it is non negative, the division is complete

  incq %r14                           # Increment the quotient
  subq %r10, %r9                      # Subtract the divisor from the current remainder

  jmp .all_negative                   # Loop

.finish_all_negative:
  movq %r9, %r15                      # Move latest remainder to remainder registor
  jmp .done                           # Done

.done:
  movq $0, %r13                       # Make r13 index of array 
  movq %r14, (%r11, %r13, 8)          # Set 0 index of array as 0
  incq %r13                           # Increment the index
  movq %r15, (%r11, %r13, 8)          # Set 1 index of array as 0
  ret                                 # Return
