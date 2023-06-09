.global solve

solve:
  movq $0, %r8              # Current index
  movq $0, %r10             # Number of zeroes
  movq $0, %r11             # Number of ones
  jmp .countloop

.countloop:
  cmpq %r8, %rsi
  je .startsortloop

  cmpq $0, (%rdi, %r8, 8)
  je .addzero
  jmp .addone

.addzero:
  incq %r10
  jmp .nextcountloop

.addone:
  incq %r11
  jmp .nextcountloop

.nextcountloop:
  incq %r8
  jmp .countloop

.startsortloop:
  movq $0, %r8
  jmp .fillzeros

.fillzeros:
  cmpq $0, %r10
  je .fillones

  movq $0, (%rdi, %r8, 8)
  decq %r10
  incq %r8
  jmp .fillzeros

.fillones:
  cmpq $0, %r11
  je .done

  movq $1, (%rdi, %r8, 8)
  decq %r11
  incq %r8
  jmp .fillones

.done:
  ret
