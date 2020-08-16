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
espa = [\t]
%{
    private Symbol symbol(int type, Object value) {
    	return new Symbol(type, yyline, yycolumn, value);
    }
    
    private Symbol symbol(int type) {
    	return new Symbol(type, yyline, yycolumn);
    }
%}
%%
{En_linea} {return new Symbol(sym.Enter_Linea, yychar, yyline, yytext());}
{espa} {return new Symbol(sym.Tab, yychar, yyline, yytext());}
(A|B|C|D|F) {return new Symbol(sym.Literal, yychar, yyline, yytext());}
([0-9])+((\.)([0-9])+)? {return new Symbol(sym.Calificacion, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
