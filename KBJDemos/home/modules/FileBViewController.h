//
//  FileBViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/8/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**

 typedef NS_ENUM(NSUInteger, ModuleComple) {
 PreCompile,
 Compile,
 Optimized,
 };
 
 */

typedef NS_ENUM(NSUInteger, ModuleCompleBEnum) {
    PreCompileB,
    CompileB,
    OptimizedB,B
};

typedef void(^ModuleCompleBlock)(void);

@interface FileBViewController : UIViewController

@end
