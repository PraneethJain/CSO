.global is_balanced

is_balanced:
  pushq %rbp                        # save rbp by pushing it to the stack
  movq %rsp, %rbp                   # store current rsp value in rbp
  pushq $-1                         # Push -1 to mark empty stack
  movq $1, %rax                     # Assume string is balanced

  movq $0, %r8                      # current index in string
  jmp .loop                         # start looping through the string

.loop:
  cmpq %r8, %rdi                    # compare current index with length
  je .done                          # done looping through the string
  
  movzbq (%rsi), %r9                # move current character to r9
  addq $1, %rsi                     # go to next character
  
  cmpq $40, %r9                     # if ( then
  je .open                          # push to stack
  cmpq $123, %r9                    # if { then
  je .open                          # push to stack
  cmpq $91, %r9                     # if [ then
  je .open                          # push to stack

  cmpq $41, %r9                     # if ) then
  je .close_round                   # check
  cmpq $125, %r9                    # if } then
  je .close_curly                   # check
  cmpq $93, %r9                     # if ] then
  je .close_square                  # check

.next:
  incq %r8                          # increment string index
  jmp .loop                         # loop

.open:
  pushq %r9                         # push open bracket onto the stack
  jmp .next                         # iterate

.close_round:
  popq %r10                         # store stack top
  cmpq $40, %r10                    # Check if ( was on stack top
  je .next                          # iterate
  movq $0, %rax                     # if bracket is not matched, set answer as 0
  jmp .done                         # done

.close_curly:
  popq %r10                         # store stack top
  cmpq $123, %r10                   # Check if { was on stack top
  je .next                          # iterate
  movq $0, %rax                     # if bracket is not matched, set answer as 0
  jmp .done                         # done

.close_square:
  popq %r10                         # store stack top
  cmpq $91, %r10                    # Check if [ was on stack top
  je .next                          # iterate
  movq $0, %rax                     # if bracket is not matched, set answer as 0
  jmp .done                         # done

.done:
  cmpq $0, %rax                     # if not balanced
  je .return                        # return 

  popq %r10                         # pop from top of stack
  cmpq $-1, %r10                    # if the stack is empty
  sete %al                          # then set answer as 1, otherwise 0
  movzbq %al, %rax                  # extend to rax

.return:
  movq %rbp, %rsp                   # restore rsp value 
  popq %rbp                         # restore rbp value
  ret
