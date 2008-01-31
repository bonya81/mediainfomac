//
//  toolbar.m
//  MediaInfo Mac
//
//  Created by Diego Massanti on 23/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import "toolbar.h"


@implementation toolbar

static NSString *OpenFileToolbarItemIdentifier = @"OpenFileToolbarItemIdentifier";
static NSString *ShowLogToolbarItemIdentifier = @"ShowLogToolbarItemIdentifier";
static NSString *SaveToTextToolbarItemIdentifier = @"SaveToTextToolbarItemIdentifier";
- (id) init
{
	self = [super init];
	if (self != nil) {
	}
	return self;
}



- (NSArray *) toolbarAllowedItemIdentifiers: (NSToolbar *) toolbar {
	return [NSArray arrayWithObjects: OpenFileToolbarItemIdentifier, NSToolbarShowColorsItemIdentifier,
			NSToolbarShowFontsItemIdentifier,
			NSToolbarCustomizeToolbarItemIdentifier,
			NSToolbarFlexibleSpaceItemIdentifier,
			NSToolbarSpaceItemIdentifier,
			NSToolbarSeparatorItemIdentifier, nil];
}

- (NSArray *) toolbarDefaultItemIdentifiers: (NSToolbar *) toolbar {
    return [NSArray arrayWithObjects: OpenFileToolbarItemIdentifier,
			SaveToTextToolbarItemIdentifier,
			NSToolbarFlexibleSpaceItemIdentifier,
			ShowLogToolbarItemIdentifier,
			nil];
}



- (NSToolbarItem *) toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag
{
    NSToolbarItem *toolbarItem = [[[NSToolbarItem alloc] initWithItemIdentifier: itemIdentifier] autorelease];
	
	
	
	
	if ([itemIdentifier isEqual: OpenFileToolbarItemIdentifier]) {
		// Set the text label to be displayed in the
		// toolbar and customization palette
		[toolbarItem setLabel:@"Open file..."];
		[toolbarItem setPaletteLabel:@"Open file..."];
		
		// Set up a reasonable tooltip, and image
		// you will likely want to localize many of the item's properties
		[toolbarItem setToolTip:@"Open a file to process"];
		[toolbarItem setImage:[NSImage imageNamed:@"LinkBack"]];
		
		// Tell the item what message to send when it is clicked
		[toolbarItem setTarget:nil];
		[toolbarItem setAction:@selector(openFile:)];
	} else if ([itemIdentifier isEqual: ShowLogToolbarItemIdentifier]) {
		[toolbarItem setLabel:@"Toggle debug"];
		[toolbarItem setPaletteLabel:@"Toggle debug"];
		[toolbarItem setToolTip:@"Show the debug log"];
		[toolbarItem setImage:[NSImage imageNamed:@"Terminal"]];
		[toolbarItem setTarget:nil];
		[toolbarItem setAction:@selector(toggleDebugPanel:)];
    } else if ([itemIdentifier isEqual: SaveToTextToolbarItemIdentifier]) {
		[toolbarItem setLabel:@"Export"];
		[toolbarItem setPaletteLabel:@"Export"];
		[toolbarItem setToolTip:@"Exports the current analysis to a text file."];
		[toolbarItem setImage:[NSImage imageNamed:@"Record"]];
		
		[toolbarItem setTarget:nil];
		[toolbarItem setAction:@selector(exportData:)];
		[toolbarItem setEnabled:YES];
	} else  {
		// itemIdentifier referred to a toolbar item that is not
		// provided or supported by us or Cocoa
		// Returning nil will inform the toolbar
		// that this kind of item is not supported
		toolbarItem = nil;
    }
    return toolbarItem;
}
@end
