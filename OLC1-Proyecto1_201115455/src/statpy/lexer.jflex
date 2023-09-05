// ------------  Paquete e importaciones ------------
//nombre del paquete donde se encuentra

package statpy; 

import java_cup.runtime.*;

%%	
//-------> Directivas (No tocar)

//indica cómo crear los archivos
%public 
%class Lexer
%cup
%char
%column
%line
%unicode
%ignorecase

%{ 
%} 

// ------> Expresiones Regulares 

entero = [0-9]+


%%
// ------------  Reglas Lexicas -------------------
//llamado de ER, palabras reservadas, el new Symbol retorna el token este se debe crear TERMINAL en CUP
//{patron}  {código de java}

"("       { return new Symbol(sym.PARENTESIS_A, yycolumn, yyline, yytext()); }
")"       { return new Symbol(sym.PARENTESIS_C, yycolumn, yyline, yytext()); }

{entero}  { return new Symbol(sym.ENTERO, yycolumn, yyline, yytext()); }

"console"   { System.out.println("Reconocio --> console"); return new Symbol(sym.CONSOLE, yycolumn, yyline, yytext()); }




//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }

