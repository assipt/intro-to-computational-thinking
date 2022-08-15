# Métodos
# Nós já vimos funções.
# Métodos são especializações de funções!
#
#
# Quando você cria uma função, você está criando uma função genérica e um Métodos
fun1(x::Float64, y::Float64) = 2x + y

fun1(2.0, 3.0)
fun1(2,3)

# Você pode dar comportamentos distintos dependendo dos tipos dos argumentos:
# Vamos implementar um outro método de fun1 que funciona com qualquer tipo que seja Number, exceto Float64
fun1(x::Number, y::Number) = 2x - y

fun1(2.0, 3)
fun1(2.0, 3.0f0)
fun1(1, 1//2)

fun1(2, 3+0im)
# 
fun1("dois", "três")
fun1(x,y) = "$x, $y"

# Esses métodos podem ser paramétricos!
# Vamos escrever uma função que verifique se duas variáveis têm o mesmo tipo:
mesmo_tipo(x::T, y::T) where {T} = true

mesmo_tipo(1,2)
mesmo_tipo(1,2.0)

# Ainda precisamos do método para o caso em que os tipos são diferentes
mesmo_tipo(x,y) = false

# A função methods serve para ver os métodos de alguma função genérica:
methods(mesmo_tipo)

methods(+)
# Argumentos opcionais na verdade criam metodos distintos:
fun2(x,y=0) = x+2y

methods(fun2)

# Você pode fazer um tipo se comportar como uma função:

struct  Polinômio{R}
    a::Vector{R}
end

function (p::Polinômio)(x)
    v = p.a[end]
    for i in (length(p.a)-1):-1:1
        v = v*x + p.a[i]
    end
    return v
end

p = Polinômio([1,-2,1])

p(0)
p(1)
p(2)

# A tentação na definição do tipo Polinômio é restringir: R<:Number. Nem sempre é interessante:

M1 = rand(2,2)
M2 = rand(2,2)
M3 = rand(2,2)

p2 = Polinômio([M1, M2, M3])

X = [1 0; 0 1]

p2(X)

p2(X) - (M1 + M2*X + M3*X^2)


