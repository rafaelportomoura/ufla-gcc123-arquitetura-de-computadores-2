# Description: Le uma string e imprime ela na tela
# Input: Requests a char[10]
# Output: print a char[10]
################# Data segment #####################
.data
input_message: .asciiz "Enter with a string: "
output_message: .asciiz "Output: "  
string: .asciiz
################# Code segment #####################
.text
.globl main
main:	# main program entry
  la    $a0,input_message	# print input message
  li    $v0,4
  syscall

  la $a0, string
  li $a1, 10
  li $v0, 8 # Read
  syscall
  
  la    $a0,output_message	# print output message
  li    $v0,4
  syscall
	
  la $a0, string
  li $v0, 4 # Print
  syscall
  
  li $v0, 10
  syscall