package org.encapsulado;

public class TestaValores {
    public static void main(String[] args) {
        Conta conta = new Conta(1337,1234);
        conta.setAgencia(-50);
        conta.setNumero(-50);
        System.out.println(conta.getAgencia());
        Conta conta2 = new Conta(1337,1235);
        Conta conta3 = new Conta(1337,1236);
        System.out.println("Numero de contas "+ Conta.getTotal());
    }
}
