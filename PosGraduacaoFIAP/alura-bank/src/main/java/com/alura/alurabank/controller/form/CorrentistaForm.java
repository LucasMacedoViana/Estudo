package com.alura.alurabank.controller.form;

import com.alura.alurabank.dominio.Correntista;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.hibernate.validator.constraints.br.CPF;

public class CorrentistaForm {
    @JsonProperty
    @CPF(message = "O CPF informado é inválido")
    @NotNull(message = "O CPF do correntista é obrigatório")
    private String cpf;
    @JsonProperty
    @NotBlank(message = "O nome do correntista não deve estar em branco")
    private String nome;

    public Correntista toCorrentista() {
        return new Correntista(cpf, nome);
    }
}
