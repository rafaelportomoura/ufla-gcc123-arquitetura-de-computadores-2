# Description: 	Os pontos (x, y) que pertencem à figura H (abaixo) são tais que: x ≥ 0, y ≥ 0 e x^2 + y^2 ≤ 1. 
#		Dados n pontos reais (x, y), verifique se cada ponto pertence ou não a H.
# Input: Recebe x(float) e y(float)
# Output: Retorna se pertence ou não
################# Data segment #####################
.data
input_message_x: .asciiz "Entre com x: "
input_message_y: .asciiz "Entre com y: "
in_h: .asciiz "O PONTO PERTENCE A H"
not_h: .asciiz "O PONTO NÃO PERTENCE A H"

max_float: .float 1.0
min_float: .float 0.0

float_zero: .float 0.0
################# Code segment #####################
.text
.globl main
main:	# main program entry
	# Imprime mensagem de input de x
	la $a0, input_message_x
	li $v0, 4
	syscall
	
	# Le x
	li $v0, 6
	syscall
	mov.s $f2, $f0
	lwc1 $f0, float_zero

  	mov.s $f12, $f2
	
  	jal check_number_input

	# Imprime mensagem de input de y
	la $a0, input_message_y
	li $v0, 4
	syscall
	
	# Le y
	li $v0, 6
	syscall
	mov.s $f4, $f0
	lwc1 $f0, float_zero
  
  	mov.s $f12, $f4

  	jal check_number_input
  	
  	# x^2
  	mul.s $f2, $f2,$f2
  	
	# y^2
  	mul.s $f4, $f4, $f4
  	
  	#  x^2 + y^2
	add.s $f6, $f2, $f4
	
	#  x^2 + y^2 <= 1
	lwc1 $f0, max_float
	c.le.s $f6, $f0
	bc1f not_h_f 
	
	la $a0, in_h
	li $v0, 4
	syscall
	
end:	
	li $v0, 10
	syscall

check_number_input: # $f12 é o parâmetro
	lwc1 $f0, max_float
	c.le.s $f12, $f0
	bc1f not_h_f 
	
	lwc1 $f0, min_float
	c.le.s $f12, $f0
	bc1t not_h_f 
	
  	jr $ra	# jump to $ra
 
  
not_h_f:
	la $a0, not_h
	li $v0, 4
	syscall

  	j end

