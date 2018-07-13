//
//  HisSugViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBAHisSugPageView.h"

@interface HisSugViewController : UIViewController

- (void)updateHissugUI;

@end

/**
 srand((unsigned)time(0)); //不加这句每次产生的随机数不变
 int i = rand() % 5;
 
 srandom(time(0));
 int i = random() % 5;
 
 int i = arc4random() % 5 ;
 
 注：rand()和random()实际并不是一个真正的伪随机数发生器，在使用之前需要先初始化随机种子，否则每次生成的随机数一样。
 
 arc4random() 是一个真正的伪随机算法，不需要生成随机种子，因为第一次调用的时候就会自动生成。而且范围是rand()的两倍
 */
