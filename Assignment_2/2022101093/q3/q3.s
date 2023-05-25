.global findNearest

findNearest:
  pushq %rbp                                  # store current base pointer
  movq %rsp, %rbp                             # save current stack pointer in rbp

.next:
  decq %rdx                                   # decrement length of array
  cmpq $-1, %rdx                              # if done iterating
  je .done                                    # done
  jmp .loop                                   # otherwise iterate
 
.loop:
  cmpq %rbp, %rsp                             # if stack is empty
  je .stack_empty                             # then go to stack_empty
  jne .stack_not_empty                        # otherwise go to stack_not_empty
 
.stack_empty:
  movq $-1, (%rsi, %rdx, 8)                   # set -1 as the answer if no higher element (stack is empty)
  pushq (%rdi, %rdx, 8)                       # push current element onto the stack
  jmp .next                                   # go to next element

.set_answer:
  pushq (%rdi, %rdx, 8)                       # push current element onto the stack
  movq %rbx, (%rsi, %rdx, 8)                  # set answer for this element as current element of the array
  jmp .next                                   # go to next element

.stack_not_empty:
  movq (%rsp), %rbx                           # store current stack top
  cmpq (%rdi, %rdx, 8), %rbx                  # compare current stack top and current array value 
  jg .set_answer                              # if array value is greater then push it to the stack and set as answer
  popq %r15                                   # otherwise pop the current stack top
  jmp .loop                                   # and loop again without decrementing index

.done:
  movq %rbp, %rsp                             # restore stack pointer
  popq %rbp                                   # restore base pointer
  ret                                         # return

