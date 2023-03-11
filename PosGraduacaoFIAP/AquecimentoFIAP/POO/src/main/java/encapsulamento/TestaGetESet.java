package encapsulamento;

public class TestaGetESet {
    public static void main(String[] args) {
        Conta conta = new Conta(1337,1234);
        //conta.numero = 1336; não funciona
        conta.setNumero(1337);
        System.out.println(conta.getNumero());
        Cliente lucas = new Cliente();
        //conta.titular = "Lucas";
        conta.setTitular(lucas);
        lucas.setNome("Lucas Macedo");
        System.out.println(lucas.getNome());
        System.out.println(conta.getTitular().getNome());
        conta.getTitular().setProfissao("Programador");
        //em duas linhas
        Cliente titularDaConta = conta.getTitular();
        titularDaConta.setProfissao("Programador");

        System.out.println(titularDaConta);
        System.out.println(lucas);
        System.out.println(conta.getTitular());

    }
}
