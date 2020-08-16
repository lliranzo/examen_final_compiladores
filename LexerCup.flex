package examen_final;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
En_linea = [\n]
tab = [\t]
%{
    private Symbol symbol(int type, Object value) {
    	return new Symbol(type, clinea, colummna, value);
    }
    
    private Symbol symbol(int type) {
    	return new Symbol(type, linea, colummna);
    }
%}
%%
{En_linea} {return new Symbol(sym.Enter_Linea, yychar, clinea, yytext());}
{tab} {return new Symbol(sym.Tab, yychar, clinea, yytext());}
(A|B|C|D|F) {return new Symbol(sym.Literal, yychar, clinea, yytext());}
([0-9])+((\.)([0-9])+)? {return new Symbol(sym.Calificacion, yychar, clinea, yytext());}
 . {return new Symbol(sym.ERROR, yychar, clinea, yytext());}
