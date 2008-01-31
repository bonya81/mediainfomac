//
//  mainClass.m
//  MediaInfo Mac
//
//  Created by Diego Massanti on 20/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import "mainClass.h"

@implementation mainClass

#pragma mark -
#pragma mark Static Declarations

static NSString *OpenFileToolbarItemIdentifier = @"OpenFileToolbarItemIdentifier";
static NSString *SaveToTextToolbarItemIdentifier = @"SaveToTextToolbarItemIdentifier";

#pragma mark -
#pragma mark Initialization Methods

- (id) init
{
	self = [super init];
	if (self != nil) {
		_items = [[NSMutableArray alloc]init];
		_mediaInfo = [[mediaInfoControl alloc]init];
		_shouldQuit = NO;
		_fileOpened = NO;
		currentOpenedFile = [[NSString alloc]init];
		
	}
	return self;
}

- (void) initLibrary:(id)sender
{
	if (![_mediaInfo loadLibrary])
	{
		[self showAlert:@"Can not load the mediaInfo library!" theContext:@"OH MY GOD, im gonna quit!!!" theStyle:NSCriticalAlertStyle];
		[NSApp terminate:self];
	}
}

#pragma mark -
#pragma mark Alert Methods

- (void)noLibraryalertDidEnd:(NSAlert *)alert returnCode:(int)returnCode contextInfo:(void *)contextInfo {

	if (returnCode == NSAlertFirstButtonReturn) {
		//
    } else {
		[NSApp terminate:self];
	}
}


- (void)awakeFromNib
{
	[tree1 setAction:@selector(treeChanged:)];
	[tree1 setContinuous:YES];
	[mainWindow center];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(initLibrary:) 
												 name:NSApplicationDidFinishLaunchingNotification 
											   object:NSApp];
	
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(threadWillExit:) 
												 name:NSThreadWillExitNotification 
											   object:self];
	
	toolbar * mainToolbar = [[toolbar alloc]initWithIdentifier:@"mainToolbar"];
	[mainToolbar setDisplayMode:NSToolbarDisplayModeIconAndLabel];
	[mainToolbar setAllowsUserCustomization:NO];
	[mainToolbar setShowsBaselineSeparator:YES];
	
	[mainToolbar setDelegate:mainToolbar];
	[mainWindow setToolbar:mainToolbar];
	
	/*NSTableColumn * propsColumn = [tree1 outlineTableColumn];
	[tree1 setAutoresizesOutlineColumn:YES];
	[propsColumn setResizingMask:NSTableColumnAutoresizingMask];*/
}


- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

- (void)treeChanged:(id)sender {	
	id selectedObject = [[treeController selectedObjects]objectAtIndex:0];
	NSString * name = [selectedObject className];
	[statusLabel setStringValue:[NSString stringWithFormat:@"Currently selected object's className is : %@", name]];	
}

- (BOOL)libraryInstalled
{
	NSFileManager * fm = [[NSFileManager alloc]init];
	return [fm fileExistsAtPath:@"/usr/local/lib/libmediainfo.00.dylib"];
}

- (BOOL)installLibrary
{
	NSFileManager * fm = [[NSFileManager alloc]init];
	NSBundle * bundle = [NSBundle bundleForClass:[self class]];
	return [fm copyPath:[bundle pathForResource:@"libmediainfo.0" ofType:@"dylib"] toPath:@"/usr/local/lib/libmediainfo.00.dylib"  handler:nil];
}
	

- (NSMutableArray *)items
{
	return _items;
}

#pragma mark -
#pragma mark Main Interface Actions

- (IBAction)addCategory:(id)sender {
	/*Category * tmpCat = [[Category alloc]init:[lblCatName stringValue] categoryOther:@"Some Other Value"];
	[tmpCat setCategoryName:[lblCatName stringValue]];
	NSMutableArray * items = [self items];
	[items addObject:tmpCat];
	[arrayController rearrangeObjects];
	[treeController rearrangeObjects];*/
}

- (IBAction)addProperty:(id)sender {
	/*printf("Level for row: %i\n", [tree1 levelForRow:[tree1 selectedRow]]);
	if ([tree1 levelForRow:[tree1 selectedRow]] == 0 )
	{
		Category * actualCategory = [[treeController selectedObjects]objectAtIndex:0];
		NSMutableArray * items = [actualCategory items];
		Property * newProperty = [[Property alloc]init:[lblPropName stringValue] propertyValue:@"Test Value" propertyOther:@"Test Other" propertyParent:actualCategory];
		[items addObject:newProperty];
		printf("I have now %i items for the category with name %s.\n", [actualCategory getNumberOfChildren], [actualCategory getCategoryName]);
		[arrayController rearrangeObjects];
		[treeController rearrangeObjects];
		[tree1 expandItem:[tree1 itemAtRow:[tree1 selectedRow]]];
	} else {
		[self showAlert:@"It's not possible to add a children\nto a non-root category!"
			 theContext:@"Right now and due to my own needs i did this code with just 2 classes, being class 1 \"Category\" and class 2 \"Property\".\nThat being said, it should be really easy for you to create your own generic class in order to get an infinite hierarchical tree ;)."
			   theStyle:NSWarningAlertStyle];
	}*/
	

}

- (IBAction)showLog:(id)sender
{
	
}

- (IBAction)openFile:(id)sender
{
	[self openFileSheet:self];
	
}

- (IBAction)exportData:(id)sender
{
	if (_fileOpened)
	{
		[self exportAsTextFile];
	} else {
		[self showAlert:@"You need to open some file first" theContext:@"What you want to export, air ? You need to open some file first :)" theStyle:NSWarningAlertStyle];
	}
	
}

- (IBAction)toggleDebugPanel:(id)sender
{
	if ([debugPanel isVisible]) {
		[debugPanel orderOut:self];
	} else {
		[debugPanel orderFront:self];
	}
	if ([debugPanel isVisible]) {
		[mnuToggleDebugPanel setState:1];
	} else {
		[mnuToggleDebugPanel setState:0];
	}
}

#pragma mark -
#pragma mark Main File Analisys Methods

- (void)analyzeFile:(id)thePath
{
	_isWorking = YES;
	
		[_mediaInfo createInstance];
		if ([_mediaInfo openFile:thePath])
		{
			NSString * actualFile = [thePath lastPathComponent];
			[lblActualFile setStringValue:[NSString stringWithFormat:@"Info for: %@", actualFile]];
			
			// get Streams
			[[self items]removeAllObjects];
			NSArray * temp = [_mediaInfo getMediaStreams];
			int i = 0;
			while (i < [temp count]) {
				[[self items]addObject:[temp objectAtIndex:i]];
				i++;
			}
		[arrayController rearrangeObjects];
		[treeController rearrangeObjects];
			
		// keep record of actual file
		currentOpenedFile = [[thePath lastPathComponent]copy];
		}
	_isWorking = NO;
	
	
}

- (void)threadWillExit:(id)sender
{
	NSBeep();
}



#pragma mark -
#pragma mark Visual Alerts

// File Open Sheet
- (void)openFileSheet:(id)sender
{
    NSOpenPanel *oPanel = [[NSOpenPanel alloc]init];
	
    [oPanel setAllowsMultipleSelection:NO];
	[oPanel setCanChooseDirectories:NO];
	[oPanel setTitle:@"Select a file to analyze..."];
	[oPanel beginSheetForDirectory:nil 
							  file:nil
					modalForWindow:mainWindow
					 modalDelegate:self
					didEndSelector:@selector(oPanelDidEnd:returnCode:)
					   contextInfo:nil];
	
}
			  
- (void)oPanelDidEnd:(NSOpenPanel *)oPanel returnCode:(int)returnCode {
	[oPanel close];
	if (returnCode == NSOKButton)
	{
		// Create a new thread to run the analysis.
		
		[self analyzeFile:[oPanel filename]];
		_fileOpened = YES;

	}
	[oPanel release];
}

- (void)showAlert:(NSString *)alertMessage theContext:(NSString *)alertContext theStyle:(NSAlertStyle)theStyle
{
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	if (theStyle == NSCriticalAlertStyle) {
		_shouldQuit = YES;
	}
	[alert addButtonWithTitle:@"OK"];
	[alert setMessageText:alertMessage];
	[alert setInformativeText:alertContext];
	[alert setAlertStyle:theStyle];
	[alert beginSheetModalForWindow:mainWindow modalDelegate:self didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:nil];
}

- (void)alertDidEnd:(NSAlert *)alert returnCode:(int)returnCode contextInfo:(void *)contextInfo {
	if (_shouldQuit) {
		//[NSApp terminate:self];
	}
	if (returnCode == NSAlertFirstButtonReturn) {
		//
    }
}

#pragma mark -
#pragma mark Visual Output Methods



- (void)addStream:(NSString *)streamName streamNumber:(NSNumber *)streamNumber
{
	//int counter = 0;
	
	/*while (counter < [streamNumber intValue] ) {
		NSString * fStream = [NSString stringWithFormat:@"%@ stream # %i", streamName, counter];
		Category * tmpCat = [[Category alloc]init:fStream streamKind:<#(MediaInfo_stream_C)streamKind#> streamNumber:<#(int)streamNumber#>
		[tmpCat setCategoryName:fStream];
		NSMutableArray * items = [self items];
		[items addObject:tmpCat];
		[arrayController rearrangeObjects];
		[treeController rearrangeObjects];
		counter ++;
	}*/
}

- (void)addStreamProperties:(NSString *)streamName
{
	
}

#pragma mark -
#pragma mark Text Export Methods

- (void)exportAsTextFile
{
	NSString * theText = [[NSString alloc]init];
	Helpers * helper = [[Helpers alloc]init];
	NSDictionary * stringsGeneral = [[NSDictionary alloc]initWithDictionary:[helper getGeneralStrings]];

	theText = [theText stringByAppendingString:[NSString stringWithString:@"\n*** MediaInfo Mac Beta // Plain text file report\n"]];
	theText = [theText stringByAppendingString:[NSString stringWithFormat:@"%@\n",[NSDate date]]];
	theText = [theText stringByAppendingString:[NSString stringWithFormat:@"Information for File: %@\n\n", currentOpenedFile]];
	int catCounter = 0;
	NSMutableArray * tmpItems = [[NSMutableArray alloc]initWithArray:[self items]];
	for (catCounter; catCounter < [tmpItems count]; catCounter++) {
		Category * tmpCat = [tmpItems objectAtIndex:catCounter];
		theText = [theText stringByAppendingString:[NSString stringWithFormat:@"%@\n", [tmpCat getCategoryName]]];
		
		int propCounter = 0;
		NSMutableArray * tmpProperties = [tmpCat items];
		for (propCounter; propCounter < [tmpProperties count]; propCounter++) {
			
			NSString * prettyName = [[[NSString alloc]init]autorelease];
			Property * tmpProp = [tmpProperties objectAtIndex:propCounter];
			NSArray * propertyNames;
			
			// We select the proper Keys based on the stream kind
			switch ([tmpCat getStreamKind]) {
				case MediaInfo_Stream_General:
					propertyNames = [stringsGeneral objectForKey:@"MediaInfo_Stream_General"];
					break;
				case MediaInfo_Stream_Video:
					propertyNames = [stringsGeneral objectForKey:@"MediaInfo_Stream_Video"];
					break;
				case MediaInfo_Stream_Audio:
					propertyNames = [stringsGeneral objectForKey:@"MediaInfo_Stream_Audio"];
					break;
				default:
					break;
			}
			int iCounter = 0;
			
			// We search the whole array for the value we're looking for
			for (iCounter; iCounter < [propertyNames count]; iCounter++) {
				NSString * pName = [[propertyNames objectAtIndex:iCounter]valueForKey:@"visualName"];
				
				if ([pName isEqualTo:[tmpProp getPropertyName]]) {
					prettyName = [[propertyNames objectAtIndex:iCounter]valueForKey:@"visualName"];
					break;
				}
			}
			
			
			if ([[tmpProp getPropertyValue]isNotEqualTo:@""])
			{
				theText = [theText stringByAppendingString:[NSString stringWithFormat:@"\t%@ -> %@\n", prettyName, [tmpProp getPropertyValue]]];
			}
			
			//[prettyName release];
			
		}
	}
	
	NSSavePanel * savePanel = [[NSSavePanel alloc]init];
	[savePanel setAllowedFileTypes:[[NSArray alloc]initWithObjects:@"txt", nil]];
	[savePanel setExtensionHidden:NO];
	[savePanel setPrompt:@"Save text report"];
	[savePanel setRequiredFileType:@"txt"];
	//[savePanel setMessage:@"blahblah"];
	
	[savePanel beginSheetForDirectory:nil
								 file:nil
					   modalForWindow:mainWindow
						modalDelegate:self
					   didEndSelector:@selector(savePanelDidEnd:returnCode:contextInfo:)
						  contextInfo:[theText copy]];
	
	
	
	
	//NSLog(theText);

}

- (void)savePanelDidEnd:(NSSavePanel *)sheet returnCode:(int)returnCode  contextInfo:(NSString  *)contextInfo
{
	[sheet close];
	if ( returnCode == NSOKButton )
	{
		[contextInfo writeToFile:[sheet filename] atomically:YES ];
	}
	[sheet release];
		
		
}

- (BOOL) isWorking
{
	if (_isWorking)
	{
		[progressIndicator startAnimation:self];
	} else {
	
		[progressIndicator stopAnimation:self];
	}
	
	return _isWorking;
}

#pragma mark -
#pragma mark Toolbar Control Methods

-(BOOL)validateToolbarItem:(NSToolbarItem *)toolbarItem
{
    if ([[toolbarItem itemIdentifier] isEqual:OpenFileToolbarItemIdentifier]) {
        // We will return YES (enable the save item)
        // only when the document is dirty and needs saving
        return ![self isWorking];
    } else if ([[toolbarItem itemIdentifier] isEqual:SaveToTextToolbarItemIdentifier]) {
        // always enable print for this window
        return ![self isWorking];
    }
    return YES;
}


@end
