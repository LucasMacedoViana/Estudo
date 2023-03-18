package org.encapsulado;

public class TesteSistema {
    public static void main(String[] args) {
        Gerente g = new Gerente();
        g.setSenha(1234);
        Administrador adm = new Administrador();
        adm.setSenha(333);

        SistemaINterno si = new SistemaINterno();
        si.autentica(g);
        si.autentica(adm);
    }
}
