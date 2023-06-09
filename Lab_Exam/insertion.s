.global sort

sort:
  movq $1, %r8
  call .outer_loop
  ret

.outer_loop:
  cmpq %r8, %rsi
  je .return

  movq (%rdi, %r8, 8), %r10
  movq %r8, %r9
  decq %r9
  call .inner_loop
  movq %r10, 8(%rdi, %r9, 8)
  incq %r8
  jmp .outer_loop

.inner_loop:
  cmpq $-1, %r9
  je .return
  movq (%rdi, %r9, 8), %r15
  cmpq %r10, %r15
  jle .return

  movq %r15, 8(%rdi, %r9, 8)
  decq %r9
  jmp .inner_loop

.return:
  ret
