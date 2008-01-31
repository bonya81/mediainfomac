//
//  mainClass.h
//  MediaInfo Mac
//
//  Created by Diego Massanti on 20/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import "mediaInfoControl.h"
#import "Category.h"
#import "Property.h"
#import "toolbar.h"
#import "helpers.h"

@interface mainClass : NSObject {
    IBOutlet id tree1;
	IBOutlet id arrayController;
	IBOutlet id treeController;
	IBOutlet id statusLabel;
	IBOutlet id mainWindow;
	IBOutlet id mainView;
	IBOutlet id lblCatName;
	IBOutlet id lblPropName;
	IBOutlet id lblActualFile;
	IBOutlet id mnuToggleDebugPanel;
	IBOutlet id debugPanel;
	IBOutlet id txtLog;
	IBOutlet id progressView;
	IBOutlet id progressIndicator;
	
	NSMutableArray * _items;
	NSString * currentOpenedFile;
	mediaInfoControl * _mediaInfo;
	BOOL _isWorking;
	BOOL _fileOpened;
	BOOL _shouldQuit;
}
- (void)exportAsTextFile;
- (BOOL)libraryInstalled;
- (BOOL)installLibrary;
- (void) initLibrary:(id)sender;
- (void) analyzeFile:(id)thePath;
- (IBAction)toggleDebugPanel:(id)sender;
- (IBAction)addCategory:(id)sender;
- (IBAction)addProperty:(id)sender;
- (IBAction)showLog:(id)sender;
- (IBAction)openFile:(id)sender;
- (void)showAlert:(NSString *)alertMessage theContext:(NSString *)alertContext theStyle:(NSAlertStyle)theStyle;
- (void)openFileSheet:(id)sender;
- (void)oPanelDidEnd:(NSOpenPanel *)oPanel returnCode:(int)returnCode;
- (BOOL)isWorking;

#pragma mark -
#pragma mark Visual Output Methods

- (void)addStream:(NSString *)streamName streamNumber:(NSNumber *)streamNumber;
@end
