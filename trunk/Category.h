//
//  Category.h
//  MediaInfo Mac
//
//  Created by Diego Massanti on 20/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <MediaInfoDLL_Static.h>
#import "Property.h"

@class Property;

@interface Category : NSObject {
	NSString * _categoryName;
	NSMutableDictionary * properties;
	NSMutableArray * _items;
	MediaInfo_stream_C * _streamKind;
}

- (MediaInfo_stream_C)getStreamKind;

- (id) init:(MediaInfo_stream_C)streamKind streamNumber:(int)streamNumber;
- (void)addProperty:(Property *)theProperty;
- (NSMutableArray *)items;
- (NSString *)getCategoryName;
- (int)getNumberOfChildren;
- (void)setCategoryName:(NSString *)theName;

@end
