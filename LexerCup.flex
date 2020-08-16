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
    	return new Symbol(type, clinea, ccolum, value);
    }
    
    private Symbol symbol(int type) {
    	return new Symbol(type, clinea, ccolum);
    }
%}
%%
{En_linea} {return new Symbol(sym.Enter_Linea, ccaracter, clinea, ctexto());}
{tab} {return new Symbol(sym.Tab, ccaracter, clinea, ctexto());}
(A|B|C|D|F) {return new Symbol(sym.Literal, ccaracter, clinea, ctexto());}
([0-9])+((\.)([0-9])+)? {return new Symbol(sym.Calificacion, ccaracter, clinea, ctexto());}
 . {return new Symbol(sym.ERROR, ccaracter, clinea, ctexto());}
