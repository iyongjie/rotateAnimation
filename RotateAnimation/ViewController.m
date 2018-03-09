//
//  ViewController.m
//  RotateAnimation
//
//  Created by liyongjie on 2018/3/9.
//  Copyright © 2018年 world. All rights reserved.
//

#import "ViewController.h"
#import "FLAnimatedImage.h"
#import "UIView+RotateAnimations.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ViewController ()
{
    FLAnimatedImageView *animateImageView;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger r = arc4random()%255;
    NSInteger g = arc4random()%255;
    NSInteger b = arc4random()%255;
    self.view.backgroundColor = RGBA(r, g, b, 1);
    
    animateImageView = [[FLAnimatedImageView alloc]initWithFrame:CGRectMake(0, 0, 123, 123)];
    animateImageView.center = self.view.center;
                                                                            
    NSString *pathOfFile = [[NSBundle mainBundle]pathForResource:@"mogutou" ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:pathOfFile];
    FLAnimatedImage *img = [FLAnimatedImage animatedImageWithGIFData:data];
    animateImageView.animatedImage = img;
    animateImageView.userInteractionEnabled = YES;
    [self.view addSubview:animateImageView];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rotateAnimation:)];
    [animateImageView addGestureRecognizer:tap];
    
}

-(void)rotateAnimation:(UITapGestureRecognizer *)tap{
    tap.enabled = !tap.enabled;
    NSLog(@"旋转吧，蘑菇头");
    //随机围绕X，Y，Z轴
    NSArray *arr = @[@(X_Axis),@(Y_Axis),@(Z_Axis)];
    AxisType type = [arr[arc4random()%3] integerValue];
    [animateImageView rotateAnimationWithAxis:type];
    
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [animateImageView stopRotate];
        tap.enabled = !tap.enabled;
    });
    

}


@end
