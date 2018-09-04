//
//  RuntimeViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/8/8.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "RuntimeViewController.h"
#import "RuntimeCongfigureViewMarcos.h"
#import "RuntimeCongfiguView.h"


@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"runtime";
    NSDictionary * congfigureDictionary = @{
                                            BUTTON_CLASS:@[
                                                    @{FRAME:@"{{10,80},{100,30}}",BUTTON_TITLE:@"btn1",BUTTON_TITLE_COLOR:@"#00FF00"},
                                                    @{FRAME:@"{{120,80},{100,30}}",BUTTON_TITLE:@"btn2",BUTTON_TITLE_COLOR:@"#00FF00"}],
                                            UIIMAGEVIEW_CLASS:@[
                                                    @{FRAME:@"{{10,200},{100,100}}",UIIMAGEVIEW_URL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536064671189&di=8e054983ed0ceb32d73acdb83bc25502&imgtype=0&src=http%3A%2F%2Fimg2.cache.netease.com%2Fent%2F2015%2F3%2F24%2F2015032417212918e47.jpg"},
                                                    @{FRAME:@"{{120,200},{50,50}}",UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"}
                                                    ],
                                            };
    NSTimeInterval timeIntervalStart = [NSDate date].timeIntervalSince1970;
    for(int i = 0;i<10000;i++)
    {
        [[RuntimeCongfiguView alloc]initWithCongfiguredDictionary:congfigureDictionary];
    }
    NSTimeInterval timeIntervalEnd = [NSDate date].timeIntervalSince1970;
    NSTimeInterval timeInterval = timeIntervalEnd - timeIntervalStart;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormater=[[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//需转换的格式
//    NSString *dateStr = [dateFormater stringFromDate:date];
//    NSLog(@"time elpased %@",dateStr);
    //code 写 view
    timeIntervalStart = [NSDate date].timeIntervalSince1970;
    for(int i = 0;i<10000;i++)
    {
        UIButton * btn1 = [[UIButton alloc]init];
        btn1.frame = CGRectMake(0, 0, 100, 100);
        [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIButton * btn2 = [[UIButton alloc]init];
        btn2.frame = CGRectMake(0, 0, 100, 100);
        [btn2 setTitle:@"btn1" forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        UIImageView * img1 = [[UIImageView alloc]init];
        img1.frame = CGRectMake(0, 0, 100, 100);
        img1.image = [UIImage imageNamed:@"games"];
        UIImageView * img2 = [[UIImageView alloc]init];
        img2.frame = CGRectMake(0, 0, 100, 100);
        img2.image = [UIImage imageNamed:@"games"];
    }
    timeIntervalEnd = [NSDate date].timeIntervalSince1970;
     NSTimeInterval timeInterval2 = timeIntervalEnd - timeIntervalStart;
    NSLog(@"time diff is %f",timeInterval -timeInterval2);
    RuntimeCongfiguView * cfView = [[RuntimeCongfiguView alloc]initWithCongfiguredDictionary:congfigureDictionary];
    [self.view addSubview:cfView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
