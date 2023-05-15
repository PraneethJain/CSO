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
  movq $-1, %r14
  movq $-1, %r15
  jmp .done

.denominator_positive:
  cmpq $0, %r9                        # Compare 0 with numerator
  je .all_zero                        # Return two zeros
  jg .all_positive                    # Solve with both positive
  jl .num_neg_den_pos                  # Solve with negative numerator and positive denominator

.denominator_negative:
  cmpq $0, %r9                       # Compare 0 with numerator
  je .all_zero                        # Return two zeros
  jg .num_pos_den_neg                 # Solve with positive numerator and negative denominator
  jl .all_negative                    # Solve with both negative

.all_zero:
  movq $0, %r14
  movq $0, %r15
  jmp .done

.all_positive:
  cmpq %r10, %r9
  jl .finish_all_positive

  incq %r14
  subq %r10, %r9

  jmp .all_positive

.finish_all_positive:
  movq %r9, %r15
  jmp .done

.num_neg_den_pos:
  cmpq $0, %r9
  jge .finish_num_neg_den_pos

  incq %r14
  addq %r10, %r9

  jmp .num_neg_den_pos

.finish_num_neg_den_pos:
  negq %r14
  movq %r9, %r15
  jmp .done

.num_pos_den_neg:
  cmpq $0, %r9
  jl .finish_num_pos_den_neg

  incq %r14
  addq %r10, %r9

  jmp .num_pos_den_neg

.finish_num_pos_den_neg:
  movq %r9, %r15
  negq %r10
  negq %r14
  addq %r10, %r15
  incq %r14
  jmp .done

.all_negative:
  cmpq $0, %r9
  jge .finish_all_negative

  incq %r14
  subq %r10, %r9

  jmp .all_negative

.finish_all_negative:
  movq %r9, %r15
  jmp .done

.done:
  movq $0, %r13                       # Make r13 index of array 
  movq %r14, (%r11, %r13, 8)            # Set 0 index of array as 0
  incq %r13                           # Increment the index
  movq %r15, (%r11, %r13, 8)            # Set 1 index of array as 0
  ret                                 # Return
