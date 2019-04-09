//
//  TapGesture2ndTouchEventView.m
//  KBJDemos
//
//  Created by Juster on 2019/4/9.
//  Copyright © 2019 Juster. All rights reserved.
//

#import "TapGesture2ndTouchEventView.h"

@interface TapGesture2ndTouchEventView()<UIGestureRecognizerDelegate>

@end

@implementation TapGesture2ndTouchEventView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if(self)
    {
         UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        [self addGestureRecognizer:pan];
        //touch-》手势
        pan.cancelsTouchesInView = NO;//yes隔断事件链传递
        pan.delegate = self;
//        pan.delaysTouchesEnded = NO;//
    }
    return self;
   
}

- (void)panGesture:(UITapGestureRecognizer *)tap
{
    NSLog(@"手势移动 %ld",self.tag);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

#pragma --mark touch event 重写

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesBegan:touches withEvent:event];
//    NSLog(@"touchesBegan");
//}
//
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesCancelled:touches withEvent:event];
//    NSLog(@"touchesCancelled");
//
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesEnded:touches withEvent:event];
//    NSLog(@"touchesEnded");
//
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesMoved:touches withEvent:event];
//    NSLog(@"touchesMoved");
//}
//

@end
