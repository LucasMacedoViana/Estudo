package org.example;

public class TesteREferencias {
    public static void main(String[] args) {
        Conta primeiraConta = new Conta();
        primeiraConta.depositar(300);
        System.out.println("saldo da primeira conta " + primeiraConta.getSaldo());

        Conta segundaConta = primeiraConta;
        System.out.println("saldo da segunda conta " + segundaConta.getSaldo());
        segundaConta.depositar(100);
        System.out.println("saldo da segunda conta " + segundaConta.getSaldo());
        System.out.println("saldo da primeira conta " + primeiraConta.getSaldo());
    }
}
