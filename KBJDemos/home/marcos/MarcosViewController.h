//
//  MarcosViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/7/3.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MarcosValue(value) \
class Not_Exist;

#define MarcosLog(value) NSLog(@""#value"");
#define MarcosTestLog MarcosLog(value)

@MarcosValue(value)
@interface MarcosViewController : UIViewController

@end


/**
 这里MarcosValue的@其实是借助于其他@，比如此处借助了@class 当然可以@autoreleasepool ==@strongSelf @weakSelf就是这么实现的
 
 * 字符串化：#将参数转为字符串
 * 拼接参数: ##
 * 多参数：__VA_ARGS__
 * __attribute__((used,section("xx"))) 代码插入到xx段，used表示后面会使用，unused后面不一定使用
 
 比如这个宏 MarcosTestLog MarcosLog(value) --没有传入value默认就代表了是value
 
 如何实现__attribute__(used,"__DATA,#modal/class/service注册")
 1.使用宏注册到输入段
 2.如何从代码段中取出：
    1)找到项目的入口--mainBundle获取第一个方法main
    2)通过main获取Dl_info
    3)getsectiondata -- mach-o里面的东西，获取需要的东西
    4)添加到数组即可
 3.使用--每一个元素都是string类型的class
    1)转成Class类型
    2)runtime -- respond selector初始化--固定事件
    3)以key--value 模拟 事件 --自定义事件
 */
