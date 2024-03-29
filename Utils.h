// ZenLib::Utils - Very small utilities
// Copyright (C) 2002-2006 Jerome Martinez, Zen@MediaArea.net
//
// This software is provided 'as-is', without any express or implied
// warranty.  In no event will the authors be held liable for any damages
// arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it
// freely, subject to the following restrictions:
//
// 1. The origin of this software must not be misrepresented; you must not
//    claim that you wrote the original software. If you use this software
//    in a product, an acknowledgment in the product documentation would be
//    appreciated but is not required.
// 2. Altered source versions must be plainly marked as such, and must not be
//    misrepresented as being the original software.
// 3. This notice may not be removed or altered from any source distribution.
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// Integer and float manipulation
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//---------------------------------------------------------------------------
#ifndef ZenUtilsH
#define ZenUtilsH
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
#include "ZenLib/Conf.h"
#include "ZenLib/int128u.h"
//---------------------------------------------------------------------------

namespace ZenLib
{

//***************************************************************************
// Integer transformations
//***************************************************************************

//---------------------------------------------------------------------------
//Little Endians
int8s  LittleEndian2int8s  (const char* List);
int8u  LittleEndian2int8u  (const char* List);
int16s LittleEndian2int16s (const char* List);
int16u LittleEndian2int16u (const char* List);
int32s LittleEndian2int24s (const char* List);
int32u LittleEndian2int24u (const char* List);
int32s LittleEndian2int32s (const char* List);
int32u LittleEndian2int32u (const char* List);
#if (MAXTYPE_INT >= 64)
int64s LittleEndian2int40s (const char* List);
int64u LittleEndian2int40u (const char* List);
int64s LittleEndian2int48s (const char* List);
int64u LittleEndian2int48u (const char* List);
int64s LittleEndian2int56s (const char* List);
int64u LittleEndian2int56u (const char* List);
int64s LittleEndian2int64s (const char* List);
int64u LittleEndian2int64u (const char* List);
int128u LittleEndian2int128u (const char* List);
#endif
float32 LittleEndian2float32 (const char* List);
float64 LittleEndian2float64 (const char* List);

#ifndef __BORLANDC__
inline int8s  LittleEndian2int8s  (const int8u* List) {return LittleEndian2int8s  ((const char*)List);}
inline int8u  LittleEndian2int8u  (const int8u* List) {return LittleEndian2int8u  ((const char*)List);}
inline int16s LittleEndian2int16s (const int8u* List) {return LittleEndian2int16s ((const char*)List);}
inline int16u LittleEndian2int16u (const int8u* List) {return LittleEndian2int16u ((const char*)List);}
inline int32s LittleEndian2int24s (const int8u* List) {return LittleEndian2int24s ((const char*)List);}
inline int32u LittleEndian2int24u (const int8u* List) {return LittleEndian2int24u ((const char*)List);}
inline int32s LittleEndian2int32s (const int8u* List) {return LittleEndian2int32s ((const char*)List);}
inline int32u LittleEndian2int32u (const int8u* List) {return LittleEndian2int32u ((const char*)List);}
#if (MAXTYPE_INT >= 64)
inline int64s LittleEndian2int40s (const int8u* List) {return LittleEndian2int40s ((const char*)List);}
inline int64u LittleEndian2int40u (const int8u* List) {return LittleEndian2int40u ((const char*)List);}
inline int64s LittleEndian2int48s (const int8u* List) {return LittleEndian2int48s ((const char*)List);}
inline int64u LittleEndian2int48u (const int8u* List) {return LittleEndian2int48u ((const char*)List);}
inline int64s LittleEndian2int56s (const int8u* List) {return LittleEndian2int56s ((const char*)List);}
inline int64u LittleEndian2int56u (const int8u* List) {return LittleEndian2int56u ((const char*)List);}
inline int64s LittleEndian2int64s (const int8u* List) {return LittleEndian2int64s ((const char*)List);}
inline int64u LittleEndian2int64u (const int8u* List) {return LittleEndian2int64u ((const char*)List);}
inline int128u LittleEndian2int128u (const int8u* List) {return LittleEndian2int64u ((const char*)List);}
inline float32 LittleEndian2float32 (const int8u* List) {return LittleEndian2float32 ((const char*)List);}
inline float64 LittleEndian2float64 (const int8u* List) {return LittleEndian2float64 ((const char*)List);}
#endif
#endif //__BORLANDC__
//---------------------------------------------------------------------------
//Big Endians
int8s  BigEndian2int8s     (const char* List);
int8u  BigEndian2int8u     (const char* List);
int16s BigEndian2int16s    (const char* List);
int16u BigEndian2int16u    (const char* List);
int32s BigEndian2int24s    (const char* List);
int32u BigEndian2int24u    (const char* List);
int32s BigEndian2int32s    (const char* List);
int32u BigEndian2int32u    (const char* List);
#if (MAXTYPE_INT >= 64)
int64s BigEndian2int40s    (const char* List);
int64u BigEndian2int40u    (const char* List);
int64s BigEndian2int48s    (const char* List);
int64u BigEndian2int48u    (const char* List);
int64s BigEndian2int56s    (const char* List);
int64u BigEndian2int56u    (const char* List);
int64s BigEndian2int64s    (const char* List);
int64u BigEndian2int64u    (const char* List);
int128u BigEndian2int128u  (const char* List);
#endif
float32 BigEndian2float32  (const char* List);
float64 BigEndian2float64  (const char* List);
#ifndef __BORLANDC__
inline int8s  BigEndian2int8s     (const int8u* List) {return BigEndian2int8s     ((const char*)List);}
inline int8u  BigEndian2int8u     (const int8u* List) {return BigEndian2int8u     ((const char*)List);}
inline int16s BigEndian2int16s    (const int8u* List) {return BigEndian2int16s    ((const char*)List);}
inline int16u BigEndian2int16u    (const int8u* List) {return BigEndian2int16u    ((const char*)List);}
inline int32s BigEndian2int32s    (const int8u* List) {return BigEndian2int32s    ((const char*)List);}
inline int32u BigEndian2int24u    (const int8u* List) {return BigEndian2int24u    ((const char*)List);}
inline int32s BigEndian2int24s    (const int8u* List) {return BigEndian2int24s    ((const char*)List);}
inline int32u BigEndian2int32u    (const int8u* List) {return BigEndian2int32u    ((const char*)List);}
#if (MAXTYPE_INT >= 64)
inline int64s BigEndian2int40s    (const int8u* List) {return BigEndian2int40s    ((const char*)List);}
inline int64u BigEndian2int40u    (const int8u* List) {return BigEndian2int40u    ((const char*)List);}
inline int64s BigEndian2int48s    (const int8u* List) {return BigEndian2int48s    ((const char*)List);}
inline int64u BigEndian2int48u    (const int8u* List) {return BigEndian2int48u    ((const char*)List);}
inline int64s BigEndian2int56s    (const int8u* List) {return BigEndian2int56s    ((const char*)List);}
inline int64u BigEndian2int56u    (const int8u* List) {return BigEndian2int56u    ((const char*)List);}
inline int64s BigEndian2int64s    (const int8u* List) {return BigEndian2int64s    ((const char*)List);}
inline int64u BigEndian2int64u    (const int8u* List) {return BigEndian2int64u    ((const char*)List);}
inline int128u BigEndian2int128u  (const int8u* List) {return BigEndian2int64u    ((const char*)List);}
#endif
inline float32 BigEndian2float32  (const int8u* List) {return BigEndian2float32   ((const char*)List);}
inline float64 BigEndian2float64  (const int8u* List) {return BigEndian2float64   ((const char*)List);}
#endif //__BORLANDC__

//---------------------------------------------------------------------------
// int32 - int64
int64s int32s_int64s (                int32s  High, int32u  Low);
int64u int32u_int64u (                int32u  High, int32u  Low);
void   int32s_int64s (int64s &BigInt, int32s  High, int32u  Low);
void   int32u_int64u (int64s &BigInt, int32u  High, int32u  Low);
void   int64s_int32s (int64s  BigInt, int32s &High, int32u &Low);
void   int64u_int32u (int64u  BigInt, int32u &High, int32u &Low);

//---------------------------------------------------------------------------
// Floats and ints
int32s float32_int32s  (float32 F, bool Rounded=true);
int64s float32_int64s  (float32 F, bool Rounded=true);
int32s float64_int32s  (float64 F, bool Rounded=true);
int64s float64_int64s  (float64 F, bool Rounded=true);

// These functions are used because MSVC6 isn't able to convert an unsigned int64 to a floating-point value, and I couldn't think of a cleaner way to handle it.
#if defined(_MSC_VER) && _MSC_VER<=1200
    inline float32 int64u_float32 (int64u v) {return static_cast<float32>(static_cast<int64s>(v>>1))*2.0f + static_cast<float32>(static_cast<int64s>(v & 1));}
    inline float64 int64u_float64 (int64u v) {return static_cast<float64>(static_cast<int64s>(v>>1))*2.0f + static_cast<float32>(static_cast<int64s>(v & 1));}
#else
    #if defined(_MSC_VER)
       #pragma warning( disable : 4244 )
    #endif
    inline float32 int64u_float32 (int64u v) {return v;}
    inline float64 int64u_float64 (int64u v) {return v;}
    #if defined(_MSC_VER)
        #pragma warning( default : 4244 )
    #endif
#endif // defined(_MSC_VER) && _MSC_VER<=1200

//---------------------------------------------------------------------------
// CC (often used in all containers to identify a stream
inline int64u CC8(const char*  C) {return BigEndian2int64u(C);}
inline int64u CC7(const char*  C) {return BigEndian2int56u(C);}
inline int64u CC6(const char*  C) {return BigEndian2int48u(C);}
inline int64u CC5(const char*  C) {return BigEndian2int40u(C);}
inline int32u CC4(const char*  C) {return BigEndian2int32u(C);}
inline int32u CC3(const char*  C) {return BigEndian2int24u(C);}
inline int16u CC2(const char*  C) {return BigEndian2int16u(C);}
inline int8u  CC1(const char*  C) {return BigEndian2int8u (C);}
#ifndef __BORLANDC__
inline int64u CC8(const int8u* C) {return BigEndian2int64u(C);}
inline int64u CC7(const int8u* C) {return BigEndian2int56u(C);}
inline int64u CC6(const int8u* C) {return BigEndian2int48u(C);}
inline int64u CC5(const int8u* C) {return BigEndian2int40u(C);}
inline int32u CC4(const int8u* C) {return BigEndian2int32u(C);}
inline int32u CC3(const int8u* C) {return BigEndian2int24u(C);}
inline int16u CC2(const int8u* C) {return BigEndian2int16u(C);}
inline int8u  CC1(const int8u* C) {return BigEndian2int8u (C);}
#endif // __BORLANDC__

//---------------------------------------------------------------------------
// turn a numeric literal into a hex constant
// (avoids problems with leading zeroes)
// 8-bit constants max value 0x11111111, always fits in unsigned long
#define HEX__(n) 0x##n##LU

// 8-bit conversion function
#define B8__(x) ((x&0x0000000FLU)?0x01:0) \
               +((x&0x000000F0LU)?0x02:0) \
               +((x&0x00000F00LU)?0x04:0) \
               +((x&0x0000F000LU)?0x08:0) \
               +((x&0x000F0000LU)?0x10:0) \
               +((x&0x00F00000LU)?0x20:0) \
               +((x&0x0F000000LU)?0x40:0) \
               +((x&0xF0000000LU)?0x80:0)

// for upto 8-bit binary constants
#define B8(d) ((int8u)B8__(HEX__(d)))

// for upto 16-bit binary constants, MSB first
#define B16(dmsb, dlsb) (((int16u)B8(dmsb)<<8) \
                       + ((int16u)B8(dlsb)<<0))

// for upto 32-bit binary constants, MSB first
#define B32(dmsb, db2, db3, dlsb) (((int32u)B8(dmsb)<<24) \
                                 + ((int32u)B8( db2)<<16) \
                                 + ((int32u)B8( db3)<< 8) \
                                 + ((int32u)B8(dlsb)<< 0))

} //namespace ZenLib
#endif
