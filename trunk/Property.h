//
//  Property.h
//  MediaInfo Mac
//
//  Created by Diego Massanti on 20/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Category.h"
@class Category;

@interface Property : NSObject {
	Category * _propertyParentCategory;
	
	
	NSString * _propertyName;
	NSString * _propertyValue;
	NSString * _propertyDisplayName;
	NSMutableDictionary * properties;
	
	// Dictionaries for properties translations:
	NSDictionary * stringsGeneral;
}

- (NSString *)getPropertyName;
- (NSString *)getPropertyValue;

- (id)init:(NSString *)pName propertyValue:(NSString *)pValue propertyOther:(NSString *)pOther;

- (Category *)getPropertyParentCategory;

- (void)setProperties:(NSDictionary *)newProperties;

@end
