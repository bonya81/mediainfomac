//
//  mediaInfo.h
//  MediaInfo Mac
//
//  Created by Diego Massanti on 22/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import <Cocoa/Cocoa.h>
//#import "MediaInfoDLL.h"
#import "Category.h"
#import "Helpers.h"
#import "NSDataBase64.h"

@interface mediaInfoControl : NSObject {

	
	void * MIInstance;
	Helpers * _helpers;
}

- (BOOL) createInstance;
- (void) setOptions;
- (BOOL) openFile:(NSString *)filePath;
- (NSArray *)getMediaStreams;
- (NSArray *)getStreamDetails:(MediaInfo_stream_C)streamKind streamNumber:(int)streamNumber;

- (BOOL)loadLibrary;
- (NSString *)tStr:(const char *)input;

@end
