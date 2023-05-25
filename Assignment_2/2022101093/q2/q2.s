.global binarySearch

binarySearch:
  movq $2, %r8

  cmpq %rdx, %rsi
  jg .not_found

  movq %rdx, %r9
  addq %rsi, %rdx
  movq %rdx, %rax
  cqto
  idivq %r8
  movq %r9, %rdx
  cmpq (%rdi, %rax, 8), %rcx
  je .found
  jl .less_than
  jg .greater_than

.not_found:
  movq $-1, %rax
  ret

.found:
  ret

.less_than:
  subq $1, %rax
  movq %rax, %rdx
  callq binarySearch
  ret

.greater_than:
  addq $1, %rax
  movq %rax, %rsi
  callq binarySearch
  ret
