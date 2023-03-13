package org.encapsulado;

public class TesteReferencias {
    public static void main(String[] args) {
        Gerente g1 = new Gerente();
        Funcionario f1 = new Funcionario();
        EditorVideo ev1 = new EditorVideo();
        Designer d1 = new Designer();

        g1.setNome("Lucas");
        String nome = g1.getNome();
        g1.setSalario(5000);

        f1.setNome("Bento");
        String nomeF = f1.getNome();
        f1.setSalario(2000);

        ev1.setNome("sushi");
        String nomeEV = ev1.getNome();
        f1.setSalario(2500);

        d1.setSalario(2000);

        ControlerBonificacao controle = new ControlerBonificacao();
        controle.registra(g1);
        controle.registra(f1);
        controle.registra(ev1);
        controle.registra(d1);

        System.out.println(nome);
        System.out.println(controle.getSoma());
    }
}
