.global calculate

calculate:
  mov %rdi, %r9                   # a
  mov %rsi, %r10                  # x
  mov %rdx, %r11                  # b
  mov %rcx, %r12                  # y
  jmp .do_a                       # Calculate the first part

.do_a:
  cmp $0, %r10                    # Compare x with zero
  jle .rightshift_a               # if x is negative then right shift
  jmp .leftshift_a                # else left shift

.do_b:
  cmp $0, %r12                    # Compare y with zero
  jle .rightshift_b               # if y is negative then right shift
  jmp .leftshift_b                # else left shift

.rightshift_a:
  neg %r10                        # make x positive
  mov %r10, %rcx                  # move x into cl register
  sar %cl, %r9                    # right shift a by x
  jmp .do_b                       # Move on to b

.leftshift_a:
  mov %r10, %rcx                  # move x into cl register
  sal %cl, %r9                    # left shift a by x
  jmp .do_b                       # Move on to b

.rightshift_b:
  neg %r12                        # make y positive
  mov %r12, %rcx                  # move y into cl register
  sar %cl, %r11                   # right shift b by y
  jmp .done                       # Calculate final sum
  
.leftshift_b:
  mov %r12, %rcx                  # move y into cl register
  sal %cl, %r11                   # left shift b by y
  jmp .done                       # Calculate final sum

.done:
  add %r11, %r9                   # Add both the values
  mov %r9, %rax                   # Store result in rax
  ret                             # Return statement
