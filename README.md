# UIActivityIndicatorWithBlockSupport

1. Just #import "UIActivityIndicator+Block.h" and

2. Call

<code>+(void)showForBlock:(void (^)(void))block inWindow:(UIWindow *)w;</code> 

that becomes available as a UIActivityIndicatorView class method.

The <code>inWindow</code> parameter accepts any <code>window</code> property of a live UIView in your application. This parameter is required in order to show the indicator at the center of the application screen and at the top of the view hierarchy.
