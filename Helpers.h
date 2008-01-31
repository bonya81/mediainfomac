//
//  Helpers.h
//  MediaInfo Mac
//
//  Created by Diego Massanti on 22/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Helpers : NSObject {
	NSDictionary * _generalStrings;
}
#pragma mark -
#pragma mark String Dictionaries

- (NSDictionary *)getGeneralStrings;


@end
