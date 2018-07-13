//
//  RichTextViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/7/13.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "RichTextViewController.h"
#import "HighLinkRichText.h"

@interface RichTextViewController ()<HighLinkRichTextDelegate>

@end

@implementation RichTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"rich text";
    self.view.backgroundColor = [UIColor whiteColor];
    
    HighLinkRichText * highLinkRichText = [[HighLinkRichText alloc]initWithFrame:CGRectMake(10, 100, 200, 200) text:@"欢迎使用XX产品, 在使用过程中有疑问请< a href=\"xxapp://feedback\">反馈</ a>"];
    highLinkRichText.delegate = self;
    [self.view addSubview:highLinkRichText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//考虑到可能会根据url跳转到不同的VC
- (void)clickOnText:(NSString *)text href:(NSString *)href
{
    NSString *regexStr = @"xxapp://(.*?)\"";
    NSError * err = nil;
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:&err];
    if(err){ return ;}
    NSTextCheckingResult * ckr=[regex firstMatchInString:href options:NSMatchingReportProgress range:NSMakeRange(0, href.length)];
    NSRange range = [ckr rangeAtIndex:1];
    NSString * cls = [href substringWithRange:range];
    cls = [NSString stringWithFormat:@"XX%@ViewController",[cls capitalizedString]];
    if([text isEqualToString:@"反馈"])
    {
        NSLog(@"%@",cls);
    }
}

@end
