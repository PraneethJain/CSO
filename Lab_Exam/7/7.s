.global solve

# r9 is left sum, r10 is right sum
solve:
  movq $0, %r8
  movq $0, %r9
  movq $0, %r10
  call .create_left_sum
  movq %r9, %rax
  decq %rdx
  decq %rsi
  jmp .loop

.loop:
  cmpq $-1, %rdx
  je .done 
  subq (%rdi, %rdx, 8), %r9
  addq (%rdi, %rsi, 8), %r10
  decq %rsi
  decq %rdx
  movq %r9, %r11
  addq %r10, %r11
  cmpq %rax, %r11
  jg .change
  jmp .loop

.change:
  movq %r11, %rax
  jmp .loop

.next:
  decq %rdx
  jmp .loop

.done:
  ret

.create_left_sum:
  jmp .create_left_loop

.create_left_loop:
  cmpq %r8, %rdx
  je .created_left_sum

  addq (%rdi, %r8, 8), %r9
  incq %r8
  jmp .create_left_loop

.created_left_sum:
  ret
  
