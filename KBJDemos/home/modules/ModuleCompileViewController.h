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
 
 *** 协议可以前向引用任何类，及时工程中没有这个类
 
 
 组件化拆离方案总结
 1.先梳理A组件与其他组件相关的文件(类、方法(实例、类对象)、属性、枚举、宏)
 2.继承解耦(比如A继承了B的一个类)
    采用继承方案：自第三方父类(比如UIKit其实也是第三方)进行解耦，注意属性继承、方法继承(这里尤其注意代理问题)
    采用组合方案：协议+代理，和上面类似，多了一步转发，好处是容易引入AOP
 3.依赖解耦(比如A直接依赖B的文件)
    采用门面模式：
        A写接口+实现
        B实现接口
        A接口的实现转发给B的实现接口
    这么做的好处是，A对B依赖就单独的靠那几个接口实现类(门面模式)，同时融入引入AOP
 4.对于属性
    仔细想想，属性也是方法，所以可以走方法的处理，我们这边遇到A的一个类用到了B累的view(这是个属性~)
    直接暴露出来这个属性或者方法，然后访问即可
 5.宏或者枚举
    这就需要根据业务划分了，业务依赖的放入第三方，可以不依赖的各自维护
 6.类实例和类对象
    其实这个没什么太大分别，只是+ - 号问题
 7.测试~测试~测试~
    一定要根据现在的情况写stub，接口有了那么就直接继承自原类并实现接口(这样你这类就是个空壳类)
    但是他可以起到很好的测试，因为你要讲原来的依赖依赖自己，所以这个是很需要的
    写一个，要测一个！
 8.不是编译过了就行了
    组件化整理需要编译时最低要求啊，业务，业务，业务，多测试不要影响显著的业务
 
 */
@interface ModuleCompileViewController : UIViewController

@property(nonatomic,copy) ModuleCompleBlock block;
@property(nonatomic,assign) ModuleCompleEnum compileA;
@property(nonatomic,assign) ModuleCompleBEnum compileB;

@end
