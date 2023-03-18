package org.encapsulado;

//Gerente herda da class Funcionario
public class Gerente extends FuncionarioAutenticavel{

    public double getBonificacao(){
        System.out.println("Chamando o metodo de bonificacao do GERENTE");
        return super.getSalario();
    }
}
