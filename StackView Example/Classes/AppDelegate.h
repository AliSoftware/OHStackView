//
//  AppDelegate.h
//  StackView Example
//
//  Created by Olivier on 16/01/11.
//  Copyright 2011 AliSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OHStackView.h"

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet OHStackView* verticalLayout;
}
-(IBAction)buttonTapped:(UIButton*)sender;
@end
