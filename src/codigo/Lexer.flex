package codigo;

import static codigo.Tokens.*;

%%
%class Lexer
%type Tokens

L = [a-zA-Z_]+
D = [0-9]+
WHITE = [ ,\t,\r,\n]+

%{
public String lexeme;
%}

%%
{WHITE} {/*ignore*/}

/*Estrutura de controlo*/
("loko" | "phazama" | "langa") {lexeme  = yytext(); return ESTRUTURA_DE_CONTROLO;}
("leyi") {lexeme  = yytext(); return ESTRUTURA_DE_CONTROLO_CASO;}


/*Estrutura de Repeticao*/
("ka" | "yendla" | "nkanrini" | "maha") {lexeme  = yytext(); return ESTRUTURA_DE_REPETICAO;}

/*Inicio DE Programa*/
("massungulo") {lexeme  = yytext(); return INICIO_DE_PROGRAMA;}

/*Fim de Programa*/
("magamu") {lexeme  = yytext(); return FIM_DE_PROGRAMA;}


(";") {lexeme  = yytext(); return FIM_DE_INSTRUCAO;}
(",") {lexeme  = yytext(); return CONCATENACAO;}
(":") {lexeme  = yytext(); return INICIAR_CASE;}
("{") {lexeme  = yytext(); return INICIAR_BLOCO_FUNCAO;}
("}") {lexeme  = yytext(); return TERMINAR_BLOCO_FUNCAO;}
("(") {lexeme  = yytext(); return COMECAR_PARAMETRO;}
(")") {lexeme  = yytext(); return TERMINAR_PARAMETRO;}

("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

.+ {return ERROR;}
