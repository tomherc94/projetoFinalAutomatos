package model.services;

%%

%{

private void imprimir(String descricao) {
    System.out.print(descricao);
}

%}


%class LexicalAnalyzer
%type void


BRANCO = [\n| |\t|\r]*
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*
//OPERADORES = ["+","-","*","/","%"]
INTEIRO = 0|[1-9][0-9]*
//QUEBRA_LINHA = (.|\s)*

%%

"inicio"*					 { imprimir("int main(){"); }
"fim"*					     { imprimir("}"); }
"se"*                         { imprimir("if"); }
"faca"*                       { imprimir("{"); }
"entao"*                      { imprimir("{"); }
"para"*                       { imprimir("for"); }
"enquanto"*                   { imprimir("while"); }
"fim-se"*                     { imprimir("}"); }
"fim-para"*                   { imprimir("}"); }
"fim-enquanto"*               { imprimir("}"); }
"escolha"*                    { imprimir("switch"); }
"fim-escolha"*                { imprimir("}"); }
"caso"*                       { imprimir("case"); }
"leia"*                       { imprimir("scanf"); }
"real"*                    	 { imprimir("float"); }
"inteiro"*                    { imprimir("int"); }
"caracter"*                   { imprimir("char"); }
[(]*							 { imprimir("("); }
[)]*						     { imprimir(")"); }
[+]*							 { imprimir("+"); }
[-]*							 { imprimir("-"); }
[*]*							 { imprimir("*"); }
[:]*						     { imprimir(":"); }
[%]*							 { imprimir("%"); }
"ou"*						 { imprimir("||"); }
"e"*							 { imprimir("&&"); }
[<]*							 { imprimir("<"); }
[>]*							 { imprimir(">"); }
[\n]*						 { imprimir("\n"); }
	
{BRANCO}                     { imprimir(" "); }
{ID}                         { imprimir(yytext()); }
//{OPERADORES}               { imprimir(OPERADORES, yytext()); }
{INTEIRO}                    { imprimir(yytext()); }
//{QUEBRA_LINHA}				 { imprimir("\n"); }

. { throw new RuntimeException("Caractere inválido " + yytext()); }