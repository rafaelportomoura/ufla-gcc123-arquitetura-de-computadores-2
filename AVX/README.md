# AVX: Advanced Vector Extensions

Descrição retirada do site: [cs.uaf.edu](https://www.cs.uaf.edu/courses/cs441/notes/avx/)

Good reference info:

- [Intel's AVX reference site](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html#techs=AVX,AVX2) , an excellent categorized interactive reference.
- [x86 Intrinsics Cheat Sheet](./assets/x86-intrin-cheatsheet-v2.1.pdf) , a rather bewildering poster-sized summary diagram of all possible SIMD calls.

The C/C++ AVX intrinsic functions are in the header `"immintrin.h"`.

AVX uses dedicated 256-bit registers, with these C/C++ types:

\_\_m256 for floats  
\_\_m256d for doubles  
\_\_m256i for ints (int support was actually added in "AVX2")

The 256 bit (32 byte) registers have enough space to store:

- 8 single-precision floats (\_ps, Packed Single-precision)
- 4 double-precision floats (\_pd, Packed Double-precision)
- 32 8-bit integers ( \_epi8 signed char, or \_epu8 unsigned char)
- 16 16-bit integers (\_epi16 signed short, or \_epu16 unsigned short)
- 8 32-bit integers (\_epi32, Packed signed Integer, or \_epu32, Packed Unsigned integer)
- 4 64-bit integers (\_epi64 signed long)

For example, here's how you operate on 8 floats at a time, using dedicated AVX \_mm256 intrinsic functions.  
Note how we're using \_ps instructions both for load and add.

```c++
#include "immintrin.h"

void foo(void)
{
    float f[8]={1.0,2.0,1.2,2.1, 5.2,5.3,10.1,11.0};

    __m256 v=_mm256_load_ps(&f[0]);
    v=_mm256_add_ps(v,v);
    _mm256_store_ps(&f[0],v);

    farray_print(f,8);
}
```

And here's how you operate on 8 ints at a time.  For ints, the arithmetic uses \_epi32, and the load and store use the weird \_si256 type, which just means one giant 256-bit block of integer data.

```c++
#include "immintrin.h"

void foo(void)
{
    int f[8]={1,2,0,3, 5,5,10,11};
        
    __m256i v=_mm256_load_si256((const __m256i *)&f[0]);
    v=_mm256_add_epi32(v,v);
    _mm256_store_si256((__m256i *)&f[0],v);
        
    iarray_print(f,8);
}
```

## Using AVX to Speed Up Array Code

Usually it's as easy as just operating on 8 iterations of the loop at a time! But there are often minor complications, like scalar values that need to be broadcast to fill all 8 slots:

```c++
#include "immintrin.h"

const int n=1024;
float a[n], b[n];
float c=3.0;

long foo(void) {
    bool use_AVX=true;
    if (use_AVX) 
    { // fancy AVX loop:
        __m256 C=_mm256_broadcast_ss(&c); // splat c across all SIMD lanes
        for (int i=0;i<n;i+=8) {
            // b[i]=a[i]*c;
            __m256 A=_mm256_load_ps(&a[i]);
            __m256 B=_mm256_mul_ps(A,C);
            _mm256_store_ps(&b[i],B);
        }
    }
    else
    { // simple float loop: 
        for (int i=0;i<n;i++) {
            b[i]=a[i]*c;
        }
    } 
        
    return b[0];
}
```

On my Skylake machine, using AVX takes only 44ns to compute 1000 floats; the simple float loop takes 294ns (a 6.68x speedup!).

Where things get really tricky is when each float wants to do its own separate operations, like per-float branching.  AVX handles branches exactly like SSE .

## Alignment in AVX

AVX instructions expect input operands to be aligned on a 32-byte boundary.  On most 32-bit systems, malloc and new only return pointers aligned to an 8-byte boundary, which caused problems for SSE, which expected 16-byte alignment.  So on most 64-bit systems, malloc and new always return data aligned to a 16-byte boundary--half the time you'll also be lucky and your inputs will also be aligned on a 32-byte boundary, but half the time you won't and your AVX code will crash.

If you're doing allocations yourself, C style, the function `_mm_malloc(size_in_bytes,32)` will return you a 32-byte aligned pointer, and it's available in the same Intel headers as the other \_mm\_ intrinsics.  

For std::vector, you should use an aligning allocator like my [`osl/alignocator.h`](https://github.com/olawlor/osl/blob/master/alignocator.h) as an additional template argument:

```c++
   std::vector<float, alignocator<float,32> > myVec;
```

If you don't do this, your first AVX load has a 50% chance of crashing.

Of course, you still need to advance by 32 bytes / 8 floats from the start of the vector.
