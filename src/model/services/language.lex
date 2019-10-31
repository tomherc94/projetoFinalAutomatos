package model.services;

%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%}


%class LexicalAnalyzer
%type void


BRANCO = [\n| |\t|\r]
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*
SOMA = "+"
INTEIRO = 0|[1-9][0-9]*
QUALQUER_COISA = .

%%

"se"                         { imprimir("if", yytext()); }
"faca"                       { imprimir("{", yytext()); }
"entao"                      { imprimir("{", yytext()); }
"para"                       { imprimir("for", yytext()); }
"enquanto"                   { imprimir("while", yytext()); }
"fim-se"                     { imprimir("}", yytext()); }
"fim-para"                   { imprimir("}", yytext()); }
"fim-enquanto"               { imprimir("}", yytext()); }
"escolha"                    { imprimir("switch", yytext()); }
"fim-escolha"                { imprimir("}", yytext()); }
"caso"                       { imprimir("case", yytext()); }
"leia"                       { imprimir("scanf", yytext()); }
"real"                    	 { imprimir("float", yytext()); }
"inteiro"                    { imprimir("int", yytext()); }
"caracter"                    { imprimir("char", yytext()); }

	
{BRANCO}                     { imprimir("Espaço em branco", yytext()); }
{ID}                         { imprimir("Identificador", yytext()); }
{SOMA}                       { imprimir("Operador de soma", yytext()); }
{INTEIRO}                    { imprimir("Número Inteiro", yytext()); }
{QUALQUER_COISA}			 { imprimir("", yytext()); }

. { throw new RuntimeException("Caractere inválido " + yytext()); }