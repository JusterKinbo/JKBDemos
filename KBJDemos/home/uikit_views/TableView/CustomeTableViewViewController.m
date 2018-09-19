//
//  CustomeTableViewViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/9/19.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "CustomeTableViewViewController.h"

@interface CustomeTableViewViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CustomeTableViewViewController

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        [self initData];
    }
    return self;
}
- (void) initData
{
    _sectionDatas = [@[] mutableCopy];
    _hisData = [@[@"这是1",@"这是2",@"这是3",] mutableCopy];
    _sugData = [@[@"推荐1",@"推荐2",@"推荐3",] mutableCopy];
    _sectionTitles = [@[@"搜索历史",@"时事热点"] mutableCopy];
    [_sectionDatas addObject:_hisData];
    [_sectionDatas addObject:_sugData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWith, ScreenHeight-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
//    UIView * rightItemContainer = [[UIView alloc]init];//添加一个容器view可以解决往右移，但此时的热点区域需要重新考虑
//    rightItemContainer.frame = CGRectMake(0, 0, 120, 39);
//    rightItemContainer.backgroundColor = [UIColor greenColor];
    UIToolbar * tools=[[UIToolbar alloc]initWithFrame:CGRectMake(10, 0, 80, 39)];
    tools.backgroundColor = [UIColor blackColor];
    UIBarButtonItem * clearHis = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"delete"] style:UIBarButtonItemStylePlain target:self action:@selector(clearHis)];
    UIBarButtonItem * editEnable = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStyleDone target:self action:@selector(addSug)];
    UIBarButtonItem * addSugData = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStylePlain target:self action:@selector(settingTable)];
     UIBarButtonItem * replaceOneHisData = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"item_replace"] style:UIBarButtonItemStylePlain target:self action:@selector(replaceOneHis)];
    [tools setItems:@[clearHis,editEnable,addSugData,replaceOneHisData]];
//    [rightItemContainer addSubview:tools];
    UIBarButtonItem * rightItems = [[UIBarButtonItem alloc]initWithCustomView:tools];
//    UIBarButtonItem * rightItems = [[UIBarButtonItem alloc]initWithCustomView:rightItemContainer];
    self.navigationItem.rightBarButtonItem = rightItems;
//    self.navigationItem.rightBarButtonItems = @[clearHis,editEnable,addSugData];
//    self.navigationItem.rightBarButtonItems = @[rightItems];
    
}

#pragma --mark delegata
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma --mark datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sectionDatas count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sectionDatas[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTabelViewCell";
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
        
    }
    NSString* labelText= _sectionDatas[indexPath.section][indexPath.row];
    [cell.textLabel setText:labelText];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return nil;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    return nil;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 20;
//}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sectionTitles[section];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 || indexPath.section == 1) return YES;
    return NO;
}

/**
只可实现部分可删除，不能部分可添加，多个对一个cell需要自定义
 */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) return UITableViewCellEditingStyleDelete;
    if(indexPath.section == 1) return UITableViewCellEditingStyleInsert;//编辑状态才生效
    return UITableViewCellEditingStyleNone;
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_sectionDatas[indexPath.section] removeObject:_hisData[indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }else if(editingStyle == UITableViewCellEditingStyleInsert)
    {
        NSIndexPath * ind = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        [_sectionDatas[indexPath.section] insertObject:[NSString stringWithFormat:@"添加%ld",indexPath.row+1] atIndex:indexPath.row+1];
        [_tableView insertRowsAtIndexPaths:@[ind] withRowAnimation:UITableViewRowAnimationBottom];
    }
    
}

#pragma --mark target action
- (void)clearHis
{
    NSInteger index =  [_sectionDatas indexOfObject:_hisData];
    if(index == NSNotFound)return;
    [_sectionDatas removeObject:_hisData];
//    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSIndexSet * indexSet = [[NSIndexSet alloc]initWithIndex:index];
    [_tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationTop];
//    self.navigationItem.rightBarButtonItem.enabled = NO;//因为存在多个按钮，此时
//    [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}
- (void)addSug
{
    [_sugData addObject:@"新加的sug"];NSIndexPath * indexPath1 = [NSIndexPath indexPathForRow:(_sugData.count-1) inSection:[_sectionDatas indexOfObject:_sugData]];
    [_sugData addObject:@"新加的sug"];NSIndexPath * indexPath2 = [NSIndexPath indexPathForRow:(_sugData.count-1) inSection:[_sectionDatas indexOfObject:_sugData]];
    [_sugData addObject:@"新加的sug"];NSIndexPath * indexPath3 = [NSIndexPath indexPathForRow:(_sugData.count-1) inSection:[_sectionDatas indexOfObject:_sugData]];
    [_sugData addObject:@"新加的sug"];NSIndexPath * indexPath4 = [NSIndexPath indexPathForRow:(_sugData.count-1) inSection:[_sectionDatas indexOfObject:_sugData]];
    [_tableView insertRowsAtIndexPaths:@[indexPath1,indexPath2,indexPath3,indexPath4,] withRowAnimation:UITableViewRowAnimationTop];
    
}
- (void)settingTable
{
    _tableView.editing = !_tableView.editing;
}

/**
 替换第一个
 */
- (void)replaceOneHis
{
    NSInteger index =  [_sectionDatas indexOfObject:_hisData];
    if(index == NSNotFound)return;
    if(! (_hisData.count >0))return;
    NSString * str = [NSString stringWithFormat:@"%@- ",_hisData[0]];
    [_hisData removeObjectAtIndex:0];
    [_hisData insertObject:str atIndex:0];
    NSIndexPath * ind = [NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView reloadRowsAtIndexPaths:@[ind] withRowAnimation:UITableViewRowAnimationNone];
}

@end
