package org.herdado;

public class TesteContas {

    public static void main(String[] args) {

        ContaCorrente cc = new ContaCorrente(11,111);
        cc.deposita(100);

        ContaPulpanca cp = new ContaPulpanca(22,222);
        cp.deposita(200);
        System.out.println(cc.getSaldo());
        System.out.println(cp.getSaldo());

        cc.transfere(10,cp);

        System.out.println(cc.getSaldo());
        System.out.println(cp.getSaldo());
//
//        Conta conta = new Conta(1337, 23334);
//
//        conta.deposita(200.0);
//
//        System.out.println(conta.getSaldo());
//
//        conta.setAgencia(570);
//
//        System.out.println(conta.getAgencia());
//
//        System.out.println("o total de contas é : " + Conta.getTotal());

    }

}
