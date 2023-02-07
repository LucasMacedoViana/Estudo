---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Enum do
    def primeiro(lista) do
        if length(lista) == 0 do
            nil
        else
            hd(lista) 
        end         
    end
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Enum do
    def primeiro(lista) do
        unless length(lista) ==0 do
             hd(lista) 
        end         
    end
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Enum do
    def primeiro([]), do: nil        
    def primeiro(lista), do: hd(lista)    
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Calendario do
    def abreviacao_dia_semana(dia_semana) do
        if dia_semana == :Segunda do
            "Seg"
        else
            if dia_semana == :Terca do
                "Ter"
            else
                if dia_semana == :Quarta do
                    "Qua"
                else
                    if dia_semana == :Quinta do
                        "Qui"
                    else
                        if dia_semana == :Sexta do
                            "Sex"
                        else
                            if dia_semana == :Sabado do
                                "Sab"
                            else
                                "Dom"
                            end
                        end
                    end
                end
            end
        end
    end
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Calendario do
    def abreviacao_dia_semana2(dia_semana) do
        case dia_semana do
            :Segunda -> "Seg"
            :Terca -> "Ter"
            _ -> "Dia inválido"
        end
    end
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Calendario do
    def abreviacao_dia_semana3(dia_semana) do
        cond do
            dia_semana == :Segunda -> "Seg"
            dia_semana == :Terca -> "Ter"
            true -> "Dia inválido"
        end
    end

    def abreviacao_dia_semana4(:Segunda), do: "Seg"
    def abreviacao_dia_semana4(:Terca), do: "Ter"
    def abreviacao_dia_semana4(:Quarta), do: "Qua"
    def abreviacao_dia_semana4(_), do: "Dia inválido"
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Calendario do
    def abreviacao_dia_semana4(:Segunda), do: "Seg"
    def abreviacao_dia_semana4(:Terca), do: "Ter"
    def abreviacao_dia_semana4(:Quarta), do: "Qua"
    def abreviacao_dia_semana4(_), do: "Dia inválido"
end
~~~
---------------------------------------------------------------------------------
~~~elixir
defmodule MeuModulo.Loop do
    def tabuada(multiplicador) do
        tabuada(multiplicador, 1)
    end

    defp tabuada(_, 11), do: nil
    defp tabuada(produto1, produto2) do
        IO.puts("#{produto1} x #{produto2} = #{produto1 * produto2}")
        tabuada(produto1, produto2 + 1)
    end
end
~~~