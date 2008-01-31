//
//  Property.m
//  MediaInfo Mac
//
//  Created by Diego Massanti on 20/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import "Property.h"
#import "Helpers.h"


@implementation Property

#pragma mark -
#pragma mark Initialization Methods

- (id) init:(NSString *)pName propertyValue:(NSString *)pValue propertyOther:(NSString *)pOther
{
	self = [super init];
	if (self != nil) {
		
		_propertyName = pName;
		_propertyValue = pValue;
		
		// Initialize the Helpers 
		Helpers * helper = [[Helpers alloc]init];
		stringsGeneral = [helper getGeneralStrings];
		

		// Lets try to load "nice" strings
		NSString * prettyName = [[NSString alloc]init];
		
		if ([stringsGeneral valueForKey:pName])
		{
			prettyName = [stringsGeneral valueForKey:pName];
		} else {
			prettyName = pName;
		}
		
		NSString * finalName = [NSString stringWithFormat:@"%@: %@", prettyName, pValue];
		
		NSArray * keys   = [NSArray arrayWithObjects:@"name", @"value", @"other", nil];
		NSArray * values = [NSArray arrayWithObjects:finalName, pValue, pOther, nil];
		
		properties = [[NSMutableDictionary alloc]initWithObjects: values forKeys: keys];
		[helper release];
	}
	return self;
}

#pragma mark -
#pragma mark Accessor & Setter Methods

- (NSString *)getPropertyName
{
	return _propertyName;
}

- (NSString *)getPropertyValue
{
	return _propertyValue;
}


- (Category *)getPropertyParentCategory
{
	return _propertyParentCategory;
}

- (void)setProperties:(NSDictionary *)newProperties
{
	if (properties != newProperties)
    {
        [properties autorelease];
        properties = [[NSMutableDictionary alloc] initWithDictionary: newProperties];
    }
}

- (int)getNumberOfChildren
{
	return 0;
}

- (BOOL)isALeaf
{
	return YES;
}
@end
