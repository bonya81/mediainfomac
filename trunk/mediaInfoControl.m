//
//  mediaInfo.m
//  MediaInfo Mac
//
//  Created by Diego Massanti on 22/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import "mediaInfoControl.h"


@implementation mediaInfoControl

//static NSSymbol nssym = NSLookupSymbolInModule(handle, symbol);

- (id) init
{
	self = [super init];
	if (self != nil) {
		MIInstance = MediaInfo_New();
		_helpers = [[Helpers alloc]init];
	}
	return self;
}

#pragma mark -
#pragma mark MediaInfo Initialization Methods

- (BOOL) loadLibrary
{

		return YES;

}

- (BOOL) createInstance
{
	if (MIInstance != nil)
	{
		[self setOptions];
		return YES;
	}
	return NO;
}

- (void) setOptions
{
	MediaInfo_Option(MIInstance, "info_version", "0.7.5.7;Yuntobulator;0.1");
	MediaInfo_Option(MIInstance, "Internet", "No");	
}

#pragma mark -
#pragma mark MediaInfo File Management Methods

- (BOOL) openFile:(NSString *)filePath
{
	const char * path = [filePath fileSystemRepresentation];

	if (MediaInfo_Open(MIInstance, path) == 1)
	{
		return YES;
	}
	return NO;
}


#pragma mark -
#pragma mark MediaInfo Analysis Methods

// Gets the streams and returns a NSArray with initialized and setted categories

- (NSArray *)getMediaStreams

{
	// We need to know how many streams we have for each stream type (general, audio, video, text, etc)
	
	NSArray * categories = [[NSArray alloc]initWithObjects:
							[NSNumber numberWithInt:0],		// General
							[NSNumber numberWithInt:1],		// Video
							[NSNumber numberWithInt:2],		// Audio
							nil];
	NSMutableArray * tempCategories = [[NSMutableArray alloc]init];
	int i = 0;
	while (i < [categories count]) {
		NSNumber * streamKind = [categories objectAtIndex:i];		// What kind are we querying ?
		int totalStreamsForKind = MediaInfo_Count_Get(MIInstance, [streamKind intValue], -1);		// How many streams of this kind ?
		if (totalStreamsForKind > 0)		// We have at least 1 stream for this kind, lets go!
		{
			int s = 0;
			while (s < totalStreamsForKind) {
				Category * tmpCat = [[Category alloc]init:[streamKind intValue] streamNumber:s];
				[[tmpCat items]addObjectsFromArray:[self getStreamDetails:[streamKind intValue] streamNumber:s]];
				[tempCategories addObject:tmpCat];
				s++;
			}
		}
		i++;
	}
	return [NSArray arrayWithArray:tempCategories];
}

- (NSArray *)getStreamDetails:(MediaInfo_stream_C)streamKind streamNumber:(int)streamNumber

{
	NSDictionary * keys = [[NSDictionary alloc]initWithDictionary:[_helpers getGeneralStrings]]; // get main keys plist
	NSArray * optionsToGet;
	// Let's load correct keys for the kind of stream that we are analyzing
	switch (streamKind) {
		case MediaInfo_Stream_General:
			optionsToGet = [keys objectForKey:@"MediaInfo_Stream_General"];
			break;
		case MediaInfo_Stream_Video:
			optionsToGet = [keys objectForKey:@"MediaInfo_Stream_Video"];
			break;
		case MediaInfo_Stream_Audio:
			optionsToGet = [keys objectForKey:@"MediaInfo_Stream_Audio"];
			break;
		default:
			optionsToGet = [[NSArray alloc]init]; // This should NOT happen !
			break;
	}
	
	NSMutableArray * tempProperties = [[NSMutableArray alloc]init];
	
	int i = 0;
	for (i; i < [optionsToGet count]; i++) {
		const char * parameter = [[[optionsToGet objectAtIndex:i]valueForKey:@"property"]UTF8String];
		const char * value = MediaInfo_Get(MIInstance, streamKind, streamNumber, parameter, MediaInfo_Info_Text, MediaInfo_Info_Name);
		
		if ([[[optionsToGet objectAtIndex:i]valueForKey:@"property"]isEqualToString:@"Cover_Datas"]) {
			//NSImage * itemImage = [NSImage alloc];
			//printf(value);
			//const char * image = MediaInfo_Get(MIInstance, streamKind, streamNumber, parameter, MediaInfo_Info_Text, MediaInfo_Info_Name);
			//NSData * theImage = [[NSData alloc]initWithData:[[NSString stringWithCString:value]decodeBase64]];
			//[itemImage initWithData:theImage];
			//NSBeep();
			
			//NSData * binaryData = [[NSData alloc]init
		}
		
		
		
		if ([[NSString stringWithCString:value]isNotEqualTo:@""]) {
			Property * newProperty = [[Property alloc]init:[[optionsToGet objectAtIndex:i]valueForKey:@"visualName"]
											 propertyValue:[NSString stringWithCString:value]
											 propertyOther:@"reserved"];
			[tempProperties addObject:newProperty];
		}
	}
	
	return [[NSArray alloc]initWithArray:tempProperties];
}

- (NSString *)tStr:(const char *)input
{
	return [NSString stringWithCString:input];
}

@end
