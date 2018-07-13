//
//  CustomPresentAnimation.h
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//



typedef enum {
    AnimationTypePresent,
    AnimationTypeDismiss
} AnimationType;

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomPresentAnimation : NSObject <UIViewControllerAnimatedTransitioning>
    
    @property (nonatomic, assign) AnimationType animationType;
    
@end
