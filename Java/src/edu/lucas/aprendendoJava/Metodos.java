package edu.lucas.aprendendoJava;

public class Metodos {
    // Estrutura do Metodo
    //TipoRetorno NomeObjetivoNoInfinitivo Parametro(s)
    //exemplos
    //int somar(int numeroUm,int Numero2)
    //String formatarCep(long cep)
    public static void main(String[] args){
        String primeiroNome = "Lucas";
        String segundoNome = "Macedo";
        String nomeCompleto = nomeClompleto(primeiroNome,segundoNome);
        System.out.println(nomeCompleto);
    }
    public static String nomeClompleto(String primeiroNome, String segundoNome){
        return "Resultado do método: " + primeiroNome.concat(" ").concat(segundoNome);
    }
}