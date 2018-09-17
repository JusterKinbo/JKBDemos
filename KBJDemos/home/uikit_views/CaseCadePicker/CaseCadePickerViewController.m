//
//  CaseCadePickerViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/9/17.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "CaseCadePickerViewController.h"
#import "UIView+Draggable.h"

#define kCode @"code"
#define kTitle @"title"
#define kChild @"childs"

#define kPickerHeight 100

typedef NS_ENUM(NSUInteger, PickerState) {
    CANCEL_PRESEED,
    OK_PRESEED,
};

@interface CaseCadePickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView * _pickerView;
    UIButton * _cancel;
    UIButton * _ok;
    UIView * _lineView;
    NSMutableArray * _selectedData;//只要title直接循环一遍selectedRowInComponent即可,但是我们要全部信息
    UIImageView * _draggableImage;
}
@end

@implementation CaseCadePickerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _cancel = [UIButton buttonWithType:UIButtonTypeSystem];
    [_cancel setTitle:@"取消" forState:UIControlStateNormal];
    _cancel.frame = CGRectMake(0, ScreenHeight-64-kPickerHeight-20, 50, 30);
    _cancel.tag = CANCEL_PRESEED;
    [_cancel addTarget:self action:@selector(closePickerView:) forControlEvents:UIControlEventTouchUpInside];
    _ok = [UIButton buttonWithType:UIButtonTypeSystem];
    [_ok setTitle:@"确认" forState:UIControlStateNormal];
    _ok.frame = CGRectMake(ScreenWith-50, ScreenHeight-64-kPickerHeight-20, 50, 30);
    _ok.tag = OK_PRESEED;
    _cancel.hidden = YES;_ok.hidden = YES;
    [_ok addTarget:self action:@selector(closePickerView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cancel];[self.view addSubview:_ok];
    
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-64-kPickerHeight+5, ScreenWith, 1)];
    _lineView.hidden = YES;
    _lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_lineView];
    
    _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, ScreenHeight-64-kPickerHeight, ScreenWith, kPickerHeight)];
    _picker_datas = [[NSMutableArray alloc]init];
    _selectedData = [[NSMutableArray alloc]init];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    [self.view addSubview:_pickerView];
    
     _datas = @[//kcode用于唯一标识，数字几开头标识第几列
                        @{  kCode:@1,kTitle:@"北京",kChild:@[
                                    @{kCode:@11,kTitle:@"西城"},
                                    @{kCode:@12,kTitle:@"东城",kChild:@[
                                              @{kCode:@123,kTitle:@"大鸭梨"},
                                              @{kCode:@124,kTitle:@"羊蝎子"},
                                             ]}
                                   ]},
                        @{kCode:@2,kTitle:@"天津",kChild:@[
                                  @{kCode:@21,kTitle:@"相声"},
                                  @{kCode:@22,kTitle:@"麻花"},
                                  ]},
                        @{kCode:@3,kTitle:@"上海"},
                        @{kCode:@4,kTitle:@"广州"},
                        @{kCode:@5,kTitle:@"深圳"}
                        ];
    [self initPickerData:_picker_datas withData:_datas];
// *********支持外部设置初始值
//    NSArray * selected = @[
//                                 @{
//                                     kTitle : @"北京",
//                                 },
//                                 @{
//                                     kTitle : @"东城",
//                                 },
//                                 @{
//                                     kTitle : @"大鸭梨",
//                                 }
//                                 ];
//    [self initPickerData:_picker_datas withData:_datas selectedData:selected];
    _pickerView.hidden = YES;
    _draggableImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pengyuyan02"]];
    _draggableImage.frame = CGRectMake(0, 100, 50, 50);
    
    [self.view addSubview:_draggableImage];
    _draggableImage.draggingType = DraggingTypePullOver;
    UITapGestureRecognizer *showPicker= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showPicer)];
    [_draggableImage addGestureRecognizer:showPicker];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma --mark 关闭左滑手势
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

#pragma --mark 生成默认的picker data
- (void)initPickerData:(NSMutableArray *)pickerData withData:(NSArray *)datas
{
    NSArray * curArry = datas;
    NSInteger componetStart = 0;
    do
    {
        [_selectedData addObject:curArry[0]];
        NSMutableArray * rows = [[NSMutableArray alloc]init];
        for (int i=0;i<curArry.count;i++) {
            NSDictionary * tmp = curArry[i];
            [rows addObject:tmp[kTitle]];
        }
        [_picker_datas addObject:rows];
        curArry = curArry[0][kChild];
        componetStart += 1;
    }while(curArry);
}
- (void)initPickerData:(NSMutableArray *)pickerData withData:(NSArray *)datas selectedData:(NSArray *)seletedData
{
    NSArray * curArry = datas;
    NSInteger componetStart = 0;
    do
    {
        NSInteger componet = 0;
        NSMutableArray * rows = [[NSMutableArray alloc]init];
        for (int i=0;i<curArry.count;i++) {
            NSDictionary * tmp = curArry[i];
            [rows addObject:tmp[kTitle]];
            if([tmp[kTitle] isEqualToString:seletedData[componetStart][kTitle] ])
                {
                    componet = i;
                    [_selectedData addObject:tmp];
                }
        }
        
        [_picker_datas addObject:rows];
        curArry = curArry[componet][kChild];
        componetStart += 1;
    }while(curArry);
}
#pragma --mark 根据索引生成picker data
- (void)updatePickerData:(NSMutableArray *)pickerData withData:(NSArray *)datas component:(NSInteger)component row:(NSInteger)row
{
    NSDictionary * curModel = nil;
    NSArray * curArry = datas;
    for(int i = 0;i<component;i++)
    {
        NSInteger selectedRow = [_pickerView selectedRowInComponent:i];//这个Api可以根据列数得到列数选择的行数
        curModel = curArry[selectedRow];
        curArry = curModel[kChild];
    }
    //i == component就update
    curModel = curArry[row];
    curArry = curModel[kChild];
    NSInteger componetStart = component+1;
    [_picker_datas removeObjectsInRange:NSMakeRange(componetStart, [_picker_datas count]>componetStart?[_picker_datas count]-componetStart:0)];
    [_selectedData removeObjectsInRange:NSMakeRange(component, [_selectedData count]>component?[_selectedData count]-component:0)];
   if(curModel){[_selectedData addObject:curModel];}//这个可能没有子view
    while(curArry)
    {
         [_selectedData addObject:curArry[0]];
        NSMutableArray * rows = [[NSMutableArray alloc]init];
        for (int i=0;i<curArry.count;i++) {
            NSDictionary * tmp = curArry[i];
             [rows addObject:tmp[kTitle]];
        }
         [_picker_datas addObject:rows];
        curArry = curArry[0][kChild];
        componetStart += 1;
       
    }
    [_pickerView reloadAllComponents];
    NSLog(@"%@",_selectedData);
}

#pragma --makr delegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self updatePickerData:_picker_datas withData:_datas component:component row:row];
}

#pragma --mark datasource
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return [_picker_datas count];
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_picker_datas[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _picker_datas[component][row];
}

#pragma --mark 显示picker
- (void)showPicer
{
    _pickerView.hidden = NO;
    _cancel.hidden = NO;
    _ok.hidden = NO;
    _lineView.hidden = NO;
}

- (void)closePickerView:(UIButton *)btn
{
    _pickerView.hidden = YES;
    _cancel.hidden = YES;
    _ok.hidden = YES;
    _lineView.hidden = YES;
    if(btn.tag == CANCEL_PRESEED)
    {
        
    }else if(btn.tag == OK_PRESEED)
    {
        NSMutableArray * result = [[NSMutableArray alloc]initWithCapacity:_selectedData.count];
        for(NSDictionary * dict in _selectedData)
        {
            [result addObject:@{kTitle:dict[kTitle],kCode:dict[kCode]}];
        }
        _selectedRows = [result copy];
    }
    NSLog(@"%@",_selectedRows);
}
#pragma --mark drag 代理
//目前不需要

@end
