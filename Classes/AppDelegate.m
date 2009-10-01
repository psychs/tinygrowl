// Created by Satoshi Nakagawa.
// You can redistribute it and/or modify it under the new BSD license.

#import "AppDelegate.h"

#define ALERT_NOTIFICATION_NAME		@"Alert received"
#define INFO_NOTIFICATION_NAME		@"Info received"


@implementation AppDelegate

@synthesize window;

- (void)dealloc
{
	[growl release];
	[super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)note
{
	growl = [TinyGrowlClient new];
	growl.delegate = self;
	growl.allNotifications = [NSArray arrayWithObjects:ALERT_NOTIFICATION_NAME, INFO_NOTIFICATION_NAME, nil];
	
	[window center];
	[window makeKeyAndOrderFront:self];
}

- (void)sendInfoNotification:(id)sender
{
	id context = @"test info context";
	
	[growl notifyWithType:INFO_NOTIFICATION_NAME
					title:@"Info title"
			  description:@"Info description"
			 clickContext:context];
}

- (void)sendAlertNotification:(id)sender
{
	id context = @"test alert context";
	
	[growl notifyWithType:ALERT_NOTIFICATION_NAME
					title:@"Alert Title"
			  description:@"Alert description"
			 clickContext:context
				   sticky:YES
				 priority:1
					 icon:nil];
}

- (void)tinyGrowlClient:(TinyGrowlClient*)sender didClick:(id)context
{
	NSLog(@"clicked: %@", context);
}

- (void)tinyGrowlClient:(TinyGrowlClient*)sender didTimeOut:(id)context
{
	NSLog(@"timed out: %@", context);
}

@end
