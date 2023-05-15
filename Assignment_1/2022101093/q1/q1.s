.global get_sum 

get_sum:
  mov $0, %r11              # Storing output in r11
  mov $0, %rdx              # Clear remainder register
  mov $0, %r10              # Current loop index
  mov $3, %r12              # Divident
  jmp .loop                 # Start the loop through the array

.loop:
  cmp %rsi, %r10            # If out of array bounds
  je .done                  # Stop

  mov (%rdi,%r10,8), %rax   # Move dividend in its register
  mov $0, %rdx
  idiv %r12                 # Perform the division 
  cmp $0, %rdx              # Check remainder
  je .cond_add              # Add if zero remainder 
  jmp .next                 # Go to next loop

.cond_add:
  add (%rdi,%r10,8), %r11   # Add to the register
  jmp .next                 # Go to next loop

.next:
  inc %r10                  # Increment loop index
  jmp .loop                 # Go to next loop

.done:
  mov %r11, %rax            # Store return value in rax
  ret                       # Return
