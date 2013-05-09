SEGMENT  CodeSegment:

INIT:
  ;; assume R0 contains 0 based on contruction
  ;; R0: temp variable used for sums
  ;; R1: contains the current factorial value
  ;; R2: contains the number of addition left for a multiple (used for multiplication)
  ;; R3: contains the current factorial (used to progress through the factorial values)
  ;; R4: contains -1 to improve speed

  ;; Initialize the values (get 5,4,-1, and 0 as key values)
  ADD R0, R0, 1
  ADD R1, R1, -4

Loop:  ; for loop until done multiplying 2 numbers
  MULT R0, R0, R1	; R0 *= R1
  ADD R1, R1, 1		; R1++
  BRn Loop		; Check if done computing
  NOP
  NOP
  NOP
  NOP
  NOP

  ADD R1, R2, -4
  NEG R0, R0		; R0 <= -R0
Loop2:
  DIV R0, R0, R1	; R0 /= R1
  ADD R1, R1, 1		; R1++
  BRn Loop2
  NOP
  NOP
  NOP
  NOP
  NOP

  XOR R2, R0, R2	; R2 <= R0
  OR R3, R2, R2		; R3 <= R2
  XOR R2, R2, R0	; R2 <= 0
  ADD R6, R6, 1		; R6 <= 1
  SUB R7, R6, R0	; R7 <= 1 - 2
  SUB R0, R0, R6	; R0 <= 2 - 1
  SUB R0, R0, R6	; R0 <= 1 - 1
  NEG R7, R7		; R7 <= -R7
  NAND R1, R0, R6	; R1 <= no R0 & R6
  
  BSWAP R5, R5		; switch R5 bytes
  BADD R5, R0, R1	; R5 <= R0l + R1l
  SXB R6, R5		; Sign-extend R5l
  ZXB R7, R5		; Zero-extend R5l
  MAX R6, R6, R7	; R6 <= ma(R5, R6)
  MIN R7, R3, R2	; R7 <= mi(R3, R2)

Halt:	;; loop upon self, look for answer in R0
  BRnzp HALT
  NOP
  NOP
  NOP
  NOP
