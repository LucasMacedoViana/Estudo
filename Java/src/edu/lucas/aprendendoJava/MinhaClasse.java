package edu.lucas.aprendendoJava;

public class MinhaClasse {
//    public static void main(String[] args) {
//        System.out.print("Iniciando com Java");
//    }

//    public static void main(String[] args) {
//        int ano = 2022;  //variavel
//        ano=2023;        // pode ser alterada
//        final String BR = "Brasil"; //Constante
//        BR = "Brazil"; // Não pode ser alterada
//    }
    public static void main(String[] args){
        //Estrutura da variavel
        // Tipo NomeBemDefinido = Atribuição (opcional em algunscasos)
        //exemplos
        int idade = 23;
        double altura =1.62;
        //Dog spike;
        String meuNome = "Lucas";

        int anoFabricacao = 2022;
        anoFabricacao = 2000;

        boolean verdadeira = true;
        boolean falso = false;

        String primeiroNome = "Lucas";
        String segundoNome = "Macedo";
        String nomeCompleto = nomeClompleto(primeiroNome,segundoNome);
        System.out.println(nomeCompleto);

    }
    // Estrutura do Metodo
    //TipoRetorno NomeObjetivoNoInfinitivo Parametro(s)
    //exemplos
//    int somar(int numeroUm,int Numero2)
//    String formatarCep(long cep)
    public static String nomeClompleto(String primeiroNome, String segundoNome){
        return "Resultado do método: " + primeiroNome.concat(" ").concat(segundoNome);
    }
}