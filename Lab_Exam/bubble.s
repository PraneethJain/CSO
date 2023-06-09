.global sort

sort:
  movq $0, %r8
  call .outer_loop
  ret

.outer_loop:
  cmpq %rsi, %r8
  je .return

  movq $0, %r9
  call .inner_loop
  incq %r8
  jmp .outer_loop

.inner_loop:
  movq %r9, %r10
  incq %r10
  cmpq %rsi, %r10
  jge .return

  movq (%rdi, %r9, 8), %r14
  movq (%rdi, %r10, 8), %r15
  cmpq %r14, %r15
  jl .swap

  incq %r9
  jmp .inner_loop

.swap:
  movq %r14, (%rdi, %r10, 8)
  movq %r15, (%rdi, %r9, 8)
  addq $2, %r9
  jmp .inner_loop
 
.return:
  ret
