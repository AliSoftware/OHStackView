//
//  TapToZoomView.m
//  StackView Example
//
//  Created by Olivier on 16/01/11.
//  Copyright 2011 AliSoftware. All rights reserved.
//

#import "TapZoomLabel.h"


@implementation TapZoomLabel

- (id) initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self != nil) {
		self.userInteractionEnabled = YES;
	}
	return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	CGRect r = self.frame;
	if (zoomed) {
		r.size.width /= 2;
		r.size.height /= 2;
	} else {
		r.size.width *= 2;
		r.size.height *= 2;
	}
	self.frame = r;
	zoomed = !zoomed;
	[self.superview sizeToFit];
}

@end
