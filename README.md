# UIActivityIndicatorWithBlockSupport

1. Just #import "UIActivityIndicator+Block.h"

and 2. Call

<code>+(void)showForBlock:(void (^)(void))block inWindow:(UIWindow *)w;</code> that becomes available as a UIActivityIndicatorView's class method

The <code>inWindow</code> parameter accepts any UIView's <code>window</code> property, in order to show the indicator at the center of the application screen.
