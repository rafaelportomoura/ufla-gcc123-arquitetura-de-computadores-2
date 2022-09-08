#include <immintrin.h>
#include <iostream>

const int DOUBLE_TAM = 4;
const int INT_TAM = 8;
const int FLOAT_TAM = 8;

using namespace std;



__m256 flutuantes( __m256 a, __m256 b, __m256 c ) {
  return  _mm256_addsub_ps( _mm256_mul_ps( a, b ), c );
}

__m256d duplos( __m256d a, __m256d b, __m256d c ) {
  return _mm256_addsub_pd( _mm256_mul_pd( a, b ), c );
}

__m256i inteiros( __m256i a, __m256i b, __m256i c ) {
  __m256 f_a = _mm256_cvtepi32_ps( a );
  __m256 f_b = _mm256_cvtepi32_ps( b );
  __m256 f_c = _mm256_cvtepi32_ps( c );
  return _mm256_cvtps_epi32( flutuantes( f_a, f_b, f_c ) );
}

void imprime_pedindo_numero( const string tipo, const string vetor, int posicao ) {
  cout << "Digite o " << tipo << " " << vetor << "[" << posicao << "]: ";
}

__m256i le_inteiros( string vetor ) {
  int v[INT_TAM];
  for ( int i = 0; i < INT_TAM; i++ ) {
    imprime_pedindo_numero( "inteiro", vetor, i );
    cin >> v[i];
  }
  return _mm256_set_epi32( v[7], v[6], v[5], v[4], v[3], v[2], v[1], v[0] );
}

void imprime_inteiros( __m256i out ) {
  __attribute__( ( aligned( 32 ) ) ) float output[INT_TAM];
  _mm256_store_ps( output, _mm256_cvtepi32_ps( out ) );
  printf( "\n[INTEGER] %d %d %d %d %d %d %d %d\n", int( output[0] ), int( output[1] ), int( output[2] ), int( output[3] ), int( output[4] ), int( output[5] ), int( output[6] ), int( output[7] ) );
}

__m256 le_flutuante( string vetor ) {
  __attribute__( ( aligned( 32 ) ) ) float v[FLOAT_TAM];
  for ( int i = 0; i < FLOAT_TAM; i++ ) {
    imprime_pedindo_numero( "double", vetor, i );
    cin >> v[i];
  }
  return _mm256_load_ps( v );
}

void imprime_flutuante( __m256 out ) {
  __attribute__( ( aligned( 32 ) ) ) float output[FLOAT_TAM];
  _mm256_store_ps( output, out );
  printf( "\n[FLOAT] %f %f %f %f %f %f %f %f\n", output[0], output[1], output[2], output[3], output[4], output[5], output[6], output[7] );
}

__m256d le_duplo( string vetor ) {
  __attribute__( ( aligned( 32 ) ) ) double v[DOUBLE_TAM];
  for ( int i = 0; i < DOUBLE_TAM; i++ ) {
    imprime_pedindo_numero( "double", vetor, i );
    cin >> v[i];
  }
  return _mm256_load_pd( v );
}

void imprime_duplo( __m256d out ) {
  __attribute__( ( aligned( 32 ) ) ) double output[DOUBLE_TAM];
  _mm256_store_pd( output, out );
  printf( "\n[DOUBLE] dst: %f %f %f %f\n", output[0], output[1], output[2], output[3] );
}


void inteiro_business() {
  __m256i a = le_inteiros( "a" );
  __m256i b = le_inteiros( "b" );
  __m256i c = le_inteiros( "c" );
  __m256i dst = inteiros( a, b, c );
  imprime_inteiros( dst );
}

void flutuante_business() {
  __m256 a = le_flutuante( "a" );
  __m256 b = le_flutuante( "b" );
  __m256 c = le_flutuante( "c" );
  __m256 dst = flutuantes( a, b, c );
  imprime_flutuante( dst );
}

void double_business() {
  __m256d a = le_duplo( "a" );
  __m256d b = le_duplo( "b" );
  __m256d c = le_duplo( "c" );
  __m256d dst = duplos( a, b, c );
  imprime_duplo( dst );
}


char menu() {
  cout << "------ MENU -----\n";
  cout << "i - integer\n";
  cout << "f - float\n";
  cout << "d - double\n";
  cout << "s - sair\n";
  cout << "__________________\n";
  cout << "Digite a opcao: ";
  char entrada;
  cin >> entrada;

  switch ( entrada ) {
    case 'i':
      inteiro_business();
      break;

    case 'f':
      flutuante_business();
      break;

    case 'd':
      double_business();
      break;

    case 's':
      cout << "Saindo do programa!\n";
      break;

    default:
      cout << "[ERRO] Digite uma entrada válida [i, f, d, s]\n";
      break;
  }
  return entrada;
}


int main() {
  char entrada;
  while ( entrada != 's' ) {
    entrada = menu();
  }
  return 0;
}