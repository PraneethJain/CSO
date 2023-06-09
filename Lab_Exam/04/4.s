.global solve

solve:
  cmpq $0, %rdi
  je .done
  movq %rsi, %rax
  cqto
  idivq %rdi
  movq %rdi, %rsi
  movq %rdx, %rdi
  jmp solve

.done:
  movq %rsi, %rax
  ret
