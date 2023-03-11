package org.example;

public class TestaBanco {
    public static void main (String[] args){
        Cliente lucas = new Cliente();
        lucas.nome = "Lucas Macedo";
        lucas.cpf = "123.123.123-12";
        lucas.profissao = "Dev";

        Conta contaDoLucas = new Conta();
        contaDoLucas.depositar(100);
        contaDoLucas.titular = lucas;
        System.out.println(contaDoLucas.titular.nome);

    }
}
