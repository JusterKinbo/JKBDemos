//
//  FileAChildViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/8/7.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "FileAViewController.h"
#import "FileAChildLabel.h"



/**
 这个文件是用来测试，如果父类有一个属性，子类写了重名的属性并且内部实现了_属性+synthesis,那么在调用self.的时候访问的是子类的
 */
@interface FileAChildViewController : FileAViewController

@property (nonatomic,strong) FileAChildLabel * label;


@end
