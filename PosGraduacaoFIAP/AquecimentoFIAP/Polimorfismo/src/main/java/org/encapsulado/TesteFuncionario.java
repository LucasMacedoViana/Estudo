package org.encapsulado;

public class TesteFuncionario {
    public static void main(String[] args) {
        Funcionario lucas = new Gerente();
        lucas.setNome("Lucas Macedo");
        lucas.setCpf("123.123.123-23");
        lucas.setSalario(2000);

        System.out.println("nome: " + lucas.getNome());
        System.out.println("CPF: " + lucas.getCpf());
        System.out.println("salario: R$" + lucas.getSalario());
        System.out.println("Bonificação: R$"+lucas.getBonificacao());
        System.out.println("Salario Total: R$"+lucas.getSalarioBruot());


    }
}
