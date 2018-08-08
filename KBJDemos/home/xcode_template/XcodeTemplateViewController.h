//
//  XcodeTemplateViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/8/8.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 
 实现需要参考路径：/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates 
 
 自定义文件头部注释说明 参考：https://blog.csdn.net/linshaolie/article/details/81083229
 IDETemplateMacros.plist 记得放对地方哦
 相关宏说明：https://help.apple.com/xcode/mac/9.0/index.html?localePath=en.lproj#/dev7fe737ce0
 
 
 自定义xcode 模板 参考：https://www.jianshu.com/p/93527682d8d3 -- 注意templateinfo里面文件的写入可以参考xcode本身自带的内容
 
 1. 修改系统模板样式
 Xcode系统模板的路径是/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/，文件夹里面有文件模板File Templates和工程模板Project Templates
 2. 不修改系统的模板--新增 参考中间地带
 可以在File Templates下新建一个Custom Template文件夹，把系统的Cocoa Touch Class.xctemplate复制进去，然后进行修改就可以了。
 */

@interface XcodeTemplateViewController : UIViewController

@end
