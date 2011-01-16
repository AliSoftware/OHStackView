//
//  StackView.m
//
//  Created by Olivier on 20/11/09.
//  Copyright 2009 AliSoftware. All rights reserved.
//

#import "OHStackView.h"

@interface OHStackView()
-(CGSize)computeForSize:(CGSize)size apply:(BOOL)apply;
@end

/////////////////////////////////////////////////////////////////////////////

@implementation OHStackView
@synthesize horizontalAlignment;
@synthesize verticalAlignment;
@synthesize spacing;
@synthesize margins;


/////////////////////////////////////////////////////////////////////////////
// MARK: -
// MARK: Setters
/////////////////////////////////////////////////////////////////////////////

-(void)setHorizontalAlignment:(OHStackAlignment)v
{
	horizontalAlignment = v;
	[self setNeedsLayout];
}
-(void)setVerticalAlignment:(OHStackAlignment)v
{
	verticalAlignment = v;
	[self setNeedsLayout];
}
-(void)setSpacing:(CGSize)v
{
	spacing = v;
	[self setNeedsLayout];
}
-(void)setMargins:(CGSize)v
{
	margins = v;
	[self setNeedsLayout];
}

/////////////////////////////////////////////////////////////////////////////
// MARK: -
// MARK: Overriden methods
/////////////////////////////////////////////////////////////////////////////

-(void)layoutSubviews
{
	(void)[self computeForSize:self.bounds.size apply:YES];
	[super layoutSubviews];
}
-(CGSize)sizeThatFits:(CGSize)size
{
	return [self computeForSize:size apply:NO];
}

-(CGSize)computeForSize:(CGSize)size apply:(BOOL)apply
{
	CGSize cumul = margins;
	for(UIView* v in self.subviews)
	{
		CGRect f = v.frame;
		switch (horizontalAlignment) {
			case OHStackAlignmentStackFirstEdges:
				f.origin.x = cumul.width;
				cumul.width += f.size.width + spacing.width;
				break;
			case OHStackAlignmentStackLastEdges:
				f.origin.x = (self.bounds.size.width-cumul.width) - f.size.width;
				cumul.width += f.size.width + spacing.width;
				break;
			case OHStackAlignmentAlignFirstEdges:
				f.origin.x = margins.width;
				cumul.width = MAX(cumul.width , margins.width + f.size.width + spacing.width);
				break;
			case OHStackAlignmentAlignCenters:
				f.origin.x = (self.bounds.size.width-f.size.width)/2;
				cumul.width = MAX(cumul.width , margins.width + f.size.width + spacing.width);
				break;
			case OHStackAlignmentAlignLastEdges:
				f.origin.x = self.bounds.size.width-f.size.width-margins.width;
				cumul.width = MAX(cumul.width , margins.width + f.size.width + spacing.width);
				break;
			default: // OHStackAlignmentNone
				cumul.width = MAX(cumul.width , margins.width + f.origin.x+f.size.width + spacing.width);
				break;
		}
		switch (verticalAlignment) {
			case OHStackAlignmentStackFirstEdges:
				f.origin.y = cumul.height;
				cumul.height += f.size.height + spacing.height;
				break;
			case OHStackAlignmentStackLastEdges:
				f.origin.y = (self.bounds.size.height-cumul.height) - f.size.height;
				cumul.height += f.size.height + spacing.height;
				break;
			case OHStackAlignmentAlignFirstEdges:
				f.origin.y = margins.height;
				cumul.height = MAX(cumul.height , margins.height + f.size.height + spacing.height);
				break;
			case OHStackAlignmentAlignCenters:
				f.origin.y = (self.bounds.size.height-f.size.height)/2;
				cumul.height = MAX(cumul.height , margins.height + f.size.height + spacing.height);
				break;
			case OHStackAlignmentAlignLastEdges:
				f.origin.y = self.bounds.size.height-f.size.height-margins.height;
				cumul.height = MAX(cumul.height , margins.height + f.size.height + spacing.height);
				break;
			default: // OHStackAlignmentNone
				cumul.height = MAX(cumul.height , margins.height + f.origin.y+f.size.height + spacing.height);
				break;
		}
		if (apply) v.frame = f;
	}
	cumul.width  -= spacing.width;
	cumul.height -= spacing.height;
	return CGSizeMake(cumul.width+margins.width, cumul.height+margins.height);
}

@end
