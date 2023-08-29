package com.alura.alurabank.dominio;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@EqualsAndHashCode(of = {"banco", "agencia", "numeroConta"})
public class ContaCorrente {

    @Setter
    @Getter
    @JsonProperty
    private String banco;

    @Setter
    @Getter
    @JsonProperty
    private String agencia;

    @Setter
    @Getter
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
}
