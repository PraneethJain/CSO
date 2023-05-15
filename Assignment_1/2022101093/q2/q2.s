.global calculate

calculate:
  mov %rdi, %r9                   # a
  mov %rsi, %r10                  # x
  mov %rdx, %r11                  # b
  mov %rcx, %r12                  # y
  jmp .do_a

.do_a:
  cmp $0, %r10
  jle .rightshift_a
  jmp .leftshift_a

.do_b:
  cmp $0, %r12
  jle .rightshift_b
  jmp .leftshift_b

.rightshift_a:
  neg %r10
  mov %r10, %rcx
  sar %cl, %r9 
  jmp .do_b

.leftshift_a:
  mov %r10, %rcx
  sal %cl, %r9
  jmp .do_b

.rightshift_b:
  neg %r12
  mov %r12, %rcx
  sar %cl, %r11
  jmp .done
  
.leftshift_b:
  mov %r12, %rcx
  sal %cl, %r11
  jmp .done

.done:
  add %r11, %r9
  mov %r9, %rax
  ret
