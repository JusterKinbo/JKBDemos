//
//  CustomMultiVCAnimation.h
//  KBJDemos
//
//  Created by Juster on 2018/7/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

typedef enum {
    MultiAnimationTypePresent,
    MultiAnimationTypeDismiss
} MultiVCAnimationType;

#import <Foundation/Foundation.h>
/**
 多个vc中只取出部分vc的view
 */
@interface CustomMultiVCAnimation : NSObject <UIViewControllerAnimatedTransitioning>

     @property (nonatomic, assign) MultiVCAnimationType animationType;

@end

