package org.example;

public class CriaCOnta {
    public static void main(String[] args) {
       Conta primeiraConta =  new Conta();
       primeiraConta.depositar(200);
        System.out.println(primeiraConta.getSaldo());
        primeiraConta.depositar(100);
        System.out.println(primeiraConta.getSaldo());

        Conta segundaConta = new  Conta();
        segundaConta.depositar(50);
        System.out.println("Primeira conta tem R$"+ primeiraConta.getSaldo());
        System.out.println("Segunda conta tem R$"+ segundaConta.getSaldo());

        System.out.println(primeiraConta.agencia);
        System.out.println(primeiraConta.numero);
        System.out.println(primeiraConta.titular);


    }
}