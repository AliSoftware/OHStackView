//
//  AppDelegate.m
//  StackView Example
//
//  Created by Olivier on 16/01/11.
//  Copyright 2011 AliSoftware. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	verticalLayout.spacing = CGSizeMake(5,5);
	verticalLayout.horizontalAlignment = OHStackAlignmentAlignLeftEdges;
	verticalLayout.verticalAlignment = OHStackAlignmentStackFromTop;
	
	for(OHStackView* horizontalLayout in verticalLayout.subviews) {
		horizontalLayout.spacing = CGSizeMake(5,5);
		horizontalLayout.horizontalAlignment = OHStackAlignmentStackFromLeft;
		horizontalLayout.verticalAlignment = OHStackAlignmentAlignCenters;
	}
	
	return YES;
}

@end

