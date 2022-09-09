#include <immintrin.h>
#include <iostream>
using namespace std;

const int NUMERO_DE_CARACTERES = 8;

__m256 get_m256_da_palavra( string p ) {
  __m256i _m256i_palavra = _mm256_set_epi32( p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0] );
  return _mm256_cvtepi32_ps( _m256i_palavra );
}

string get_palavra_do_m256( __m256 palavra_em_m256 ) {
  __attribute__( ( aligned( 32 ) ) ) float saida[NUMERO_DE_CARACTERES];
  _mm256_store_ps( saida, palavra_em_m256 );

  char palavra[NUMERO_DE_CARACTERES];

  palavra[0] = int( saida[0] );
  palavra[1] = int( saida[1] );
  palavra[2] = int( saida[2] );
  palavra[3] = int( saida[3] );
  palavra[4] = int( saida[4] );
  palavra[5] = int( saida[5] );
  palavra[6] = int( saida[6] );
  palavra[7] = int( saida[7] );

  return palavra;
}

string criptografa( string palavra ) {
  __m256 _m256_palavra = get_m256_da_palavra( palavra );
  _m256_palavra = _mm256_permute_ps( _m256_palavra, 0b00111001 );
  return get_palavra_do_m256( _m256_palavra );
}

string descriptografa( string palavra ) {
  __m256 _m256_palavra = get_m256_da_palavra( palavra );
  _m256_palavra = _mm256_permute_ps( _m256_palavra, 0b10010011 );
  return get_palavra_do_m256( _m256_palavra );
}

char menu() {
  cout << "------ MENU -----\n";
  cout << "c - criptografar\n";
  cout << "d - descriptografar\n";
  cout << "t - criptografa e descriptografa (teste)\n";
  cout << "s - sair\n";
  cout << "__________________\n";
  cout << "Digite a letra referente a opcao: ";
  char entrada;
  cin >> entrada;
  char palavra[NUMERO_DE_CARACTERES];
  string criptografada;
  cout << endl;
  switch ( entrada ) {
    case 'c':
      cout << "Digite a palavra de " << NUMERO_DE_CARACTERES << " digitos a ser criptografada: ";
      cin >> palavra[0] >> palavra[1] >> palavra[2] >> palavra[3] >> palavra[4] >> palavra[5] >> palavra[6] >> palavra[7];
      cout << "\n\nCriptografada: " << criptografa( palavra ) << endl << endl;
      break;

    case 'd':
      cout << "Digite a palavra de " << NUMERO_DE_CARACTERES << " digitos a ser descriptografada: ";
      cin >> palavra[0] >> palavra[1] >> palavra[2] >> palavra[3] >> palavra[4] >> palavra[5] >> palavra[6] >> palavra[7];
      cout << "\n\nDescriptografada: " << descriptografa( palavra ) << endl << endl;
      break;

    case 't':
      cout << "Digite a palavra de " << NUMERO_DE_CARACTERES << " digitos a ser criptografada: ";
      cin >> palavra[0] >> palavra[1] >> palavra[2] >> palavra[3] >> palavra[4] >> palavra[5] >> palavra[6] >> palavra[7];
      criptografada = criptografa( palavra );
      cout << "\n\nCriptografada: " << criptografada;
      cout << "\nDescriptografada: " << descriptografa( criptografada ) << endl << endl;
      break;

    case 's':
      break;


    default:
      cout << "[ERRO] Opcao invalida!\nOpcoes validas ['c','d','t','s']\n";
      break;
  }
  return entrada;
}

int main() {
  char entrada;
  while ( entrada != 's' )
    entrada = menu();
  return 0;
}