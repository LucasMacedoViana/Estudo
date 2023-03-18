package org.encapsulado;

public class SistemaINterno {
    private  int senha = 1234;
    public void autentica(FuncionarioAutenticavel fa){
        boolean autenticou = fa.autentica(this.senha);
        if(autenticou){
            System.out.println("POde entrar no sistema!");
        }else{
            System.out.println("Não pode entrar no sistema!");
        }
    }
}
