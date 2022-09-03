# Description: Le um inteiro e retorna o seu binário correspondente
# Input: Solicita um inteiro 
# Output: Retorna o inteiro na base binária
################# Data segment #####################
.data
input_message: .asciiz "Enter with a integer: "
output_message: .asciiz "Binary: "  

my_array: 
	.align 2 
	.space 128 # 32 posições multiplicado por 4 bytes
################# Code segment #####################
.text
.globl main
main:	# main program entry

  # imprime a mensagem de entrada
  la $a0,input_message	
  li $v0,4
  syscall

  # Lê o inteiro
  li $v0, 5 
  syscall

  move $s0, $v0 # Save o inteiro lido no registrador $s0
  
  move $s1, $zero # posição para salvar no array de binários

loop:
  srl $t1, $s0, 1 # divide por dois
  sll $t2, $t1, 1 # pega o resultado da divisão e multiplica por dois
  sub $t3, $s0, $t2 # verifica o resto da divisão ($s3 = resto)
  move $s0, $t1 # recarrega o valor do número a ser dividido
  sw $t3, my_array($s1) # salva o resto da divisão no array de binários
  addi $s1,$s1, 4 # incrementa a posição de salvamento do array
  bnez $s0, loop # se o número for diferente de zero continua no loop


  la $a0,output_message	
  li $v0,4
  syscall
  
  subi	$s1, $s1, 4 # decrementa a posição para busca no array
output_binary:
  lw $a0, my_array($s1) # carrega na memória a posição $s1 do array de binários

  # imprime o binário na posição $s1
  li $v0, 1 
  syscall 

  subi	$s1, $s1, 4	# decrementa a posição para busca no array		 
  bge $s1,$zero, output_binary # compara se a posição de busca é maior igual a zero para continuar imprimindo
 
end:
  li $v0, 10
  syscall