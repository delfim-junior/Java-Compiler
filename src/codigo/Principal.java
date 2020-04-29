/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;

/**
 *
 * @author dell
 */
public class Principal {
    public static void main(String[] args) {
        String rota = "C:/Users/dell/Documents/NetBeansProjects/AnaisadorLexico/src/codigo/Lexer.flex";
        gerarLexer(rota);
    }
    
    public static void gerarLexer(String rota){
        File fich = new File(rota);
        JFlex.Main.generate(fich);
    }
}
