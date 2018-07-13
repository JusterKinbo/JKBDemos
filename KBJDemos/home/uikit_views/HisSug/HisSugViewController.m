//
//  HisSugViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "HisSugViewController.h"
#import "BBASuggestDataItem.h"
#import "BBAAppCommonInfo.h"

/**
 界面相关的东西是二分之一的概率~~
 */

@interface HisSugViewController ()
{
    BBAHisSugPageView * _hissugPage;
}

@end

@implementation HisSugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"his&sug";
    self.view.backgroundColor = [UIColor whiteColor];
    _hissugPage = [[BBAHisSugPageView alloc]init];
    [self.view addSubview:_hissugPage];
    [_hissugPage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.view layoutIfNeeded];
    [self updateHissugUI];
    
    //添加一个更新界面的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateHissugUI) name:@"HisSugViewControolerUpdateUI" object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"HisSugViewControolerUpdateUI" object:nil];
    //remove 所有入口点
    //    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (NSMutableArray *)hisWithPasteborad:(NSMutableArray *)mutHis
{
    if([BBAAppCommonInfo.pasteboardString length]>1)
    {
        BBASuggestDataItem * item = [[BBASuggestDataItem alloc]initWithValue:BBAAppCommonInfo.pasteboardString];
        item.cellClassName = @"EBBASuggestPasteboradCellClassName";
        [mutHis insertObject:item atIndex:0];//剪切板必须放入第一个位置
    }
    return [mutHis mutableCopy];
}

- (void)updateHissugUI
{
    NSArray * hisData = @[@"首先",@"是一个",@"免责声明:",@" 相比其它",@"问题而言，",@"一个 Objective-C ",@"方法原始的速",@"度是你在编程时最后才需要考虑",@"的问题之一 – 区别就",@"在于这个问题够不上去同其它更",@"加需要重点考虑的问",@"题进行比较，比如",@"说代码的清晰度和可读性.",@"但速度的次要性并",@"不妨碍我们去理解它.",@" 你应该经常去了解一下性能方面的考虑将如",@"何对你正在编写的代码产生影响，一边在",@"极少数发生问题的情况下，你会知道如何下手."] ;
    NSMutableArray * mutHis = [[NSMutableArray alloc]init];
    for(NSString * v in hisData)
    {
        BBASuggestDataItem * item = [[BBASuggestDataItem alloc]initWithValue:v];
        [mutHis addObject:item];
    }
    int hasPasteboard = arc4random() % 2;
    if(hasPasteboard == 1)
    {
        mutHis = [self hisWithPasteborad:mutHis];
    }
    
    NSArray * sugData = @[@"首先",@"是一个",@"免责声明:",@" 相比其它",@"问题而言，",@"一个 Objective-C ",@"方法原始的速",@"度是你在编程时最后才需要考虑",@"的问题之一 – 区别就",@"在于这个问题够不上去同其它更",@"加需要重点考虑的问",@"题进行比较，比如",@"说代码的清晰度和可读性.",@"但速度的次要性并",@"不妨碍我们去理解它.",@" 你应该经常去了解一下性能方面的考虑将如",@"何对你正在编写的代码产生影响，一边在",@"极少数发生问题的情况下，你会知道如何下手."] ;
    NSMutableArray * mutSug = [[NSMutableArray alloc]init];
    for(NSString * v in sugData)
    {
        BBASuggestDataItem * item = [[BBASuggestDataItem alloc]initWithValue:v];
        [mutSug addObject:item];
    }
    int type  = arc4random() % 2;
    if(type == 1)
    {
        [_hissugPage realoadHisData:mutHis SugData:mutSug];
    }else
    {
        [_hissugPage showForPirvateMode];
    }
}

@end
