
# Funções: mapeiam uma sequencia de argumentos a um valor de retorno

# Função f que associa os argumentos x,y a x+y
function f(x,y)
    x+y
end

f(1,2)
f(1.0,2)

code_native(f, (Int,Int))
code_native(f, (Float64,Float64))

# Sem parênteses, `f` se refere ao objeto f

g = f 


# Para funções curtinhas, existe uma outra sintaxe mais comventiente:
f1(x,y) = x+y

dobro(x) = 2x

# Dá para usar unicode
Σ(x,y) = x + y


mult(x,y) = x*y

# Olha que interessante
mult(8,7)  # Nada especial

mult("Hello", " world")

code_native(mult, (Int,Int))

code_native(mult, (String,String))


# É possível declarar os tipos

fib(n::Integer) = n <= 2 ? one(n) : fib(n-1) + fib(n-2)

fib(6)

fib(6.0)

# Vamos destrinchar
## A função tem 1 argumento que deve ser do tipo `Integer`
## `Integer` é um tipo abstrato
isa(1, Integer)

isa(UInt8(1), Integer)

isa(big(1), Integer)

isa(1.0, Integer)

typeof(1)
supertype(typeof(1))
supertype(supertype(typeof(1)))
supertype(supertype(supertype(typeof(1))))
supertype(supertype(supertype(supertype(typeof(1)))))
supertype(supertype(supertype(supertype(supertype(typeof(1))))))

x = UInt32(1)
typeof(x)
supertype(typeof(x))
supertype(supertype(typeof(x)))
supertype(supertype(supertype(typeof(x))))
supertype(supertype(supertype(supertype(typeof(x)))))
supertype(supertype(supertype(supertype(supertype(typeof(x))))))

x = 1.0
typeof(x)
supertype(typeof(x))
supertype(supertype(typeof(x)))
supertype(supertype(supertype(typeof(x))))
supertype(supertype(supertype(supertype(typeof(x)))))


x = 1//2
typeof(x)
supertype(typeof(x))
supertype(supertype(typeof(x)))
supertype(supertype(supertype(typeof(x))))

# A linha n::Integer quer dizer que a função só aceita Algo que for inteiro
# Qualquer outra coisa, dá erro.
# Esta declaração *Não é para eficiencia* é comportamental.
# O código vai compilar para algo eficiente e específico mesmo sem o ::Integer!


## Temos o operador triplo ? :   (expressão lógica) ? verdadeiro : falso
## Execução condicional, igual a linguagem C.

## n <= 2 - Testa se n é menor que dois
## Se for verdade, retorna 1 com o tipo de n:

one(1)

typeof(one(1))

typeof(one(UInt8(1)))

typeof(one(big(1)))

## Se não for verdade, retorna a expressão fib(n-1) + fib(n-2)
## Esta função é recursiva - ela chama ela mesma.
## Para os entendedores: não há tail call optimization
## Vai estourar a pilha uma hora


# Funções podem ter mais de uma expressão
function f3(x,y,z)
    w = x + 2y
    a = 2w + 3z
    3a+4w # Vai retornar esta expressão!
end

# Algumas vezes é mais legível escrever explicitamente o que vai ser retornado
function f4(x,y,z)
    w = x + 2y
    a = 2w + 3z
    return 3a+4w # Agora é explicito# Vai retornar esta expressão!
end


# Se você não quiser retornar nada, use `nothing`.
# Nesse caso você está preocupado com o efeito colateral da função

function imprimir_val(x)
    println("O valor de x é $x")
    return nothing
end

# Neste caso o efeito colateral é mudar o estado da tela - println imprime algo
# no terminal


# Operadores são funções!

1+2

+(1,2)



# Funções anônimas
## São funções sem nome. Mais para frente veremos como são úteis:

dobro_b = x -> 2x
# A  variável dobro_b recebe como valor uma função anônima que recebe
# um argumento e retorna o seu dobro.

dobro_b(10)

# Antecipando um pouco:
v = [1,2,3,4,5,6] # Um vetor com vários elementos

map(x->2x, v) # Aplicar a função anônima a cada elemento do vetor

map(x->x*x, v)


# Tuplas - abstração dos argumentos de funções. MUITO USADO NA LINGUAGEM
(1,2) # Tupla com 2 elementos inteiros

typeof( (1,2) )

(1,) # Tupla com um elemento inteiro

typeof( (1,) )

# As tuplas podem ter 1 ou mais componentes com tipos diferentes

(1, 1.0, "um")

typeof((1, 1.0, "um"))


# As tuplas são usadas para representar os argumentos de função
# Uma função pode retornar um tupla:
somamult(a,b) = a+b, a*b

x = somamult(4,5)

# Você pode desestruturar a tupla
x,y = somamult(4,5)

# Funções com argumentos opcionais

function somar_com(x, y=1) 

    return x + y
end
# y é um argumento opcional

somar_com(1,2)

somar_com(1)


# Argumentos com palavra chave (key-word)
# Até agora os argumentos foram posicionais.
# Algumas vezes é conveniente chamar os argumentos pelo nome
# Repare no `;`
function plotar_teste(x,y; simb="o", cor="Vermelho", esplinha=2)
    println("""
Plotando os pontos $x e $y com:
    - Símbolo: $simb
    - Cor: $cor
    - Espessura da linha: $esplinha
""")
    return nothing
end



