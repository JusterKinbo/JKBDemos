//
//  FileAViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/8/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilaALabel.h"

typedef NS_ENUM(NSUInteger, ModuleCompleEnum) {
    PreCompile,
    Compile,
    Optimized,
};

typedef void(^ModuleCompleBlock)(void);

@interface FileAViewController : UIViewController

@property (nonatomic,strong) FilaALabel * label;

@end
