.global solve

solve:
  movq $0, %rax
  jmp .loop

.loop:
  cmpq $0, %rdi
  je .done

  movq %rdi, %r8
  andq $1, %r8
  cmpq $1, %r8
  je .add
  jmp .next

.add:
  incq %rax
  jmp .next

.next:
  shr $1, %rdi
  jmp .loop

.done:
  ret
