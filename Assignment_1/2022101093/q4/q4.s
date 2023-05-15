.global get_product_assembly

get_product_assembly:
  movq $0, %r9                            # Set loop index as 0 
  movq $1, %rax                           # Set product as 1
  movq $1, %r10                           # Storing 1 in r10 for movq

  jmp .loop

.loop:
  cmpq $10, %r9                           # Compare loop index and 10
  je .done                                # If equal, then done

  incq %r9                                # Increment loop index
  imulq (%rdi), %rax                      # Multiply with product
  movq (%rdi, %r10, 8), %rdi              # Going to next node
  
  jmp .loop                               # Loop

.done:
  ret                                     # Return
