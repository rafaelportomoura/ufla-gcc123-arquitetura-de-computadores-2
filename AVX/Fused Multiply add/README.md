# Fused Multiply Add

Escreva um programa que suporte a entrada de três vetores A, B e C. Uma instrução do AVX deve
realizar uma operação de Fused Multiply Add, conforme apresenta o código abaixo :

```txt
FOR j := 0 to 7
  i := j*32
  IF ((j & 1) == 0)
    dst[i+31:i] := (a[i+31:i] * b[i+31:i]) - c[i+31:i]
  ELSE
    dst[i+31:i] := (a[i+31:i] * b[i+31:i]) + c[i+31:i]
  FI
ENDFOR
dst[MAX:256] := 0
```

Usando uma instrução SIMD do AVX, escreva um código que realize a operação entre os vetores,
considerando que a entrada deve ser independente e selecionada de acordo com os tipos de dados
dos vetores:

a) double (4 x 64bits),  
b) float (8 x 32bits)  
c) integer (8 x 32 bits). 

Apresente os resultados convenientemente na tela para cada tipo de entrada.
