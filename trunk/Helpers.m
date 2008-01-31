//
//  Helpers.m
//  MediaInfo Mac
//
//  Created by Diego Massanti on 22/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import "Helpers.h"


@implementation Helpers

#pragma mark Static Declarations


#pragma mark -
#pragma mark Initialization Methods

- (id) init
{
	self = [super init];
	if (self != nil) {
		NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
		_generalStrings = [[NSDictionary alloc]initWithContentsOfFile:[thisBundle pathForResource:@"Strings" ofType:@"plist"]];
	}
	return self;
}



#pragma mark -
#pragma mark String Dictionaries

- (NSDictionary *)getGeneralStrings
{
	return _generalStrings;
}


@end
