//
//  NSDataBase64.h
//  MediaInfo Mac
//
//  Created by Diego Massanti on 27/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//


#include <openssl/bio.h>
#include <openssl/evp.h>
//#import <Cocoa/Cocoa.h>


@interface NSString (Base64)

- (NSData *) decodeBase64;
- (NSData *) decodeBase64WithNewlines: (BOOL) encodedWithNewlines;


@end
