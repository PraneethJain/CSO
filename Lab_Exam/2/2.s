.global solve

solve:
  movq $1, %r8
  movq $15, %r13
  movq $5, %r14
  movq $3, %r15
  jmp .loop

.loop:
  cmpq %rsi, %r8
  jg .done

  movq %r8, %rax
  cqto
  idivq %r13
  cmpq $0, %rdx
  je .fifteen

  movq %r8, %rax
  cqto
  idivq %r14
  cmpq $0, %rdx
  je .five

  movq %r8, %rax
  cqto
  idivq %r15
  cmpq $0, %rdx
  je .three

  movq %r8, (%rdi, %r8, 8)
  jmp .next

.next:
  incq %r8
  jmp .loop

.fifteen:
  movq $-3, (%rdi, %r8, 8)
  jmp .next

.five:
  movq $-2, (%rdi, %r8, 8)
  jmp .next

.three:
  movq $-1, (%rdi, %r8, 8)
  jmp .next

.done:
  ret
