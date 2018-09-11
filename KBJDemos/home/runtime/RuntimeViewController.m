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
{
    UIView * v1;
    UIView * v2;
    UIView * v3;
}

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"runtime + json 解析view";
    NSArray *segmentArr = @[@"同类ui放一起",@"ui一个个顺序写",@"水平垂直+frame"];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:segmentArr];
    //设置frame
    segment.frame = CGRectMake(10, 620, self.view.frame.size.width-20, 30);
    //添加到视图
    [self.view addSubview:segment];
    [segment addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    v1 = [[UIView alloc]initWithFrame:self.view.bounds];
    v2 = [[UIView alloc]initWithFrame:self.view.bounds];
    v3 = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.view insertSubview:v1 belowSubview:segment];
    [self.view insertSubview:v2 belowSubview:segment];
    [self.view insertSubview:v3 belowSubview:segment];
    //因为第三个方案最好，支持水平、垂直布局，同时支持frame，默认选中第三个
    segment.selectedSegmentIndex = 2;
    v1.hidden = YES; v2.hidden = YES; v3.hidden = NO;
    //直接用view写（同类型放入一个数组，不建议，不好定位ui）
    NSDictionary * congfigureDictionary = @{
                                            LABEL_CLASS:@[
                                                    @{LABEL_FONT_SIZE:@"20.5",LABEL_FONT_COLOR:@"#FF0000",LABEL_SINGLE_LINE_TEXT:@"我只有一行",FRAME:@"{{10,220},{200,30}}"},
                                                    @{FRAME:@"{{10,260},{350,160}}",BGCOLOR:@"#0000ff",LABEL_VERTICAL_ALIGNMENT:LABEL_VERTICAL_ALIGNMENT_TOP,LABEL_FONT_SIZE:@"23",LABEL_FONT_COLOR:@"#00FF00",LABEL_MULTI_LINE_TEXT_CONFIG_DICT:
                                                          @{LABEL_MULTI_LINE_TEXT:@"我有很多行：(垂直top+水平居中)最近在项目中频繁遇到显示多少行文字的需求，有的需求是在什么情况下都只显示1行文字，有的需求是要求显示多少行文字由服务器端控制，有的需求是展示全部文字，有的需求是要最多展示5行文字，不过他们有一个共同的特点就是未显示全的文字用 … 来代替",LABEL_MAX_LINENUMBER:@"2"
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
                                                                          LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT_IMAGE_URL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536244922727&di=a780f9e258eb9c77cadafb5035d3b3aa&imgtype=0&src=http%3A%2F%2Ftx.haiqq.com%2Fuploads%2Fallimg%2F170505%2F050Q920O-8.jpg",
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
    NSTimeInterval timeIntervalEnd = [NSDate date].timeIntervalSince1970;
    NSTimeInterval timeInterval = timeIntervalEnd - timeIntervalStart;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormater=[[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//需转换的格式

    timeIntervalStart = [NSDate date].timeIntervalSince1970;
    timeIntervalEnd = [NSDate date].timeIntervalSince1970;
     NSTimeInterval timeInterval2 = timeIntervalEnd - timeIntervalStart;
    NSLog(@"time diff is %f",timeInterval -timeInterval2);
    NSData *data_congfigureDictionary=[NSJSONSerialization dataWithJSONObject:congfigureDictionary options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr_congfigureDictionary=[[NSString alloc]initWithData:data_congfigureDictionary encoding:NSUTF8StringEncoding];
    NSLog(@"data_congfigureDictionary json:%@",jsonStr_congfigureDictionary);
    RuntimeCongfiguView * cfView = [[RuntimeCongfiguView alloc]initWithCongfiguredDictionary:congfigureDictionary];
    [v1 addSubview:cfView];
    //改方案 -- 一个ui一个ui写，还不错
    NSArray * congfigureArray = @[
                                  @{
                                      VIEW_CLASS:LABEL_CLASS,
                                      LABEL_FONT_SIZE:@"20.5",
                                      LABEL_FONT_COLOR:@"#FF0000",
                                      LABEL_SINGLE_LINE_TEXT:@"我只有一行",
                                      FRAME:@"{{10,220},{200,30}}",
                                    },
                                  @{
                                      VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                      FRAME:@"{{10,120},{100,100}}",
                                      UIIMAGEVIEW_URL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536064671189&di=8e054983ed0ceb32d73acdb83bc25502&imgtype=0&src=http%3A%2F%2Fimg2.cache.netease.com%2Fent%2F2015%2F3%2F24%2F2015032417212918e47.jpg",
                                      CHILDREN:@[
                                              @{
                                                  VIEW_CLASS:BUTTON_CLASS,
                                                  FRAME:@"{{0,30},{40,40}}",
                                                  BUTTON_TITLE:@"btn3",BUTTON_TITLE_COLOR:@"#00FF00"
                                                  },
                                              @{
                                                  VIEW_CLASS:BUTTON_CLASS,
                                                  FRAME:@"{{50,30},{40,40}}",
                                                  BUTTON_TITLE:@"btn4",BUTTON_TITLE_COLOR:@"#00FF00"
                                                  },
                                              ],
                                      },
                                  
                                ];
     RuntimeCongfiguView * cfView_Arr_version = [[RuntimeCongfiguView alloc]initWithCongfiguredArray:congfigureArray];
     [v2 addSubview:cfView_Arr_version];
    
    //水平、垂直布局+frame --方案完美
    NSArray * layoutArray = @[
                              @{
                                  LAYOUT_STYLE:HORIZONTAL_LAYOUT,//最外层也是一个view
                                  FRAME:@"{{0,70},{200,100}}",//没有写默认为@{{0,0},{父view宽、父view高}}
                                  BGCOLOR:@"#00FF00",
                                  LAYOUT_SUB_VIEWS:@[
                                          @{
                                              VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                              LAYOUT_MARGIN:@"{10,10}",
                                              LAYOUT_SIZE:@"{30,30}",
                                              UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"
                                              },
                                          @{
                                              VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                              FRAME:@"{{50,10},{30,30}}",
                                              UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"
                                              },
                                          @{
                                              VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                              LAYOUT_MARGIN:@"{10,10}",
                                              LAYOUT_SIZE:@"{30,30}",
                                              UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"
                                              },
                                          @{
                                              LAYOUT_STYLE:HORIZONTAL_LAYOUT,
                                              FRAME:@"{{0,50},{100,50}}",
                                              BGCOLOR:@"#FF0000",
                                              LAYOUT_SUB_VIEWS:@[
                                                      @{
                                                          VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                                          LAYOUT_MARGIN:@"{10,10}",
                                                          LAYOUT_SIZE:@"{30,30}",
                                                          UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"
                                                          },
                                                      ]
                                              },
                                            ]
                                  },
                              @{
                                  LAYOUT_STYLE:VERTICALL_LAYOUT,//最外层也是一个view
                                  FRAME:@"{{0,180},{300,420}}",//没有写默认为@{{0,0},{父view宽、父view高}}
                                  BGCOLOR:@"#0000FF",
                                  LAYOUT_SUB_VIEWS:@[
                                          @{
                                              VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                              LAYOUT_MARGIN:@"{10,10}",
                                              LAYOUT_SIZE:@"{200,200}",
                                              UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg",
                                              CHILDREN:@[
                                                      @{
                                                          LAYOUT_STYLE:VERTICALL_LAYOUT,
                                                          FRAME:@"{{10,10},{180,180}}",
                                                          BGCOLOR:@"#FF0000",
                                                          LAYOUT_SUB_VIEWS:@[
                                                                  @{
                                                                      VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                                                      LAYOUT_MARGIN:@"{60,20}",
                                                                      LAYOUT_SIZE:@"{60,60}",
                                                                      UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"
                                                                      },
                                                                  @{
                                                                      VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                                                      LAYOUT_MARGIN:@"{60,20}",
                                                                      LAYOUT_SIZE:@"{60,60}",
                                                                      UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"
                                                                      },
                                                                  ]
                                                          },
                                                      ],
                                              },
                                          @{
                                              VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                              FRAME:@"{{10,220},{90,90}}",
                                              UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"
                                              },
                                          @{
                                              VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                              LAYOUT_MARGIN:@"{10,10}",
                                              LAYOUT_SIZE:@"{90,90}",
                                              UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"
                                              },
                                          ]
                                  },
                                  @{
                                      VIEW_CLASS:UIIMAGEVIEW_CLASS,
                                      LAYOUT_MARGIN:@"{300,80}",//没写就相对于父view
                                      LAYOUT_SIZE:@"{30,30}",
                                      UIIMAGEVIEW_URL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg"
                                      },
                                  ];
    RuntimeCongfiguView * cfView_layout_version = [[RuntimeCongfiguView alloc]initWithLayoutArray:layoutArray];
    [v3 addSubview:cfView_layout_version];
    NSData *data_layoutArray=[NSJSONSerialization dataWithJSONObject:layoutArray options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr_layoutArray=[[NSString alloc]initWithData:data_layoutArray encoding:NSUTF8StringEncoding];
    NSLog(@"data_layoutArray json:%@",jsonStr_layoutArray);
}

- (void)segmentValueChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        v2.hidden = YES; v3.hidden = YES; v1.hidden = NO;
    }else if (sender.selectedSegmentIndex == 1){
        v1.hidden = YES; v3.hidden = YES; v2.hidden = NO;
    }else {
        v1.hidden = YES; v2.hidden = YES; v3.hidden = NO;
    }
}

@end
