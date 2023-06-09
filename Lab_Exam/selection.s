.global sort

sort:
  movq $0, %r8
  call .outer_loop

.outer_loop:
  cmpq %r8, %rsi
  je .return

  movq (%rdi, %r8, 8), %r10
  movq %r8, %r11

  movq %r8, %r9
  call .inner_loop
  movq (%rdi, %r8, 8), %r12
  movq %r12, (%rdi, %r11, 8)
  movq %r10, (%rdi, %r8, 8)

  incq %r8
  jmp .outer_loop

.inner_loop:
  cmpq %r9, %rsi
  je .return

  cmpq %r10, (%rdi, %r9, 8)
  jl .change

  incq %r9
  jmp .inner_loop

.change:
  movq (%rdi, %r9, 8), %r10
  movq %r9, %r11
  incq %r9
  jmp .inner_loop

.return:
  ret
