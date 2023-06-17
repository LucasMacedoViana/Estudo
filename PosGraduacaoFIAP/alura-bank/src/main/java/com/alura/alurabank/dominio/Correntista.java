package com.alura.alurabank.dominio;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;

public class Correntista {
    @JsonProperty
    private String nome;
    @JsonProperty
    private String cpf;

    private LocalDate dataDeEntrada = LocalDate.now();
    public LocalDate getDataDeEntrada() {
        return dataDeEntrada;
    }

}
