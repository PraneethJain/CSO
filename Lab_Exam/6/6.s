.global solve

solve:
  movq $0, %r8
  movq $0, %r9

  movq $3, %r10
  movq $2, %r11
  jmp .loop

.loop:
  cmpq %rsi, %r8
  je .done

  movq (%rdi, %r8, 8), %rax
  cqto
  idivq %r10
  cmpq $0, %rdx
  je .next

  movq (%rdi, %r8, 8), %rax
  cqto
  idivq %r11
  cmpq $0, %rdx
  je .add
  jne .next

.add:
  addq (%rdi, %r8, 8), %r9
  jmp .next

.next:
  incq %r8
  jmp .loop

.done:
  movq %r9, %rax
  ret
