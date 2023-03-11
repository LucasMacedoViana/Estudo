package org.example;


public class TestaMetodo {
    public static void main(String [] args){
        Conta contaDoLucas = new Conta();
        contaDoLucas.depositar(100);
        contaDoLucas.depositar(50);
        System.out.println(contaDoLucas.getSaldo());
        contaDoLucas.sacar(10);
        System.out.println(contaDoLucas.getSaldo());

        Conta contaDaRafaela = new Conta();
        contaDaRafaela.depositar(1000);

        boolean tansferencia = contaDaRafaela.transfere(500,contaDoLucas);

        if(tansferencia){
            System.out.println("Transferencia com sucesso");
        }else {
            System.out.println("faltou dinheiro");
        }

        System.out.println(contaDoLucas.getSaldo());
        System.out.println(contaDaRafaela.getSaldo());
    }
}