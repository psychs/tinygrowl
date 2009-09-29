// Created by Satoshi Nakagawa.
// You can redistribute it and/or modify it under the new BSD license.

#import <Cocoa/Cocoa.h>
#import "TinyGrowlClient.h"


@interface AppDelegate : NSObject
{
	NSWindow* window;
	TinyGrowlClient* growl;
}

@property (assign) IBOutlet NSWindow *window;

- (void)sendInfoNotification:(id)sender;
- (void)sendAlertNotification:(id)sender;

@end
