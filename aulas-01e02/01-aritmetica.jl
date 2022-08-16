# Isso é um comentário

# Aritmética

1+1 # Soma

2*3 # Multiplicação

3-2 # Subtração

2^4 # Potência

4/3 # Divisão

4/2 # Não é inteiro?


# Lista de operadores https://docs.julialang.org/en/v1/manual/mathematical-operations/#Arithmetic-Operators
+10 # mais unário
-10 # menos únario
1+2 # mais binário, soma
1-2 # menos binário, subtração
2*3 # Multiplicação,
2/3 # Divisão
3÷2 # Divisão inteira, 3\divTAB 2
div(3,2) # equivalente a 3÷2

2\3 # Divisão inversa, equivalente a 3/2
2^3 # Potência
3 % 2 # Resto


# Existem diferentes tipos!

typeof(1)

typeof(4/3)

typeof(4/2)

# Diferentes tipos de Inteiros

# Int == Int64 em máquinas de 64 bits
# Int tem sinal
-123

sizeof(-123)

# Existem Inteiros com tamanhos diferentes

Int32(-123) # 32 bits
sizeof(-123)

Int16(-123) # 16 bits
sizeof(Int16(-123))

Int8(-123) # 8 bits
sizeof(Int8(-123))


# O tipo do resultado de uma operação depende do tipo dos operadores:

typeof(-123 + 10)

typeof(Int8(-123) + Int8(10))

typeof(Int8(-123) + 10)

# Existem inteiros sem sinal.
#Imprime em hexadecimal mas não faz diferença

UInt(23)
typeof(UInt(23))
sizeof(UInt(23))

UInt32(23)
typeof(UInt32(23))
sizeof(UInt32(23))

UInt16(23)
typeof(UInt16(23))
sizeof(UInt16(23))

UInt8(23)
typeof(UInt8(23))
sizeof(UInt8(23))

# Existem inteiros de tamanho arbitrário
big(12412)

big(12312) ^ big(123122)

# Hexadeximal

0x9


typeof(0x1)
typeof(0x12)
typeof(0x123)
typeof(0x1234)
typeof(0x12345)
typeof(0x123456)
typeof(0x1234567)
typeof(0x12345678)
typeof(0x123456789)
typeof(0x1234567890)





# Octal
0o7

typeof(0o7)
typeof(0o12123454327)

typeof(0o12123454327)
typeof(0o4352342332467312412)


# Binário
0b1100
typeof(0b1100)
typeof(0b110010111010010101110101010111000011)


# Nem todos os números são Inteiros.
# Vamos usar bastante os números de ponto flutuante

# Ponto flutuante de 64 bits - Float64
1.0
typeof(1.0)
sizeof(1.0)

1.23
typeof(1.23)
sizeof(1.23)

1.23e4
typeof(1.23e4)
sizeof(1.23e4)

# Mas também dá para ser de 32 bits: Float32

Float32(1.1)
1.1f0
1.1f1
1.1f2

typeof(1.1f2)


eps(1.0)  # Precisão
eps(1.5)
eps(2.0)  # Precisão
eps(3.0)  # Precisão
eps(4.0)



# Também tempos ponto flutuante de tamanho arbitrário
big(1.1)

big"1.1"



# Também existem funções!

# Trigonometria
sin(1)

sin(1.0)

cos(1.0)

tan(1.0)

atan(tan(1.0))


# Detalhe interessante: essas funções são implementadas em Julia:
edit(sin, (Float64,))

# Trigonometria em graus!

sind(30)

cosd(60)

tand(45)

atand(1)


# Raízes
sqrt(2) # Raíz quadrada

cbrt(2) # Raíz cúbica

# Potência de novo:
2^2
typeof(2^2)

2^0.5
typeof(2^0.5)




sqrt(-1) # Como é que se trabalha com números complexos?

# Números complexos - tipos paramétricos
1 + 1im
typeof(1 + 1im)

1 + 0im
typeof(1 + 0im)

1.2 + 2.3im
typeof(1.2 + 2.3im)

complex(1,2)
complex(1.0,2)
complex(1,2.0)


sqrt(-1+0im)

real(1+2im)
imag(1+2im)


angle(1+1im)
abs(1+1im)
abs2(1+1im)

# Tudo implementado em Julia!
edit(+, (Complex, Complex))

sin(1+1im)
edit(sin, (Complex,))

# Números racionais
1//2

typeof(1//2)

big(1) // 2

typeof(big(1) // 2)

1//2 * 234//2345

1//2 / 1124312


numerator(2//3)
denominator(2//3)


rationalize(1.1)
rationalize(big(1.1))

# Também tudo implementado em Julia
edit(+, (Rational,Rational))






# Representação em bits dos números
bitstring(0x123456789ABC)

bitstring(-1)

bitstring(1.0)
bitstring(2.0)
bitstring(4.0)
bitstring(8.0)
bitstring(16.0)
bitstring(32.0)

bitstring(1.0)
bitstring(1/2)
bitstring(1/4)
bitstring(1/8)
bitstring(1/16)
bitstring(1/32)

# Cuidado
2^20
2^30
2^40
2^50
2^60
2^61
2^62
2^63 # O que aconteceu!

# A idéia é otimizar. Python promove para inteiro de tamanho arbitrário
# Mas Julia vai passar batido.
# Em dúvida, use BigInt ou o pacote https://github.com/JeffreySarnoff/SaferIntegers.jl



