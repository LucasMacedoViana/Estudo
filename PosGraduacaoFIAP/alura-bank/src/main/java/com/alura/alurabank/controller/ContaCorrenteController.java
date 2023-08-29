package com.alura.alurabank.controller;

import com.alura.alurabank.controller.form.ContaCorrenteForm;
import com.alura.alurabank.controller.form.CorrentistaForm;
import com.alura.alurabank.dominio.ContaCorrente;
import com.alura.alurabank.dominio.Correntista;
import com.alura.alurabank.dominio.MovimentacaoDeConta;
import com.alura.alurabank.repositorio.RepositorioContaCorrente;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Path;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

@RestController
@RequestMapping ("/contas")
public class ContaCorrenteController {

    @Autowired
    private RepositorioContaCorrente repositorioContaCorrente;

    @Autowired
    private Validator validator;


    @Autowired
    private ModelMapper modelMapper;

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
    public ResponseEntity criarNovaConta(@RequestBody CorrentistaForm correntistaForm){
        Map<Path, String> ViolacoesToMap = Validar(correntistaForm);

        if(!ViolacoesToMap.isEmpty()){
            return ResponseEntity.badRequest().body(ViolacoesToMap);
        }

        Correntista correntista = correntistaForm.toCorrentista();
        String banco = "333";
        String agencia = "4444";
        String numeroConta = Integer.toString(new Random().nextInt(Integer.MAX_VALUE));
        ContaCorrente conta = new ContaCorrente(banco, agencia, numeroConta, correntista);
        repositorioContaCorrente.save(conta);
        return ResponseEntity.status(HttpStatus.CREATED).body(conta);
    }

    private <T> Map<Path, String> Validar(T form) {
        Set<ConstraintViolation<T>> violacoes =
                validator.validate(form);

        Map<Path, String> ViolacoesToMap = violacoes.stream()
                .collect(Collectors.toMap(violacao -> violacao.getPropertyPath(), violacao -> violacao.getMessage()));
        return ViolacoesToMap;
    }

    @DeleteMapping
    public ResponseEntity feharConta(@RequestBody ContaCorrenteForm contaForm){
        Map<Path, String> ViolacoesToMap = Validar(contaForm);

        if(!ViolacoesToMap.isEmpty()){
            return ResponseEntity.badRequest().body(ViolacoesToMap);
        }
        Optional<ContaCorrente> opContaCorrente = repositorioContaCorrente.findBy(contaForm.getBanco(), contaForm.getAgencia(), contaForm.getNumeroConta());
        if(opContaCorrente.isEmpty()){
            return ResponseEntity.badRequest().body("Conta inválida");
        }
        else {
            ContaCorrente conta = modelMapper.map(contaForm, ContaCorrente.class);
            repositorioContaCorrente.fechar(conta);
            return ResponseEntity.ok("Conta fechada");
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

