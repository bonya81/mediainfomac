//
//  Category.m
//  MediaInfo Mac
//
//  Created by Diego Massanti on 20/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//


#import "Category.h"
@implementation Category

#pragma mark -
#pragma mark Initialization Methods

- (id) init:(MediaInfo_stream_C)streamKind streamNumber:(int)streamNumber
{
	self = [super init];
	if (self != nil) {
		switch (streamKind) {
			case 0:
				_categoryName = [NSString stringWithFormat:@"General / Container Stream # %i", streamNumber + 1];
				break;
			case 1:
				_categoryName = [NSString stringWithFormat:@"Video Stream # %i", streamNumber + 1];
				break;
			case 2:
				_categoryName = [NSString stringWithFormat:@"Audio Stream # %i", streamNumber + 1];
				break;
			default:
				_categoryName = @"Unknown Stream";		// This should never happen.
				break;
		}
		
		NSArray * keys   = [NSArray arrayWithObjects:@"name", @"type", @"number", nil];
		NSArray * values = [NSArray arrayWithObjects:_categoryName, [NSNumber numberWithInt:streamKind], [NSNumber numberWithInt:streamNumber], nil];
		properties = [[NSMutableDictionary alloc]initWithObjects: values forKeys: keys];
		_items = [[NSMutableArray alloc]init];
		printf("Hash is: %u\n", [self hash]);
	}
	return self;
}

#pragma mark -
#pragma mark Accessor Methods & Setters

- (void)addProperty:(Property *)theProperty
{
	/*Property * newProperty = [[Property alloc]init:@"Test Property" propertyValue:@"Test Value" propertyOther:@"Test Other" propertyParent:self];
	NSMutableArray * items = [self items];
	[items addObject:newProperty];
	printf("I have now %i categories for the object %s.\n", [items count], [[self className]UTF8String]);*/
}

- (NSMutableArray *)items {
	return _items;
}

- (NSString *)getCategoryName
{
	return _categoryName;
}
- (void)setCategoryName:(NSString *)theName;
{
	_categoryName = [theName stringByAppendingString:[NSString stringWithFormat:@" :: Instance Hash: %u", [self hash]]];
	[properties setValue:_categoryName forKey:@"name"];
}
- (int)getNumberOfChildren
{
	return [[self items]count];
}

- (BOOL)isALeaf

{
	return [[self items]count] < 1;
}

- (MediaInfo_stream_C)getStreamKind
{
	NSNumber * caca = [properties objectForKey:@"type"];
	return [caca intValue];
}
@end
