//
//  RuntimeJS2OCFeatureViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/9/28.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 //jspatch通过js给oc添加方法本质是写了一个map，然后在方法转发的时候根据map取内容，同时借助于JSValue + callWithArguments实现
 http://liuyanwei.jumppo.com/2016/04/03/iOS-JavaScriptCore.html
 //自己写一个js解析器
 https://juejin.im/post/5aa25be1518825557b4c5720
 //JSPatch 实现原理
 https://juejin.im/post/5ad7f0fa5188252ea137f2ba
 
 JSPatch 功能
 https://blog.csdn.net/skylin19840101/article/details/52611998
 
 JSPath 原理详讲
 https://github.com/bang590/JSPatch/wiki/JSPatch-%E5%AE%9E%E7%8E%B0%E5%8E%9F%E7%90%86%E8%AF%A6%E8%A7%A3
 */

@interface RuntimeJS2OCFeatureViewController : UIViewController

@end
