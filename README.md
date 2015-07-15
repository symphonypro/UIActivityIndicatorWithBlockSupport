# UIActivityIndicatorWithBlockSupport

Just #import "UIActivityIndicatorView.h"

and call one of the following methods that are now available as part of UIActivityIndicatorView's class methods

  +(void)showForBlock:(void (^)(void))block inWindow:(UIWindow *)w; //Uses UIActivityIndicatorViewStyleGrays
  +(void)showForBlock:(void (^)(void))block inWindow:(UIWindow *)w style:(UIActivityIndicatorViewStyle)style;

