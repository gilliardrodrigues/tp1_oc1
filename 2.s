####################### LEGENDA #######################

### O c�digo foi implementado em MIPS a fim de que pudesse utilizar ponto flutuante e testar o c�digo no MARS, j� que o VENUS SIMULATOR n�o aceita instru��es de ponto flutuante!
# $a0 = N
# $t0 = i
# $t1, f5 = auxiliares
# $f3 = phi
# F�rmula: phi = 1 + 1/phi
#######################################################
.data
	numero0: .float 0.0
	numero1: .float 1.0
.text
### Implementa��o do 'main' para testes:
	li $a0, 16 # Definindo N = 16 para testar a fun��o 'golden_ratio', espera-se um resultado pr�ximo de 1.618034
	li $t0, 0 # i = 0
	lwc1 $f1, numero1 # $f1 = 1.0
	lwc1 $f3, numero0 # phi = 0.0
	jal golden_ratio # Pula para o procedimento 'golden_ratio'
	jal end # Finaliza o programa
	
### Implementa��o da fun��o 'golden_ratio':
	golden_ratio:
		bgt $t0, $a0, exit # if(i > n), parte do equivalente ao while(i <= n) em C
		div.s $f5, $f1, $f3 # $f5 = 1/phi
		add.s $f3, $f1, $f5 # phi = 1 + 1/phi
		addi $t0, $t0, 1 # i++
		beq $0, $0, golden_ratio # Incondicional, parte do equivalente ao while(i <= n) em C
	exit:
		jr $ra
		
### Fim do programa:
	end:
