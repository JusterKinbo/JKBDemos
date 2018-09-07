//
//  RuntimeViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/8/8.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 runtime 可以获取所有类，然后找出指定类执行指定方法
 
 自动解档归档依赖于get set一致性（只需要设置get set即可），想要实现自动配置view需要重新封装view，然后runtime get set
 NSSelectorFromString
 NSClassFromString
 然而只能做简单展示view。。。不能添加方法
 
 对于共有的方法可以考虑提取到父类中，比如  frame_string
 
 * 效率的话需进行测试，方式原生生成与runtime生成时间比较即可
 button & img 各生产2个 * 10000的情况下相差1.716453 微秒，几乎无差别
 
 
 格式要求：
 字典：
    key（类）：value【数组或字典】
            如果【】里面有children必须重复上面操作
 
 视图叠加考虑父子视图即可，或者先后顺序（有数组可以实现）
 
 支持网络图片，但是富文本的attach不支持占位图
 
 */
@interface RuntimeViewController : UIViewController

@end
