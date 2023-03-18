package org.herdado;

public class ContaPulpanca extends Conta {
    public ContaPulpanca(int agencia, int numero) {
        super(agencia, numero);
    }

    @Override
    public void deposita(double valor) {
        super.saldo += valor;
    }
}
