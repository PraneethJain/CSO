.global binarySearch

binarySearch:
  movq $2, %r8                                  # to divide

  cmpq %rdx, %rsi                               # if lower index is greater than higher index
  jg .not_found                                 # then not found

  movq %rdx, %r9                                # temporarily store rdx in r9 as it is modified in idivq and next line
  addq %rsi, %rdx                               # calculate sum of left and right
  movq %rdx, %rax                               # divide it by two
  cqto                                          # sign extend rax into rdx
  idivq %r8                                     # divide rax by 2
  movq %r9, %rdx                                # restore rdx
  cmpq (%rdi, %rax, 8), %rcx                    # check if value is found
  je .found                                     # go to found
  jl .less_than                                 # value is lower than current
  jg .greater_than                              # value is higher than current

.not_found:
  movq $-1, %rax                                # set return value as -1
  ret                                           # return

.found:
  ret                                           # index is already stored in rax as result of division, so just return

.less_than:
  subq $1, %rax                                 # value is less than the current range, so reduce mid value by 1
  movq %rax, %rdx                               # and set it as the new r
  callq binarySearch                            # recursion
  ret                                           # return

.greater_than:
  addq $1, %rax                                 # value is greater than the current range, so increase mid value by 1
  movq %rax, %rsi                               # and set it as the new l
  callq binarySearch                            # recursion
  ret                                           # return
