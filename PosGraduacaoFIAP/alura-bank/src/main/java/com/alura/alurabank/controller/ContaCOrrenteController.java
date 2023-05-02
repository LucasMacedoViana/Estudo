package com.alura.alurabank.controller;

import com.alura.alurabank.dominio.ContaCorrente;
import com.alura.alurabank.dominio.Correntista;
import com.alura.alurabank.dominio.MovimentacaoDeConta;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping ("/contas")
public class ContaCOrrenteController {

    @GetMapping
    public String consultarSaldo(
            @RequestParam(name = "banco") String banco,
            @RequestParam(name = "agencia") String agencia,
            @RequestParam(name = "numeroConta") String numeroConta){
        return String.format("Banco: %s, Agência: %s, Conta: %s. Saldo : R$ 1300,00", banco, agencia, numeroConta);
        //http://localhost:8080/contas?banco=001&agencia=0001&numeroConta=123456-7
    }

    @PostMapping
    public ResponseEntity<ContaCorrente> criarNovaConta(@RequestBody Correntista correntista){
        ContaCorrente conta = new ContaCorrente( "002", "0002", "123456-7");
        return ResponseEntity.status(HttpStatus.CREATED).body(conta);
    }
    @DeleteMapping
    public String feharConta(@RequestBody ContaCorrente conta){
        return "Conta fechada com sucesso!";
    }

    @PutMapping
    public ResponseEntity<MovimentacaoDeConta> movimentarConta(
            @RequestBody MovimentacaoDeConta movimentacao){
        return ResponseEntity.ok(movimentacao);
    }

}

