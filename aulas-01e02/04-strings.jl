# Strings - cadeia de caracteres

## Caracteres

'x'
'X'
'a'
'á'
'Á'

typeof('x')
sizeof('x')

Int('x')
Int('á')

Char(225)

# Strings: sequencia de caracteres. Use aspas duplas "
"Isso aqui é uma string"
typeof("Isso aqui é uma string")

# Olha que bizarro
sizeof('a')

sizeof("a")  # Julia codifica as strings em UTF-8

str = "ABCDEF"
str[1]
str[begin]
str[end]
str[end-1]
str[end÷2]

str[2:5]

# Com unicode as coisas são mais chatas:
# String com vários acentos
s = "áéîòü"
s[1]
s[2]
s[3]

length(s)
sizeof(s)

# Concatenando strings

s1 = "Hello"
s2 = "world"

string(s1, ", ", s2, ".\n")

sizeof("🐱")
# * concatena (maioria das linguagens é +)
s1 * ", " * s2 * ".\n"

"ABC"^3

# Interpolação de strings
# Muito conveniente!
nota = 8.5
nome = "João"

"A nota de $nome foi $nota"

# Na verdade é bem mais geral
x1 = 1
x2 = 2

"A soma de $x1 com $x2 é $(x1 + x2)"

# Usando aspas triplas, dá para fazer blocos de texto.
# Vamos usar bastanto isso no Pluto

str = """
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
"""



# Busca em strings

findfirst(isequal('o'), "Paulo Jabardo")
findfirst(isequal('o'), "Fala cara")

findlast(isequal('o'), "Paulo Jabardo")

occursin("mundo", "Oi mundo grande!")
occursin("mundo", "Querida, cheguei!")

# Também tem expressões regulares:
re = r"^\s*(?:#|$)"
typeof(re)

occursin(r"^\s*(?:#|$)", "not a comment")
occursin(r"^\s*(?:#|$)", "# a comment")


# Strings brutas literais
"$(1+1)"
raw"$(1+1)"
