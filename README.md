# UIActivityIndicatorWithBlockSupport

Just #import "UIActivityIndicatorView.h"

and call one of the following that are now available as part of UIActivityIndicatorView's class methods

<code>+(void)showForBlock:(void (^)(void))block inWindow:(UIWindow *)w;</code>

or

<code>+(void)showForBlock:(void (^)(void))block inWindow:(UIWindow *)w style:(UIActivityIndicatorViewStyle)style;</code>

The <code>inWindow</code> parameter accepts any UIView's <code>window</code> property to show the indicator at the center of the application screen.
