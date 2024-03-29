// ZenLib::Dir - Directories functions
// Copyright (C) 2007-2008 Jerome Martinez, Zen@MediaArea.net
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
// Directories functions
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//---------------------------------------------------------------------------
#ifndef ZenLib_DirH
#define ZenLib_DirH
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
#include "ZenLib/Conf.h"
#include "ZenLib/ZtringList.h"
//---------------------------------------------------------------------------

namespace ZenLib
{

//***************************************************************************
/// @brief Directory manipulation
//***************************************************************************

class Dir
{
public :
    //---------------------------------------------------------------------------
    /// @brief Options for Open method
    enum dirlist_t
    {
        Files                       = 1,            ///< Include files
        Dirs                        = 1,            ///< Include directories
        Hidden                      = 1,            ///< Include hidden files
        DotDot                      = 1             ///< Include '.' and '..'
    };

    //Constructor/Destructor

    //Open/close
    static ZtringList GetAllFileNames(const Ztring &Dir_Name);

    //Helpers
    static bool             Exists(const Ztring &Dir_Name);
    static bool             Create(const Ztring &Dir_Name);
};

} //NameSpace

#endif
