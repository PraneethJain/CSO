.global get_address_smallest

get_address_smallest:
  movq $9223372036854775807, %r9          # Store long long max as current minimum
  movq $0, %r10                           # Loop index
  jmp .loop                               # Loop


.loop:
  cmpq %rsi, %r10                         # Compare current index with total size
  je .done                                # If equal, then done looping through array

  movq (%rdi, %r10, 8), %r11              # Move value at current index to r11
  cmpq %r9, %r11                          # Compare current value with current minimum
  jl .update                              # If current value is smaller, update the minimum and set the address

  incq %r10                               # Increment current loop index
  jmp .loop                               # Loop

.update:
  movq %r11, %r9                          # Update the minimum value
  leaq (%rdi, %r10, 8), %rax              # Set return value as address of minimum value
  incq %r10                               # Increment current loop index
  jmp .loop                               # Loop

.done:
  ret
