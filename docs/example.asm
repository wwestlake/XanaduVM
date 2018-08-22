; Assembly language example file for Xanadu Virtual Machine

; Create some data

; directives

; imports a compiled module.  Path for modules is set in the VM configuration
import "modules/module"

; resolves a symbol in the loaded module.  This symbol must be exported by the module
resolve module.function

; data

data_start:

  data WORD 0xFFFFFFFFFFFFFFFF  ; creates a data word at data_start
  data BYTE 0x7c                ; creates a single byte imediately after the word
  
copyright:
  data STRING "Copyright (C) 2018, William Westlake"  ; creates at string starting add address "copyright"
  data BYTE 0x00                ; adds a string termination (ZERO)

; code

ENTRY:                          ; ENTRY is a reserved label that marks the main entry point for this code segment

  load r0, data_start           ; loads the address of data_start into r0
  load r1, @data_start          ; uses data_start as the address to load r1, r1 now contain the data word at data_start
  load r2, byte @data_start[8]  ; loads the the single byte at data_start + 8 into r2
  load r3, copyright            ; loads the address of copyright into r3
  jump begin                    ; jumps to the begin symbol
  
  
calc:
  load r4, short 23             ; loads a 4 byte integer value into the register
  load r5, short 32
  add r6, r4, r5                ; adds r6 = r4 + r5
  ret                           ; returns fromt he call
  
begin:
  push r3                       ; pushes r3 onto the stack
  call kernel PRINT r3          ; makes a call into the built in kernel to the print function.
  call local calc               ; calls the local calc symbol
  call far module.function      ; calls a loaded module and function that is not part of this code segment
  halt                          ; halts the process


; this function is an exported symbol
export some_function:
  pop r0                        ; takes the top of the stack to r0
  add r0, 1                     ; adds the imediate value 1 to the register r0
  push r0
  ret                           ; returns to called 
  
  
