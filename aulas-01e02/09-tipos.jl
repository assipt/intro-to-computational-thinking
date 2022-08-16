# Você pode criar os seus próprios tipos

struct Tipo1
    a::Int
    b::Float64
end

x = Tipo1(1, 1.0) # Construtor - Criar uma variável com

x.a
x.b 

# Mas não dá para modificar
x.a = 2

# Para isso você precisa de um tipo mutável:
mutable struct Tipo2
    a::Int
    b::Float64
end
y = Tipo2(1, 1.0)

y.a = 2
y.b = 2.0

y

# Camos criar um tipo para números complexos:
struct Complexo1
    re::Float64
    im::Float64
end

x2 = Complexo1(1.0,1.0)

x3 = Complexo1(1,2)

x3.re # É Float64!
# Mas e seu eu quiser criar complexos inteiros ou etc

# Tipos  paramétricos
struct Complexo2{T}  # Olha o parâmetro
    re::T
    im::T
end

y1 = Complexo2{Int}(1,2)
y2 = Complexo2(1,2)
y3 = Complexo2(1.0,3.0)
y4 = Complexo2(1.0,3)

# Olha que interessante dá para criar complexos string:
y5 = Complexo2("um", "dois")
# Faz sentido isso?


# Em geral queremos restringir
struct Complexo3{T<:Real}
    re::T
    im::T
end

y6 = Complexo3("um", "dois")


# Os tipos podem ser abstratos
isabstracttype(Complexo1)
isabstracttype(Complexo3)

isabstracttype(Int)
isabstracttype(Integer)
isabstracttype(Real)
isabstracttype(Number)

# Para que serve isso? Para dar flexibilidade
# Você também pode criar seus tipos abstratos
abstract type PontoAbstrato end

abstract type PontoAbstrato2d <: PontoAbstrato end

struct Ponto2d{T<:Real} <: PontoAbstrato2d
    x::T
    y::T
end


p = Ponto2d(1.0, 2.0)

typeof(p)

typeof(p) <: Ponto2d

typeof(p) <: PontoAbstrato2d

typeof(p) <: PontoAbstrato

isa(p, Ponto2d)
isa(p, PontoAbstrato2d)

struct Polar{T<:Real} <: PontoAbstrato2d
    r::T
    θ::T
end

p2 = Polar(1.0, 45.0)

