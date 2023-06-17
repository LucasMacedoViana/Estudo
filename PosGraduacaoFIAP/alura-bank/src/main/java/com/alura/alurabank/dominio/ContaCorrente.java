package com.alura.alurabank.dominio;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.math.BigDecimal;
import java.util.Objects;

public class ContaCorrente {

    @JsonProperty
    private String banco;
    @JsonProperty
    private String agencia;
    @JsonProperty
    private String numeroConta;
    @JsonProperty
    private Correntista correntista;
    @JsonProperty
    private BigDecimal saldo;

    public ContaCorrente(String banco, String agencia, String numeroConta, Correntista correntista){
        this();
        this.banco = banco;
        this.agencia = agencia;
        this.numeroConta = numeroConta;
        this.correntista = correntista;

    }

    public ContaCorrente() {
        this.saldo = BigDecimal.ZERO;
    }

    public int obterNumeroConta(){
        return Integer.parseInt(numeroConta);
    }

    public boolean identificarPOr(String banco, String agencia, String numeroConta) {
        return this.banco.equals(banco) && this.agencia.equals(agencia) && this.numeroConta.equals(numeroConta);
    }

    public BigDecimal getSaldo() {
        return saldo;
    }
    public void executar(Operacao operacao, BigDecimal valor) {
        saldo = operacao.executar(saldo, valor);
    }

    public String getBanco() {
        return banco;
    }

    public String getAgencia() {
        return agencia;
    }

    public String getNumeroConta() {
        return numeroConta;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ContaCorrente that = (ContaCorrente) o;
        return Objects.equals(banco, that.banco) && Objects.equals(agencia, that.agencia) && Objects.equals(numeroConta, that.numeroConta);
    }

    @Override
    public int hashCode() {
        return Objects.hash(banco, agencia, numeroConta);
    }
}
