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
                                            LABEL_CLASS:@[
                                                    @{LABEL_FONT_SIZE:@"20.5",LABEL_FONT_COLOR:@"#FF0000",LABEL_SINGLE_LINE_TEXT:@"我只有一行",FRAME:@"{{10,220},{200,30}}"},
                                                    @{FRAME:@"{{10,260},{350,160}}",BGCOLOR:@"#0000ff",LABEL_VERTICAL_ALIGNMENT:LABEL_VERTICAL_ALIGNMENT_TOP,LABEL_FONT_SIZE:@"23",LABEL_FONT_COLOR:@"#00FF00",LABEL_MULTI_LINE_TEXT_CONFIG_DICT:
                                                          @{LABEL_MULTI_LINE_TEXT:@"我有很多行：(垂直+水平居中)最近在项目中频繁遇到显示多少行文字的需求，有的需求是在什么情况下都只显示1行文字，有的需求是要求显示多少行文字由服务器端控制，有的需求是展示全部文字，有的需求是要最多展示5行文字，不过他们有一个共同的特点就是未显示全的文字用 … 来代替",LABEL_MAX_LINENUMBER:@"2"
                                                            }
                                                      },
                                                    @{LABEL_FONT_SIZE:@"20.5",LABEL_FONT_COLOR:@"#FF0000",LABEL_SINGLE_LINE_TEXT:@"这是一个富文本的demo",FRAME:@"{{10,420},{350,30}}",LABEL_ATTRIBUTE_FONT_CONFIG_DICT:
                                                          @{
                                                              LABEL_ATTRIBUTE_FONT_CONFIG_DICT_SUBTEXT:@[//必须是数组，只有一个元素也要是数组
                                                                    @{
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_COLOR:@"#0000FF",
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_FONT_SIZE:@"20",
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_UNDERLINE_STYLE:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_SINGLE,
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_UNDERLINE_COLOR:@"#0000FF",
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_TEXT_RANGE:@"0 2",
                                                                        },
                                                                    @{
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_COLOR:@"#00FF00",
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_FONT_SIZE:@"15",
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STRKETHROUGH_COLOR:@"#0F0F0F",
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STRKETHROUGH_STYLE:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_DOUBLE,
                                                                        LABEL_ATTRIBUTE_FONT_CONFIG_DICT_TEXT_RANGE:@"2 3",
                                                                        }],
                                                              LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT:@[//必须是数组，只有一个元素也要是数组
                                                                      @{
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT_IMAGE_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg",
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT_IMAGE_BOUNDS:@"{{0,-2},{20,20}}",//y是反着的
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT_INDEX:@"3"
                                                                          },
                                                                      ]
                                                                        
                                                              }},
                                                    @{LABEL_FONT_SIZE:@"20.5",LABEL_FONT_COLOR:@"#FF0000",LABEL_MULTI_LINE_TEXT_CONFIG_DICT:@{LABEL_MULTI_LINE_TEXT:@"这是一个多行的富文本:最近在项目中频繁遇到显示多少行文字的需求，有的需求是在什么情况下都只显示1行文字，有的需求是要求显示多少行文字由服务器端控制，有的需求是展示全部文字，有的需求是要最多展示5行文字，不过他们有一个共同的特点就是未显示全的文字用 … 来代替",LABEL_MAX_LINENUMBER:@"3"},FRAME:@"{{10,470},{350,100}}",LABEL_ATTRIBUTE_FONT_CONFIG_DICT:
                                                          @{
                                                              LABEL_ATTRIBUTE_FONT_CONFIG_DICT_SUBTEXT:
                                                                  @[//必须是数组，只有一个元素也要是数组
                                                                      @{
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_COLOR:@"#0000FF",
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_FONT_SIZE:@"20",
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_UNDERLINE_STYLE:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_SINGLE,
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_UNDERLINE_COLOR:@"#0000FF",
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_TEXT_RANGE:@"0 2",
                                                                          },
                                                                      @{
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_COLOR:@"#00FF00",
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_FONT_SIZE:@"15",
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STRKETHROUGH_COLOR:@"#0F0F0F",
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STRKETHROUGH_STYLE:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_DOUBLE,
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_TEXT_RANGE:@"2 3",
                                                                          },
                                                              ]},
                                                      }
                                                    ],
                                            BUTTON_CLASS:@[
                                                    @{FRAME:@"{{10,80},{100,30}}",BUTTON_TITLE:@"btn1",BUTTON_TITLE_COLOR:@"#00FF00"},
                                                    @{FRAME:@"{{120,80},{100,30}}",BUTTON_TITLE:@"btn2",BUTTON_TITLE_COLOR:@"#00FF00",
                                                      CHILDREN:@{
                                                              UIIMAGEVIEW_CLASS:@{ FRAME:@"{{40,5},{20,20}}",UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"},
                                                              }
                                                      }],
                                            UIIMAGEVIEW_CLASS:@[
                                                    @{FRAME:@"{{10,120},{100,100}}",UIIMAGEVIEW_URL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536064671189&di=8e054983ed0ceb32d73acdb83bc25502&imgtype=0&src=http%3A%2F%2Fimg2.cache.netease.com%2Fent%2F2015%2F3%2F24%2F2015032417212918e47.jpg",
                                                      CHILDREN:@{
                                                              BUTTON_CLASS:@{ FRAME:@"{{0,30},{100,40}}",BUTTON_TITLE:@"btn3",BUTTON_TITLE_COLOR:@"#00FF00"},

                                                              }
                                                              },
                                                    @{FRAME:@"{{120,120},{50,50}}",UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg",
                                                      RECT_CONER_CONFIG:@{
                                                              RECT_CONER_CONFIG_COLOR:@"#ff0000",RECT_CONER_CONFIG_RADIUS:@"5",RECT_CONER_CONFIG_LINEWIDTH:@"2"
                                                              }
                                                      }
                                                    ],
                                            UIVIEW_CLASS:@{
                                                    FRAME:@"{{10,230},{50,50}}",BGCOLOR:@"#ff0000",RECT_CONER:@"8.5"
                                                    }
                                            };
    NSTimeInterval timeIntervalStart = [NSDate date].timeIntervalSince1970;
//    for(int i = 0;i<10000;i++)
//    {
//        [[RuntimeCongfiguView alloc]initWithCongfiguredDictionary:congfigureDictionary];
//    }
    NSTimeInterval timeIntervalEnd = [NSDate date].timeIntervalSince1970;
    NSTimeInterval timeInterval = timeIntervalEnd - timeIntervalStart;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormater=[[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//需转换的格式
//    NSString *dateStr = [dateFormater stringFromDate:date];
//    NSLog(@"time elpased %@",dateStr);
    //code 写 view
    timeIntervalStart = [NSDate date].timeIntervalSince1970;
//    for(int i = 0;i<10000;i++)
//    {
//        UIButton * btn1 = [[UIButton alloc]init];
//        btn1.frame = CGRectMake(0, 0, 100, 100);
//        [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
//        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        UIButton * btn2 = [[UIButton alloc]init];
//        btn2.frame = CGRectMake(0, 0, 100, 100);
//        [btn2 setTitle:@"btn1" forState:UIControlStateNormal];
//        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//
//        UIImageView * img1 = [[UIImageView alloc]init];
//        img1.frame = CGRectMake(0, 0, 100, 100);
//        img1.image = [UIImage imageNamed:@"games"];
//        UIImageView * img2 = [[UIImageView alloc]init];
//        img2.frame = CGRectMake(0, 0, 100, 100);
//        img2.image = [UIImage imageNamed:@"games"];
//    }
    timeIntervalEnd = [NSDate date].timeIntervalSince1970;
     NSTimeInterval timeInterval2 = timeIntervalEnd - timeIntervalStart;
    NSLog(@"time diff is %f",timeInterval -timeInterval2);
    RuntimeCongfiguView * cfView = [[RuntimeCongfiguView alloc]initWithCongfiguredDictionary:congfigureDictionary];
    
    //UIButton 添加子view会在image下面
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn setTitle:@"btn4" forState:UIControlStateNormal];
//    [btn setFrame:CGRectMake(100, 400, 50, 50)];
//    UIImageView * img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"games"]];
//    [btn addSubview:img];
//    [img setFrame:CGRectMake(0, 0, 50, 50)];
//    [self.view addSubview:btn];
    
    
//    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(100, 400, 300, 150)];
//    [label setText: @"最近在项目中频繁遇到显示多少行文字的需求，有的需求是在什么情况下都只显示1行文字，有的需求是要求显示多少行文字由服务器端控制，有的需求是展示全部文字，有的需求是要最多展示5行文字，不过他们有一个共同的特点就是未显示全的文字用 … 来代替"];
//    [label setFont:[UIFont systemFontOfSize:20]];
//    [label setTextColor:[UIColor redColor]];
//    [label setTextAlignment:NSTextAlignmentCenter];
//    label.lineBreakMode = NSLineBreakByTruncatingTail;
//    label.numberOfLines = 0;
//
//
//    [self.view addSubview:label];


    [self.view addSubview:cfView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
