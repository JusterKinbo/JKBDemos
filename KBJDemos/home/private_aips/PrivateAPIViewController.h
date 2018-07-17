//
//  PrivateAPIViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/7/17.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 不建议使用私有api--只能在模拟器和越狱的机器上使用(苹果修改了沙盒访问，LSWorkspace不能再真机上访问了--参考stackoverflow--折中方案参考App2DownloadTableViewCell,只能根据标识获取获取一个，获取标识信息请参考下面)
 尽管可以通过class-dump导出私有api，但是正如vc里面的注释掉的，可能会被不定时的下掉，引发crash
 私有包括：未公开+私有
 未公开比如MobileCoreServices
 私有是是指存放在 PrivateFrameworks 框架中的 API
 
 如何获取app 的bundle信息
 私有api--得到本机已有的app bundle
 通过itunes获取：找到appstore中app的id，然后根据https://blog.csdn.net/sinat_25544827/article/details/50971280文章得到txt，查看bundleID即可
 具体操作：http://itunes.apple.com/cn/lookup?id=(YourAppID)适用在中国范围发布
        http://itunes.apple.com/cn/lookup?id=(YourAppID)适用其他
        E.g:http://itunes.apple.com/cn/lookup?id=1062207166 你会得到txt文件
 */
@interface PrivateAPIViewController : UIViewController

@end
