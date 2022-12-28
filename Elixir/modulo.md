### modulo
- é um agrupador de funções
- modulo Kernel é o modulo padrão.


### extensões
- .ex // codigo em elixir
- .exs // condigo de scrip em elixir
#### import
- faz com que não precisemos digitar o nome do modulo na hora de chamar alguma função dele
- conseguimos fazer o importe somente de algumas funções ou de todas as funções com exeção de algumas
- alias: renomear o modulo
- require: requere o modulo para usar as macros dele
- escolo lexico: posso utiliza-las dentro da função e ai ela fica somente em escopo local
~~~~elixir
defmodule MeuModulo do
    def ola_mundo do
        IO.puts("Ola mundo!")
    end
end
~~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo do
    import IO
    def ola_mundo do
        puts("Ola mundo!")
    end
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo do
    import IO, only: [puts: 1]
    import Kernel, except: [inspect: 1]
    def ola_mundo do
        inspect("Ola mundo!")
    end
    
    def inspect(parametro) do
        puts("Começando a inspeção")
        puts(parametro)
        puts("Terminando a inspeção")
    end
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Math do
    def soma(parametro1, parametro2) do
        parametro1 + parametro2
    end
end

defmodule MeuModulo do
    import IO, only: [puts: 1]
    import Kernel, except: [inspect: 1]

    alias MeuModulo.Math, as: MyMath

    def ola_mundo do
        inspect(MyMath.soma(2,2))
    end
    
    def inspect(parametro) do
        puts("Começando a inspeção")
        puts(parametro)
        puts("Terminando a inspeção")
    end
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Math do
    def soma(parametro1, parametro2) do
        parametro1 + parametro2
    end
end 

defmodule MeuModulo do
    import IO, only: [puts: 1]
    import Kernel, except: [inspect: 1]

    alias MeuModulo.Math, as: MyMath

    def ola_mundo do
        inspect(MyMath.soma(2,2))
    end

    def exibe_se_eh_par(numero) do
        require Integer
        puts("O numero #{numero} e par? #{Integer.is_even(numero)}")
    end
    
    def inspect(parametro) do
        puts("Começando a inspeção")
        puts(parametro)
        puts("Terminando a inspeção")
    end
end
~~~