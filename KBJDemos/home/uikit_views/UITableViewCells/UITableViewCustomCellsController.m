//
//  UITableViewCustomCellsController.m
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "UITableViewCustomCellsController.h"
#import "UITableViewBaseCell.h"

//cell model
#import "UITableViewModelBaseCell.h"
#import "BBAApp2DownlaodModel.h"
#import "BBAAppletCellModel.h"
#import "BBANormalCellModelWithoutMasonry.h"

//touch
#import "UITableViewWithTouchesEvent.h"
#import "UITableViewCustomeCellTouchTableViewDelegate.h"

#import "PureButtonTableViewCell.h"

@interface UITableViewCustomCellsController ()
{
    NSMutableArray * _datas;
    UITableViewWithTouchesEvent * _tableView;
    UILabel * _switchLabel;
}

@end

@implementation UITableViewCustomCellsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableViewWithTouchesEvent alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.touchDelegate = [[UITableViewCustomeCellTouchTableViewDelegate alloc]init];
//    _tableView.dragDelegate = [[UITableViewScrollEventDelegate alloc]init];
    _tableView.tableFooterView = [[UIView alloc]init];//去掉底部多余空白行
    _tableView.estimatedRowHeight = 200;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);//两侧留白
    
    [self.view addSubview:_tableView];
    
    BBAApp2DownlaodModel * wxModel = [[BBAApp2DownlaodModel alloc]init];
    wxModel.iconURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531131863874&di=64d8ff45f381804769b3c7441ca97210&imgtype=0&src=http%3A%2F%2Fpic.baike.soso.com%2Fp%2F20140426%2F20140426020148-135213313.jpg";
    wxModel.name = @"微信";
    wxModel.app = @"应用";
    wxModel.volume = @"90.4M";
    wxModel.version = @"最新V.11";
    wxModel.download = @"下载";
    wxModel.cellClassName = @"BBAApp2DownloadTableViewCell";
    wxModel.appScheme = @"weixin";
    wxModel.appId = @"614694882";
    
    BBAApp2DownlaodModel * wzryModel = [[BBAApp2DownlaodModel alloc]init];
    wzryModel.iconURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531116593335&di=c4eb4cc7d549dd8fccca3a096d40c990&imgtype=0&src=http%3A%2F%2Ft12.baidu.com%2Fit%2Fu%3D1653369644%2C3359567250%26fm%3D173%26s%3DD29690AE42C244FC0F2F55F803005018%26w%3D640%26h%3D634%26img.JPEG";
    wzryModel.name = @"王者荣耀";
    wzryModel.app = @"应用";
    wzryModel.volume = @"290.4M";
    wzryModel.version = @"最新V.18";
    wzryModel.download = @"下载";
    wzryModel.cellClassName = @"BBAApp2DownloadTableViewCell";
    wzryModel.appScheme = @"wzry_wx";
    wzryModel.appId = @"989673964";
    
    
    BBAAppletCellModel * appletModel = [[BBAAppletCellModel alloc]init];
    appletModel.iconURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531116656896&di=37d2ce47c894a6b1ecf433fd5866d7f1&imgtype=0&src=http%3A%2F%2Fs3.zaiseoul.com%2Fupload%2F2015%2F08%2F20%2F520352.png";
    appletModel.name = @"百宝箱";
    appletModel.applet = @"智能小程序";
    appletModel.personNumber = @"2.3万人";
    appletModel.detail = @"千万宝物等你来拿1213323244455";
    appletModel.cellClassName = @"BBAAppletTableViewCell";
    
    BBANormalCellModelWithoutMasonry * normalCell = [[BBANormalCellModelWithoutMasonry alloc]init];
    normalCell.cellClassName = @"BBANormalCellWithoutMasonry";
    
    BBAAppletCellModel * appletModel_relativePos = [[BBAAppletCellModel alloc]init];
    appletModel_relativePos.iconURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531116656896&di=37d2ce47c894a6b1ecf433fd5866d7f1&imgtype=0&src=http%3A%2F%2Fs3.zaiseoul.com%2Fupload%2F2015%2F08%2F20%2F520352.png";
    appletModel_relativePos.name = @"百宝箱";
    appletModel_relativePos.applet = @"智能小程序";
    appletModel_relativePos.personNumber = @"2.3万人";
    appletModel_relativePos.detail = @"千万宝物等你来拿1213323244455";
    appletModel_relativePos.cellClassName = @"BBADirectAppletTableViewCell_RelativePos";
    
    UITableViewModelBaseCell * pureBtn = [[UITableViewModelBaseCell alloc]init];
    pureBtn.cellClassName = @"PureButtonTableViewCell";
    
    _datas = [@[wxModel,wzryModel,appletModel,normalCell,appletModel_relativePos,pureBtn] mutableCopy];
    
    [self switchToTop];
    
    /**---备选方案
     手百上需要获取数据的时候缓存cell height，根据height计算是否需要添加footer view
     footer view 高度需要重新调整(不足一屏幕无法滚动)
     
     */
//    dispatch_async(dispatch_get_main_queue(), ^{
//        CGFloat contentHeight = _tableView.contentSize.height;
//        CGFloat tableHeight = _tableView.frame.size.height;
//        CGFloat tableWidth = _tableView.frame.size.width;
//        if(contentHeight>tableHeight)
//        {
//            return;
//        }else
//        {
//           CGRect frame = CGRectMake(0, contentHeight, tableWidth, tableHeight-contentHeight+15+15+36);
//            _tableView.tableFooterView = [[UIView alloc]initWithFrame:frame];
//        }
//
//       NSLog(@"%@",NSStringFromCGSize(_tableView.contentSize));
//    });
    
}

- (void)switchToTop
{
    UISwitch * swith = [[UISwitch alloc]init];
    swith.on = YES;
    UILabel * label = [[UILabel alloc]init];
    [label setText:@"开"];
    [self.view insertSubview:swith aboveSubview:_tableView];
    [self.view insertSubview:label aboveSubview:_tableView];

    NSArray * arr = @[swith,label];

    int leadingSpacing = (self.view.frame.size.width-label.intrinsicContentSize.width-swith.intrinsicContentSize.width-20)/2;
    //水平方向的约束
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:leadingSpacing tailSpacing:leadingSpacing];
    //垂直方向的约束
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.frame.size.height - 30-54);
        make.height.mas_equalTo(30);
    }];

    [self.view layoutIfNeeded];

    [swith addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    _switchLabel = label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}


/**
 根据model classname 生成cell
 通过多态+迪米特原则实现
     base cell model 标识具体哪个cell--identifier(cell class name)
                     指针指向具体的cell model(array中元素)
     多态生成cell即可
 @return cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewModelBaseCell * dataModal = _datas[indexPath.row];//父cell
    UITableViewBaseCell * cell;
    cell = [tableView dequeueReusableCellWithIdentifier:dataModal.cellClassName];
    if(!cell)
        {
            Class cls = NSClassFromString(dataModal.cellClassName);
            cell = [[[cls alloc]init]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dataModal.cellClassName];//多态
        }
    //下面两个顺序必须先设置model再update ui
    [cell setModelItem:dataModal];
    [cell updateUI];
    return cell;
}

/**
 点击cell--用cell来处理响应，这里不用model处理的原因在于cell结合model展示后，它的展示内容可能会改变，因此采用直接cell响应对应事件即可
 cell就不用再走mvc模式了，毕竟没有那么丰富，抽离m 和 v(v+c) 即可
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     _cellPressTime = [NSDate date].timeIntervalSince1970 * 1000 - _cellPressTime;
    NSLog(@"time*** time end %f",_cellPressTime);
    UITableViewBaseCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell doSelection];
}
//使用autolayout自适应之后，不能够进行再通过frame约束布局了~，frame自定义布局的宽高收到heightForRow的影响，如果重写AL就失效了~~
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewModelBaseCell * dataModal = _datas[indexPath.row];
//    if([dataModal.cellClassName isEqualToString:@"PureButtonTableViewCell"])
//    {
//        PureButtonTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
//        return cell.cellHeight;
//    }
//    return 100;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)switchChanged:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    BBAApp2DownlaodModel * wxModel = [[BBAApp2DownlaodModel alloc]init];
    wxModel.iconURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531131863874&di=64d8ff45f381804769b3c7441ca97210&imgtype=0&src=http%3A%2F%2Fpic.baike.soso.com%2Fp%2F20140426%2F20140426020148-135213313.jpg";
    wxModel.name = @"微信";
    wxModel.app = @"应用";
    wxModel.volume = @"90.4M";
    wxModel.version = @"最新V.11";
    wxModel.download = @"下载";
    wxModel.cellClassName = @"BBAApp2DownloadTableViewCell";
    wxModel.appScheme = @"weixin";
    wxModel.appId = @"614694882";
    if (isButtonOn) {
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [_tableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        [_switchLabel setText:@"开"];
        [_datas addObject:wxModel];
        [_tableView insertRowsAtIndexPaths:@[scrollIndexPath] withRowAnimation:UITableViewRowAnimationTop];
    }else {
        [_switchLabel setText:@"关"];
//        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
//        [_tableView setContentOffset:CGPointMake(0, 200) animated:YES];
//        [_tableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}

#pragma --mark scroll 事件 --> 由于touches不能捕获所有的滑动事件，采用scroll获取时间
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
     NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cellPressTime = [NSDate date].timeIntervalSince1970 * 1000;
    NSLog(@"time*** time start %f",_cellPressTime);
    return indexPath;
}




@end
