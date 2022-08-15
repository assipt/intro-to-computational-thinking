

# Podemos combinar várias expressões em uma só
begin
    println("Primeira linha")
    println("Segunda linha")
    println("Terceira linha")
    x = 10
    y = 20
    x+y # Último valor é retornado
end


z = begin
    println("Primeira linha")
    println("Segunda linha")
    println("Terceira linha")
    x = 10
    y = 20
    x+y # Último valor é retornado
end


z

# Isso é importante no nosso curso porque usaremos Pluto.
# E nos notebooks Pluto, cada célula só pode ter uma expressão.
# Com o begin e end, podemos criar uma expressão combinando várias outras


# Avaliação condicional
# Talvez a coisa mais importante. Calcular algo dependendo de condições

function funcond(x,y)
    if x < y
        println("x é menor que y")
    elseif x > y
        println("x é maior que y")
    else
        println("x é igual a y")
    end
    return nothing
end

funcond(1,2)
funcond(2,1)
funcond(2,2)



# Muitas vezes, queremos escrever a condicional em uma única linha.
# Já vimos o operador ternário ? :

maior(x,y) = x > y ? x : y


# Ao contrário de várias linguagens (C,Python,Matlab),
# nas expressões condicionais é necessário usar um valor booleano
xx = 1
if xx # Vai dar erro
    println("UM")
end

xx = true
if xx # Deveria dar certo
    println("UM")
end


# Curto circuito
# Na operação lógica `e` (&&) caso o lado esquerdo seja falso, nem precisa
# avaliar o lado direito!. Muito útil como controle de fluxo

1 < 2 && println("Imprimiu")

1 > 2 && println("Não imprimiu")


# Da mesma maneira, em uma operação lógica `ou` (||) caso o lado esquerdo
# seja verdadeiro, já sabemos que a expressão lógica é verdadeira e não
# precisamos executar o lado direito. Útil também

1 < 2 || println("Não imprimiu")

1 > 2 || println("Imprimiu")


# Assim, estas construção são úteis para casos assim

if cond  # Condição é verdadeira
    println("Cond verdadeira")
end

# Equivalente a
cond && println("Cond verdadeira")

# Da mesma maneira,

if !cond
    prinlnt("Cond não é verdadeira")
end

cond || println("Cond não é verdadeira")


# let - Ambiente isolado
let a=1, b=2
    aa = 2a
    bb = b*b
    aa + aa*bb
end

     

#=====================
 Laços e repetições
 =====================#

# Mecanismo básico:


function somarnum(n)

    s = 0
    i = 1
    while i <= n # Enquanto a condição for verdadeira, repetir
        s += i
        i += 1  # Cuidado para não entrar num laço infinito!
    end
    return s
end

# Algumas vezes você quer ir para a próxima iteração
function somarpar(n)
    s = 0
    i = 1
    while i <= n
        if iseven(i)
            s += i
            i += 1
        else
            i += 1
            continue # Vai para a próxima iteração
        end
    end

    return s
end


function somarmax(n, smax)
    s = 0
    i = 1
    while i <= n
        s += i
        i += 1
        s > smax && break
    end
    return s
end

         
# Muitas vezes você precisa que o laço seja executado pelo menos uma vez.
# e você quer verificar a condição no final:
function execumavez(n)
    i = 0
    while true # Vai executar para sempre? Veja abaixo
        println(i)
        i += 1
        i < n || break
        #= Poderia ser isso
        if !(i < n)
        break
        end
        =#
    end
end

    
# Na maioria das vezes você sabe o que você quer iterar exatamente.
# Para isso existe o laço `for`

for i in 1:10
    println(i)
end

# Detalhe: i nessa função é uma variável local:
i = -1
for i in 1:10
    println(i)
end
println("---- $i")


# É possível compor laços e ifs:
for i in 1:10
    for j in 1:10
        s = i*j
        println("($i, $j) => $s")
        if s > 50
            break
        end
    end
end

# Mas dá para coloca os laços na mesma linha
for i in 1:2, j in 3:4
    println( (i,j) )
end



# Veremos mais quando falarmos de arrays


# Exceções
# Nem tudo dá certo na vida. Erros acontecem e o importante é como
# tratamos deles...

sqrt(-1)

"ABCDEF"[7]

# Existem vários tipos de erros e podemos criar novos :

# A variável x deve estar entre -1 e 1

x = 1.1
if abs(x) > 1
    throw(DomainError(x, "Argumento deve estar entre -1 e 1"))
end

# Algo parecido é a funão error que produz um ErrorException
raiz_que_fala(x) = x >= 0 ? sqrt(x) : error("$x é menor que zero. Não sei o que fazer!")


raiz_que_fala(9)

raiz_que_fala(-9)


# Simplesmente parar o programa não é a melhor coisa.
# Já imaginou um programa na sonda de marte simplesmente parando porque deu
# um erro?

xxx = try
    raiz_que_fala(-9)
catch e
    println("Alguma coisa deu errado. Vamos tentar algo diferente")
    1.0
end

yyy = try
    raiz_que_fala(9)
catch e
    println("Alguma coisa deu errado. Vamos tentar algo diferente")
    1.0
end

