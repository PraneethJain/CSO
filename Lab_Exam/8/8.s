.global solve

solve:
  call .bubble_sort
  call .swap_alternate
  ret

.swap_alternate:
  movq $0, %r8
  jmp .loop

.loop:
  movq %r8, %r9 
  incq %r9
  cmpq %r9, %rsi
  jle .return

  movq (%rdi, %r8, 8), %r14
  movq (%rdi, %r9, 8), %r15
  movq %r14, (%rdi, %r9, 8)
  movq %r15, (%rdi, %r8, 8)

  addq $2, %r8
  jmp .loop

.bubble_sort:
  movq $0, %r8            # Outer loop index
  call .outer_loop
  ret

.outer_loop:
  cmpq %rsi, %r8
  je .return
  movq $1, %r9            # Inner loop index
  call .inner_loop
  incq %r8
  jmp .outer_loop

.inner_loop:
  cmpq %rsi, %r9
  je .return
  movq (%rdi, %r9, 8), %r14
  movq -8(%rdi, %r9, 8), %r15
  cmpq %r14, %r15
  jg .swap
  jmp .inner_next

.swap:
  movq %r14, -8(%rdi, %r9, 8)
  movq %r15, (%rdi, %r9, 8)
  jmp .inner_next

.inner_next:
  incq %r9
  jmp .inner_loop

.return:
  ret
