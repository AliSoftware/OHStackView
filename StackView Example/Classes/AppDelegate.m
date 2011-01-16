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

-(IBAction)buttonTapped:(UIButton*)sender {
	CGRect r = sender.frame;
	if (sender.selected) {
		r.size.width /= 2;
		r.size.height /= 2;		
	} else {
		r.size.width *= 2;
		r.size.height *= 2;		
	}
	sender.frame = r;
	sender.selected = !sender.selected;
	[sender.superview sizeToFit]; // resize parent HorizontalLayout
}

@end

