//
//  UIView+RotateAnimations.m
//  Demo2018
//
//  Created by liyongjie on 2018/3/9.
//  Copyright © 2018年 world. All rights reserved.
//

#import "UIView+RotateAnimations.h"

@implementation UIView (RotateAnimations)
-(void)rotateAnimationWithAxis:(AxisType)axisType{
    
    CABasicAnimation * rotationAnimation = nil;
    
    switch (axisType) {
        case X_Axis:{
            rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"]; //围绕x轴旋转
            break;
        }
        case Y_Axis:{
            rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"]; //围绕y轴旋转
            break;
        }
        case Z_Axis:{
            rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"]; //围绕z轴旋转
            break;
        }
        default:
            break;
    }
    
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI*2.0 ];
 
    rotationAnimation.duration = 2; //旋转周期
    rotationAnimation.cumulative = YES;//旋转累加角度
    rotationAnimation.repeatCount = 10000;//旋转次数
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}


-(void)stopRotate {
    [self.layer removeAllAnimations];
    
}
@end
