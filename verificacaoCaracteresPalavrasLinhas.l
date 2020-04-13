
Autor: Antônio Andson da Silva - Ciência da Computação - Campus Quixadá 

/* Escreva um arquivo de entrada Lex para produzir um programa que conte caracteres, palavras e linhas em um
arquivo de texto e produza um relatório. Defina uma palavra como qualquer sequência de letras e/ou dígitos,
sem pontuação ou espaços. Pontuação e espaços não contam como palavras. */

%{

#include<iostream>
#include<string>
#include<sstream>
#include<list>

using namespace std;

list<int> lista;
list<int>::iterator it;

int qtdlinha = 0;
int qtdcaractere = 0;
int qtdpalavra = 0;

%}


linha \n
palavra [A-z0-9]+


%%


{palavra}        {   qtdpalavra++;  lista.push_back(strlen(yytext));    }
{linha}          {   qtdlinha++;    }	
.                {   lista.push_back(strlen(yytext));   }


%%


int yywrap(void){
	return 1;
}


int main(){
	
    yylex();
    
    for(it = lista.begin(); it != lista.end(); it++){
		
	qtdcaractere += *it;

    }
    
    printf("Tem %d caracteres\n",qtdcaractere);    
    printf("Tem %d palavras\n",qtdpalavra);
    printf("Tem %d linhas\n",qtdlinha);  
	
    return 0;

}

