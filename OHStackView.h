/***********************************************************************************
 *
 * Copyright (c) 2010 Olivier Halligon
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 ***********************************************************************************
 *
 * Any comment or suggestion welcome. Referencing this project in your AboutBox is appreciated.
 * Please tell me if you use this class so we can cross-reference our projects.
 *
 ***********************************************************************************/

#import <UIKit/UIKit.h>

typedef enum {
	OHStackAlignmentNone = 0,        // Don't align
	
	OHStackAlignmentStackFirstEdges, // Stack views on top (vertical) / left (horizontal)
	OHStackAlignmentStackLastEdges,  // Stack edges on bottom (vertical) / right (horizontal)
	
	OHStackAlignmentAlignFirstEdges, // Align top (vertical) / left (horizontal) edges
	OHStackAlignmentAlignCenters,    // Align centers
	OHStackAlignmentAlignLastEdges,  // Align bottom (vertical) / right (horizontal) edges
	
	
	// more understandable aliases for vertical modes
	OHStackAlignmentStackFromTop     = OHStackAlignmentStackFirstEdges,
	OHStackAlignmentStackFromBottom  = OHStackAlignmentStackLastEdges,
	OHStackAlignmentAlignTopEdges    = OHStackAlignmentAlignFirstEdges,
	OHStackAlignmentAlignBottomEdges = OHStackAlignmentAlignLastEdges,
	
	// more understandable aliases for horizontal modes
	OHStackAlignmentStackFromLeft    = OHStackAlignmentStackFirstEdges,
	OHStackAlignmentStackFromRight   = OHStackAlignmentStackLastEdges,
	OHStackAlignmentAlignLeftEdges   = OHStackAlignmentAlignFirstEdges,
	OHStackAlignmentAlignRightEdges  = OHStackAlignmentAlignLastEdges,
} OHStackAlignment;


/////////////////////////////////////////////////////////////////////////////
// MARK: -
/////////////////////////////////////////////////////////////////////////////

@interface OHStackView : UIView {
	OHStackAlignment horizontalAlignment;
	OHStackAlignment verticalAlignment;
	CGSize margins;
	CGSize spacing;
}
@property(nonatomic,assign) OHStackAlignment horizontalAlignment;
@property(nonatomic,assign) OHStackAlignment verticalAlignment;
@property(nonatomic,assign) CGSize spacing;
@property(nonatomic,assign) CGSize margins;
@end
