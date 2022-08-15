# intro-to-computational-thinking
Repositório para o curso Introduction to Computational Thinking no IPT

## Página web do curso do MIT

Aqui tem disponível todos os vídeos e materiais do curso.
Nós só estaremos abordando o primeiro módulo do curso.

 * Página web <https://computationalthinking.mit.edu/Spring21/>
 * Repositório github <https://github.com/mitmath/18S191>

## Programando em Julia

O curso utiliza a [linguagem de programação Julia](https://julialang.org/).

Se você precisar de ajuda, dê uma olhada nos links abaixo


 * Documentação oficial <https://docs.julialang.org/en/v1/>
 * Lista de discussão: <https://discourse.julialang.org/> 
     - Muito boa
     - Recomendo participar
 * Wikibook <https://en.wikibooks.org/wiki/Introducing_Julia>
 * Livro sobre data science em Julia <https://juliadatascience.io/>
 * Curso tosco que eu dei para o pessoal do túnel de vento: <http://julia.vento.eng.br/>
 
## Instalação no Windows

* Página de download <https://julialang.org/downloads/>
     - Link direto <https://julialang-s3.julialang.org/bin/winnt/x64/1.7/julia-1.7.3-win64.exe>
     - Precisa do Windows 7 pelo menos.
        * No windows 7 instalar um negócio chamado Windows management framework <https://www.microsoft.com/en-us/download/details.aspx?id=54616>. Instale o arquivo maior (Win7AndW2K8R2-KB3191566-x64.zip)
        * Python - Só até versão 3.8.x! (se for usar o jupyter)
 * Fonte JuliaMono <https://github.com/cormullion/juliamono>
 * Terminal: 
   - Git Bash <https://gitforwindows.org/>  (mintty)
   - ConEmu <https://conemu.github.io/>
   - MSY2 - ambiente "linux" <https://www.msys2.org/> (mintty)
   - WSL - Windows subsystem for linux

## Instalação em Linux

É só baixar e descompactar. Se você quiser, pode configurar a variável `PATH` do teu sistema e usar links simbólicos.

Provavelmente você vai querer 64 bits em arquitetura intel: <https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.3-linux-x86_64.tar.gz>


## Editores


 * **Visual Studio Code** <https://www.julia-vscode.org/>
     - Sintaxe
     - Debugger
     - Terminal
     - Gráficos/etc
 * Emacs <https://github.com/JuliaEditorSupport/julia-emacs>
 * Outros editores <https://github.com/JuliaEditorSupport>
 * Atom <https://junolab.org/> - não há mais desenvolvimento ativo.



## Notebooks

### Jupyter
 * Instale Anaconda <https://www.anaconda.com/products/distribution>
 * Abra o terminal Julia
 ```julia-repl
 julia> import Pkg; Pkg.add("IJulia")
 ```
 * Se for usar apenas Julia, 
 ```julia-repl
 julia> notebook()
install Jupyter via Conda, y/n? [y]: 
```
Aí vai instalar uma versão do Jupyter para você. Cuidado com Windows 7

### Pluto

É isso o que vamos usar mais durante o curso.

```julia-repl
julia> import Pkg; Pkg.add("Pluto")

julia> import Pluto; Pluto.run()
```