### mapas
- mapeando um inteiro par aum string
- numeros = %{1 => "um", 2=> "dois"} // %{1 => "um", 2=> "dois"}
- numero[2] // "dois"
- numero[3] // nil
- a chave e o valor pode ser de qualquer tipo
- %{"um" => 1, "dois" => 2, "um" => 3} // %{"dois" => 2, "um" => 3}

### Atoms
- IO.puts(:tres) // tres
- é uma variavel ou algum valor onde seu nome é igual ao seu valor
- keyword_list = [{:ok,trues},{:erro,false}]
- keyword_list[:ok] // true
- keyword_list[:erro] // false
- são imutaveis

### Tuplas
- é um conjunto de poucos dados
- primeira_tupla = {"um", 1, 1.0, "I"} // {"um", 1, 1.0, "I"}
- elem(primeira_tupla, 0) // "um"
- elem(primeira_tupla, 2) // 1.0
- representa um conjunto de dados que faz sentido esta sempre junto
- {:ok, "conteudo do arquivo"}
- lucas = {"Lucas Macedo", 30}
- nome_do_lucas = elem(lucas,0)// "Lucas Macedo"
- idade_do_lucas = elem(lucas,1) // 30

### imutabilidade
- languages = ["Elixir","PHP,"JS"]
- List.insert_at(languages,0,"Java") // ["Java","Elixir","PHP,"JS"]
- languages  // ["Elixir","PHP,"JS"]
- languages = List.insert_at(languages,0,"Java") //  ["Java","Elixir","PHP,"JS"]
- languages // ["Java","Elixir","PHP,"JS"]
- contador = 1 // 1
- contador = contador + 1 // 2