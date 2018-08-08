//
//  ModuleCompileViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/8/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileAViewController.h"
#import "FileBViewController.h"



/**
 通过File A,File B测试AB包含同一个enum是否可用
    * File A,B同时定义各自使用，没有问题，但是如果都被某一个文件引入了就会出现重复定义的问题
    * 只改枚举名字也是不行的，导致枚举里面的内容重复定义
    * 结论--两个都要改才行
 测试包含相同类型block定义是否可用
    * 枚举名称不能和block同名
    * bcok分别在ab定义
    * 结论--block只是表明类型，可以不同文件定义相同名称的block
 通过不同工程测试是否包含相同文件名的文件是否可用(iOS的命名空间是整个app还是一个project？)
    * 博主在对一个大型项目进行组件化，通过实践，结论--不同工程否包含相同文件名的文件编译失败
    * 结论--iOS的命名空间是整个app不管里面有多少个工程(其实这个没必要实践，苹果要求app有自己的前缀的原因就在于此啊)
 */
@interface ModuleCompileViewController : UIViewController

@property(nonatomic,copy) ModuleCompleBlock block;
@property(nonatomic,assign) ModuleCompleEnum compileA;
@property(nonatomic,assign) ModuleCompleBEnum compileB;

@end
