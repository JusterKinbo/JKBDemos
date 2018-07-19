//
//  BBAApp2DownloadTableViewCell.h
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBADirectBaseTableViewCell.h"

@class BBAApp2DownlaodModel;
/**
 app直达--支持私有api检测+代码混淆
 app内部如果想要掉起其他应用，需要将被掉起的应用加入info.plist中，key为LSApplicationQueriesSchemes
 如果未加入，在使用canOpenURL时返回false
 如果未安装，那么直接调到appStore--需要制定appID，直接跳过去
 
 在iOS 10以后如果想直接打开，需要使用openURL option（目前只有一个key，需要指定为NO）
 
 
 正则表达式
 1.利用NSPredicate（谓词）匹配
 例如匹配有效邮箱：

 NSString ＊email ＝ @“nijino_saki@163.com”；
 NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
 BOOL isValid = [predicate evaluateWithObject:email];
 谓词匹配比较灵活，但是需要有谓词的相关知识。
 
 2.利用rangeOfString：option：直接查找
 
 NSString *searchText = @"// Do any additional setup after loading the view, typically from a nib.";
 
 NSRange range = [searchText rangeOfString:@"(?:[^,])*\\." options:NSRegularExpressionSearch];
 
 if (range.location != NSNotFound) {
 NSLog(@"%@", [searchText substringWithRange:range]);
 }
 options中设定NSRegularExpressionSearch就是表示利用正则表达式匹配，会返回第一个匹配结果的位置。
 
 3.使用正则表达式类
 
 NSString *searchText = @"// Do any additional setup after loading the view, typically from a nib.";
 NSError *error = NULL;
 NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(?:[^,])*\\." options:NSRegularExpressionCaseInsensitive error:&error];
 NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
 if (result) {
 NSLog(@"%@\n", [searchText substringWithRange:result.range]);
 }
 使用系统的正则表达式类（NSRegularExpression）会返回匹配的多个结果。
 */
@interface BBAApp2DownloadTableViewCell : BBADirectBaseTableViewCell


@end


