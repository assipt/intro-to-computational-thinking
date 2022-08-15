# Arrays é a generalização de vetores, matrizes, etc

# Arrays com dimensão 1 ( vetores )

# Criar vetor na mão
v1 = [1,2,3,4,5,6]

ndims(v1)
length(v1)
size(v1)
eltype(v1)

# Para acessar um elemento
v1[1]

v1[2]

v1[2:4]

v1[3:end]

v1[3:end-1]

v1[begin:3]

v2 = [1.0, 2.0, 3.0, 4.0]
ndims(v2)
length(v2)
size(v2)
eltype(v2)

v3 = ["um", "dois", "três"]
ndims(v3)
length(v3)
size(v3)
eltype(v3)

v4 = [1, 1.0, "um"]
ndims(v4)
length(v4)
size(v4)
eltype(v4)

# Concatenar vetores
v1 = [1,2,3]
v2 = [4,5,6]

v3 = [v1; v2] # Equivalente a vcat(v1,v2)
ndims(v3)
length(v3)
size(v3)
eltype(v3)


v4 = [v1,v2] # Criamos um vetor 
ndims(v4)
length(v4)
size(v4)
eltype(v4)


v5 = [v1 v2] # Agora temos uma matriz
ndims(v5)
length(v5)
eltype(v5)
size(v5)
size(v5,1)
size(v5,2)



# Outras maneiras de criar vetores
v6 = zeros(5)

v7 = zeros(Int,5)

v8 = zeros(ComplexF64,5)

v9 = ones(5)
v10 = ones(Int,5)
v11 = ones(ComplexF64,5)


# Booleanos
v12 = trues(5)
v13 = falses(5)


# Matrizes: é a mesma coisa:
v14 = zeros(3,4)
size(v14)
length(v14)

v15 = ones(3,4)


# Arrays multidimensionais:
v16 = zeros(2,3,4,3,2)
size(v16)
length(v16)

# Indexando arrays multidimensionais
x = randn(3,4)

# Segunda coluna
x[:,2]

# Segunda linha
x[2,:]

# Fatiar um bloco

x[2:3,2:4]

strides(x)

x2 = rand(2,3,4)


# Cópias
x = [1,2,3,4]

y = x

y[1] = 999

x[1]

x[1] = 1

y = copy(x)

y[1] = 999

x[1]

# Os slices copiam os dados

x = [1,2,3,4,5,6]

y = x[3:5]

y

y[1] = 999

y

x

# Vista (view)

y = view(x, 3:5)

y[1] = 999

y

x


x[3] = 3

y = @views x[3:5]

y[1] = -999

y

x


# Coisas que parecem com arrays

x = 1:10

typeof(x)


x[1]
x[2]
x[10]

[x;]

collect(x)

y = 1:2:10

collect(y)

typeof(y)
supertype(typeof(y))
supertype(supertype(typeof(y)))
supertype(supertype(supertype(typeof(y))))
supertype(supertype(supertype(supertype(typeof(y)))))

x= 1:10
typeof(x)
supertype(typeof(x))
supertype(supertype(typeof(x)))
supertype(supertype(supertype(typeof(x))))
supertype(supertype(supertype(supertype(typeof(x)))))
supertype(supertype(supertype(supertype(supertype(typeof(x))))))


z = [1,2,3,4]
typeof(z)
supertype(typeof(z))
supertype(supertype(typeof(z)))
supertype(supertype(supertype(typeof(z))))

x = 0:0.1:1
collect(x)

x = range(0, 1, length=11)
typeof(x)
collect(x)

x = range(0,  length=11, step=0.1)
typeof(x)
collect(x)


# Um outro jeito de construir arrays
# Array comprehension

y = [sin(x) for x in range(0, 1, step=0.1)]


# Operações vetorizadas:
x = range(0,1,length=11)
y = 2*x

x + y

sin(x) # Dá erro! Não é como python, R ou matlab

sin.(x)

x = collect(range(0,1,length=11))

y = 2*x

x + y


x + 1 #Erro, não dá para somar vetor com número!

x .+ 1

x * y # Errado! O que é mult. de um vetor por outro

# Quer multiplicação elemento por elemento?

x .* y

x .^ y

x ./ y

using LinearAlgebra

dot(x,y)

x ⋅ y

# Com essa notação de ponto dá para fazer milagre

z = sin.(x)


w = 2 .* x ./ exp.(x) .+ 1 .- cos.(z)

# Mas os pontos enchem o saco:
w = @. 2 * x / exp(x) + 1 - cos(z)

# Dá para fazer sem alocar memória!
w2 = similar(w)

w2 .= 2 .* x ./ exp.(x) .+ 1 .- cos.(z)

# Novamente dá para tirar os pontos
@. w2 =  2 * x / exp(x) + 1 - cos(z)




