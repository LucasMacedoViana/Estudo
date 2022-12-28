//Tipos e Variaveis

//númericos sem parte fracionada
// byte,short,int,long
//númericos com parte fracionada
// float, double

//Declarando a variaveal
// <tipo> <NomeVariavel> <atribuiçãoDeValor>(opcional)
//exemplos
//int idade;
//int anofabricacao = 2021;
//double salarioMinimo = 2.500;   2.500 != 2500

//variaveis e constante
//tipos primitivos (IMPORTANTE)


public class TiposEVariaveis {
    public static void main(String[] args){
        byte idade = 123;
        short ano = 2021;
        int cep = 21070333; //se começar com zero, talvez tenha que ser outro tipo, string
        long cpf 99988877766L; //se começar com zero, talvez tenha que ser outro tipo, string, prcisa ter o L para nao ser definido como int
        float pi = 3.14F; //se for floate tem que terminar com F
        double salario 1275.33;

        short numeroCurto = 1;
        int numeroNormal = numeroCurto;
        short numeroCurto2 = (short) numeroNormal; //cast

        int numero = 5;
        numero =10;
        System.out.print(numero);

        final double VALOR_DE_PI = 3.14; // constante sempre tem que ter o final antes do tipo

    }

}



