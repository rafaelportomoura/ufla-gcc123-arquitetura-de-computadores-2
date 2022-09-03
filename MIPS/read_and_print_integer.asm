# Description: Le uma string e imprime ela na tela
# Input: Requests a integer
# Output: print the integer
################# Data segment #####################
.data
input_message: .asciiz "Enter with a integer: "
output_message: .asciiz "Output: "  
################# Code segment #####################
.text
.globl main
main:	# main program entry
  la    $a0,input_message	# print input message
  li    $v0,4
  syscall

  li $v0, 5 # Read integer
  syscall

  move $t0, $v0 # Save integer
  
  la    $a0,output_message	# print output message
  li    $v0,4
  syscall
 
  move $a0, $t0
  li $v0, 1 # Print integer
  syscall
 
  li $v0, 10
  syscall