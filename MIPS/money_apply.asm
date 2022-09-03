# Description: 	Uma pessoa aplicou mensalmente em um fundo de pensão x reais durante 10 anos. Escreva um
#		programa que determine o montante de capital ao final de cada ano durante este período
# Input: Solicita a quantidade mensal aplicada (um número ponto flutuante)
# Output: Retorna o montante por ano
################# Data segment #####################
.data
input_message: .asciiz "Entre com a quantitade aplicada: "
output_message: .asciiz "Montante no ano "  
output_message_aux: .asciiz ": R$"
output_message_br: .ascii "\n"

years: .word 10
months_in_year: .float 12

float_zero: .float 0.0
################# Code segment #####################
.text
.globl main
main:	# main program entry
	# Imprime mensagem de output
	la $a0, input_message
	li $v0, 4
	syscall
	
	# Le montante aplicado
	li $v0, 6
	syscall
	mov.s $f2, $f0
	lwc1 $f0, float_zero
	
	lw $s0, years
	lwc1 $f4, months_in_year
	
	li $t0, 0 
	mov.s $f6, $f0
loop:
	bge $t0, $s0, end
	addiu $t0,$t0,1	
	mul.s $f8,$f2, $f4
	add.s $f6, $f8,$f6
	mov.s $f12, $f6
	jal output_constant
	jal output_float
	j loop
	
end:	
	li $v0, 10
	syscall
	 
output_constant:
	la $a0, output_message
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, output_message_aux
	li $v0, 4
	syscall
	
	jr $ra

output_float:
	li $v0, 2
	syscall
	
	la $a0, output_message_br
	li $v0, 4
	syscall
	
	jr $ra

	
	