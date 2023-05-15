.global get_product_assembly

get_product_assembly:
  movq $0, %r9                            # Set loop index as 0 
  movq $1, %rax                           # Set product as 1
  movq $1, %r10                           # Storing 1 in r10 for movq
  movq $9223372036854775807, %r11         # LONG LONG MAX

  jmp .loop

.loop:
  cmpq $10, %r9                           # Compare loop index and 10
  je .done                                # If equal, then done

  incq %r9                                # Increment loop index
  cqto                                    # Sign extend rax into rdx
  imulq (%rdi)                            # Product stored in rdx rax
  idivq %r11                              # Taking module with LLMAX
  movq %rdx, %rax                         # Remainder now stored in return value
  movq (%rdi, %r10, 8), %rdi              # Going to next node
  
  jmp .loop                               # Loop

.done:
  ret                                     # Return
