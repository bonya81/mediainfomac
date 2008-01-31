//
//  toolbar.h
//  MediaInfo Mac
//
//  Created by Diego Massanti on 23/01/08.
//  Copyright 2008 Diego Massanti. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface toolbar : NSToolbar {
	
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag;    
- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar*)toolbar;
- (NSArray *)toolbarAllowedItemIdentifiers:(NSToolbar*)toolbar;

@end
