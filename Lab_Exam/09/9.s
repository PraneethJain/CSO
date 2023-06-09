.global solve

solve:
  movq $1, %rax
  jmp .loop

.loop:
  call .find
  cmpq $0, %r9
  je .done

  incq %rax
  jmp .loop

.done:
  ret

.find:
  movq $0, %r8 
  jmp .findloop

.findloop:
  cmpq %r8, %rsi
  je .notfound

  cmpq %rax, (%rdi, %r8, 8)
  je .found

  incq %r8
  jmp .findloop

.notfound:
  movq $0, %r9
  ret

.found:
  movq $1, %r9
  ret
