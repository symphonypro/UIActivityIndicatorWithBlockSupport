/* UIActivityIndicatorView+Block.m

 The MIT License (MIT)
 Copyright (c) 2015 Symphony Pro / Xenon Labs
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "UIActivityIndicator+Block.h"

UIActivityIndicatorView* sharedActivityIndicatorInstance = nil;

#pragma mark -
#pragma mark Private

@interface _UIActivityIndicatorViewWithBlock : UIActivityIndicatorView{
    __strong void (^_block)(void);
}
@end

@implementation _UIActivityIndicatorViewWithBlock

-(void)_showForBlock:(void (^)(void))block forWindow:(UIWindow*)w{
    _block = block;
    [self startAnimating];
    self.center = CGPointMake(CGRectGetMidX(w.bounds),CGRectGetMidY(w.bounds));
    [w addSubview:self];
}

-(void)didMoveToSuperview{
    dispatch_async(dispatch_get_main_queue(), ^{
        _block();
        [self _dismiss];
    });
}

-(void)_dismiss{
    [sharedActivityIndicatorInstance stopAnimating];
    [sharedActivityIndicatorInstance removeFromSuperview];
}

@end

@implementation UIActivityIndicatorView (ActivityIndicatorBlock)

/* Impl. Note: Adding an activity indicator to an arbitrary view argument may cause it to be obscured by subviews that are added above it. A simpler solution is to add the indicator to the window, hence the choice of parameter here
 */

#pragma mark - 
#pragma mark Designated public methods:

+(void)showForBlock:(void (^)(void))block inWindow:(UIWindow*)w{
    [self showForBlock:block inWindow:w style:UIActivityIndicatorViewStyleGray];
}

+(void)showForBlock:(void (^)(void))block inWindow:(UIWindow*)w style:(UIActivityIndicatorViewStyle)style{
    
    //Existing activity indicator already showing: return
    if(sharedActivityIndicatorInstance.superview != nil)
        return;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        sharedActivityIndicatorInstance = [[_UIActivityIndicatorViewWithBlock alloc]initWithActivityIndicatorStyle:style];
        [(_UIActivityIndicatorViewWithBlock*)sharedActivityIndicatorInstance _showForBlock:block forWindow:w];
    });
}

@end

