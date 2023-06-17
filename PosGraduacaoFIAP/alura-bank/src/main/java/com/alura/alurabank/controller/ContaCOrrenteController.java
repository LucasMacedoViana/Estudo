package com.alura.alurabank.controller;

import com.alura.alurabank.dominio.ContaCorrente;
import com.alura.alurabank.dominio.Correntista;
import com.alura.alurabank.dominio.MovimentacaoDeConta;
import com.alura.alurabank.repositorio.RepositorioContaCorrente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.Random;

@RestController
@RequestMapping ("/contas")
public class ContaCOrrenteController {

    @Autowired
    private RepositorioContaCorrente repositorioContaCorrente;

    @GetMapping
    public String consultarSaldo(
            @RequestParam(name = "banco") String banco,
            @RequestParam(name = "agencia") String agencia,
            @RequestParam(name = "numeroConta") String numeroConta){
        ContaCorrente contaCorrente = repositorioContaCorrente.findBy(banco, agencia, numeroConta).orElse(new ContaCorrente());
        return String.format("Banco: %s, Agência: %s, Conta: %s, Saldo : R$ %s", banco, agencia, numeroConta, contaCorrente.getSaldo());
        //http://localhost:8080/contas?banco=001&agencia=0001&numeroConta=123456-7
    }

    @PostMapping
    public ResponseEntity<ContaCorrente> criarNovaConta(@RequestBody Correntista correntista){
        String banco = "333";
        String agencia = "4444";
        String numeroConta = Integer.toString(new Random().nextInt(Integer.MAX_VALUE));
        ContaCorrente conta = new ContaCorrente(banco, agencia, numeroConta, correntista);
        repositorioContaCorrente.save(conta);
        return ResponseEntity.status(HttpStatus.CREATED).body(conta);
    }
    @DeleteMapping
    public String feharConta(@RequestBody ContaCorrente conta){
        Optional<ContaCorrente> opContaCorrente = repositorioContaCorrente.findBy(conta.getBanco(), conta.getAgencia(), conta.getNumeroConta());
        if(opContaCorrente.isEmpty()){
            return "Conta inválida";
        }
        else {
            conta = opContaCorrente.get();
            repositorioContaCorrente.fechar(conta);
            return "Conta fechada";
        }
    }

    @PutMapping
    public ResponseEntity<String> movimentarConta(@RequestBody MovimentacaoDeConta movimentacaoDeConta){
        Optional<ContaCorrente> opContaCorrente = repositorioContaCorrente.findBy(movimentacaoDeConta.getBanco(), movimentacaoDeConta.getAgencia(), movimentacaoDeConta.getNumeroConta());
        if(opContaCorrente.isEmpty()){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Conta inválida");
        }
        else {
            ContaCorrente contaCorrente = opContaCorrente.get();
            movimentacaoDeConta.executarEm(contaCorrente);
            repositorioContaCorrente.save(contaCorrente);
            return ResponseEntity.status(HttpStatus.ACCEPTED).body("Conta válida");
        }
    }

}

