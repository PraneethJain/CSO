.global solve

solve:
  movq $0, %r9
  movq $10, %r8
  movq %rdi, %r10
  jmp .loop

.loop:
  cmpq $0, %rdi
  je .done

  movq %rdi, %rax
  cqto
  idivq %r8
  movq %rax, %rdi

  imulq %r8, %r9
  addq %rdx, %r9

  jmp .loop

.done:
  movq %r9, %rax
  cmpq %r10, %rax
  je .true
  jne .false

.true:
  movq $1, %rax
  ret

.false:
  movq $0, %rax
  ret
