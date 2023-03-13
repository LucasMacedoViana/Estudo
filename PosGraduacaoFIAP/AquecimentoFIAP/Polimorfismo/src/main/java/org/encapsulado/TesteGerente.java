package org.encapsulado;

public class TesteGerente {
    public static void main(String[] args) {
        Gerente g1 = new Gerente();
        g1.setNome("Bento");
        g1.setCpf("321.312.321-12");
        g1.setSalario(5000);
        g1.setSenha(2222);

        System.out.println("nome: " + g1.getNome());
        System.out.println("CPF: " + g1.getCpf());
        System.out.println("salario: R$" + g1.getSalario());
        System.out.println("Bonificação: R$"+g1.getBonificacao());
        System.out.println("Salario Total: R$"+g1.getSalarioBruot());

        boolean autenticou = g1.autentica(2222);

        System.out.println(autenticou);
    }
}
