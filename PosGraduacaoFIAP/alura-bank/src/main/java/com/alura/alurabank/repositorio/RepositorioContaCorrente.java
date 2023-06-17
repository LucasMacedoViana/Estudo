package com.alura.alurabank.repositorio;

import com.alura.alurabank.dominio.ContaCorrente;
import org.springframework.stereotype.Repository;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Repository
public class RepositorioContaCorrente {
    private Set<ContaCorrente> contas;
    public RepositorioContaCorrente() {
        contas = new HashSet<>();
    }

    public void save(ContaCorrente conta) {
        contas.add(conta);
    }

    public Optional<ContaCorrente> findBy(String banco, String agencia, String numeroConta) {
        return contas.stream()
                .filter(conta -> conta.identificarPOr(banco, agencia, numeroConta))
                .findFirst();
    }

    public void fechar(ContaCorrente conta) {
        contas.remove(conta);
    }
}
