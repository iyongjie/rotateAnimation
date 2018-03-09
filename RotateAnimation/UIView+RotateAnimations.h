//
//  UIView+RotateAnimations.h
//  Demo2018
//
//  Created by liyongjie on 2018/3/9.
//  Copyright © 2018年 world. All rights reserved.
//

#import <UIKit/UIKit.h>


//X,Y,Z轴
typedef NS_ENUM(NSUInteger,AxisType){
    X_Axis,
    Y_Axis,
    Z_Axis
};


@interface UIView (RotateAnimations)

//旋转动画
-(void)rotateAnimationWithAxis:(AxisType )axisType;

//停止旋转
-(void)stopRotate;


@end
