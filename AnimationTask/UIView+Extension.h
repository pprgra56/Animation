 


#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

/**
 * 视图最右侧X
 **/
@property (nonatomic, assign) CGFloat right;

/**
 * 视图最下侧Y
 **/
@property (nonatomic, assign) CGFloat bottom;

/**
 * 视图最左侧X
 **/
@property (nonatomic, assign) CGFloat left;

/**
 * 视图最上侧Y
 **/
@property (nonatomic, assign) CGFloat top;

@end
