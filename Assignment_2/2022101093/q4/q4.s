.global special_op

special_op:
  movq $0, %rax                       # set rax as 0
  addq %rdi, %rax                     # add x1
  addq %rsi, %rax                     # add x2
  addq %rdx, %rax                     # add x3
  addq %rcx, %rax                     # add x4
  addq %r8, %rax                      # add x5
  addq %r9, %rax                      # add x6
  addq 8(%rsp), %rax                  # add x7
  subq 16(%rsp), %rax                 # subtract y

  ret                                 # return
