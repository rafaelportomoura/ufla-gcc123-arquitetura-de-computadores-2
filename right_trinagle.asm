# Description: Dados três números naturais, verificar se eles formam os lados de um triângulo retângulo
# Input: Três numeros naturais
# Output: Retorna o inteiro na base binária
################# Data segment #####################
.data
a_input_message: .asciiz "Entre com o lado a: "
b_input_message: .asciiz "Entre com o lado b: "
c_input_message: .asciiz "Entre com o lado c: "
success_message: .asciiz "É UM TRIÂNGULO RETÂNGULO!"  
error_message: .asciiz "NÃO É UM TRIÂNGULO RETÂNGULO!"  

my_array: 
	.align 2 
	.space 128 # 32 posições multiplicado por 4 bytes
################# Code segment #####################
.text
.globl main
main:	# main program entry

  # imprime a mensagem de entrada para o lado a
  la $a0, a_input_message	
  li $v0, 4
  syscall

  # Lê o inteiro
  li $v0, 5 
  syscall

  move $s0, $v0 # Salva lado a em $s0
  
  # imprime a mensagem de entrada para o lado b
  la $a0, b_input_message	
  li $v0, 4
  syscall

  # Lê o inteiro
  li $v0, 5 
  syscall

  move $s1, $v0 # Salva lado b em $s1
  
  # imprime a mensagem de entrada para o lado c
  la $a0, c_input_message	
  li $v0, 4
  syscall

  # Lê o inteiro
  li $v0, 5 
  syscall

  move $s2, $v0 # Salva lado c em $s2

  
is_triangle:
  add $t0, $s0, $s1
  add $t1, $s0, $s2
  add $t2, $s1, $s2

  ble	$t0, $s2, not_triangle	
  ble	$t1, $s1, not_triangle	
  ble	$t2, $s0, not_triangle	


  move $s4, $ra
  bgt $s1, $s0, sort_side_1
continue1:
  bgt $s2, $s0, sort_side_2
continue2:
  mul	$t0, $s0, $s0	# $t0 = $s0^2
  mul	$t1, $s1, $s1	# $t0 = $s1^2
  mul	$t2, $s2, $s2	# $t0 = $s2^2

  add $t3, $t1, $t2
  sub $t4, $t0, $t3
  bnez $t4, not_triangle

  la $a0, success_message
  li $v0, 4
  syscall
  j end

end:
  li $v0, 10
  syscall

sort_side_1:
  move $t0, $s0
  move $s0, $s1
  move $s1, $t0
  j continue1

sort_side_2:
  move $t0, $s0
  move $s0, $s2
  move $s2, $t0
  j continue2

  
not_triangle:
  la $a0, error_message
  li $v0, 4
  syscall
  j end