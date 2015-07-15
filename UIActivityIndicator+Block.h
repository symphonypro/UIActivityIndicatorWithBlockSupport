
/* UIActivityIndicatorView+Block.h
 
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

//UIActivityIndicatorView extension with support for ObjC blocks; with convenient singleton packaging.
@interface UIActivityIndicatorView (ActivityIndicatorBlock)

/* Designated methods for presentation
 * Notes:
 * • <block> always executes on main thread.
 * • The <block> parameter must be a method call or code block that is a direct user action 
 * (i.e. a button press). It is almost never a good idea to call this method for an action 
 * that can occur repeatedly in a processing loop, which would be occur if the block is several 
 * call stacks removed from a user action.
 */

+(void)showForBlock:(void (^)(void))block inWindow:(UIWindow *)w; //Uses UIActivityIndicatorViewStyleGrays
+(void)showForBlock:(void (^)(void))block inWindow:(UIWindow *)w style:(UIActivityIndicatorViewStyle)style;

@end
