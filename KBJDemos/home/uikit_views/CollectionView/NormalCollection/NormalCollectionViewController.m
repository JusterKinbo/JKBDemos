//
//  NormalCollectionViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "NormalCollectionViewController.h"

#import "NormalCollectionHeaderView.h"
#import "NormalCollectionHeaderModel.h"
#import "NormalCollectionFooterView.h"
#import "NormalCollectionFooterModel.h"
#import "NoramlTitleCollectionViewCell.h"
#import "NormalColltionViewCellModel.h"

#import "XLPlainFlowLayout.h"


@interface NormalCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView * _clv;
    NSArray * _headers;
    NSArray * _footers;
    NSMutableArray * _cells;
    UILongPressGestureRecognizer * _longPress;
}
@end

@implementation NormalCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self datas];
    
    [self setupCLV:YES frame:CGRectMake(0, 100, ScreenWith,180)];
    
//    [self setupCLV:NO frame:CGRectMake(0, 80, ScreenWith,300)];
    
}

- (void)setupCLV:(BOOL)horizontal frame:(CGRect)frame
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //悬浮header
//    XLPlainFlowLayout * layout = [[XLPlainFlowLayout alloc]init];
//    layout.naviHeight = 0;
    if(horizontal)
    {
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }else
    {
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    
    layout.estimatedItemSize = CGSizeMake(100  , Height_NormalColltionViewCell);
    layout.sectionInset = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.headerReferenceSize = CGSizeMake(150 , Height_NormalCollectionHeaderView);
    layout.footerReferenceSize = CGSizeMake(50 , Height_NormalCollectionFooterView);
    
    _clv = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    _clv.backgroundColor = [UIColor yellowColor];
    _clv.delegate = self;
    _clv.dataSource = self;
    _clv.allowsSelection = YES;
    _clv.allowsMultipleSelection = NO;
    _clv.showsHorizontalScrollIndicator = NO;
    _clv.showsVerticalScrollIndicator = NO;
//    _clv.pagingEnabled = YES;
    if(horizontal)
    {
        _clv.alwaysBounceHorizontal = YES;
        _clv.alwaysBounceVertical = NO;
    }else
    {
        _clv.alwaysBounceHorizontal = NO;
        _clv.alwaysBounceVertical = YES;
    }
    
    [self.view addSubview:_clv];
    
    
    [_clv registerClass:[NormalCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Identifier_NormalCollectionHeaderView];
    [_clv registerClass:[NormalCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:Identifier_NormalCollectionFooterView];
    [_clv registerClass:[NoramlTitleCollectionViewCell class] forCellWithReuseIdentifier:Identifier_NoramlTitleCollectionViewCell];
    
    
    _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressMoving:)];
    [_clv addGestureRecognizer:_longPress];
}

- (void)viewDidAppear:(BOOL)animated
{
    //滚动到某一个位置
    [_clv scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (void)datas
{
    NormalCollectionHeaderModel * header = [[NormalCollectionHeaderModel alloc]init];
    header.title = @"头部";
    header.imgName = @"camera";
    _headers = @[header];
    NormalCollectionFooterModel * footer = [[NormalCollectionFooterModel alloc]init];
    footer.title = @"尾部";
    _footers = @[footer];
    NSString * str = @"";
    NSMutableArray * cellsArr = [@[] mutableCopy];
    for (int i = 0; i<10 ; i++) {
        NormalColltionViewCellModel * cell = [[NormalColltionViewCellModel alloc]init];
        str = [str stringByAppendingString: [NSString stringWithFormat:@"%@",@(i)]];
        cell.title = str;
        cell.imgName = @"setting";
        [cellsArr addObject:cell];
    }
    _cells = [cellsArr mutableCopy];
}
#pragma --mark datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_cells count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoramlTitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier_NoramlTitleCollectionViewCell forIndexPath:indexPath];
    NormalColltionViewCellModel *model = [_cells objectAtIndex:indexPath.row];
    cell.model = model;
    [cell setupUI];
    cell.btnDelete.hidden = YES;
    NSLog(@"set up ui");
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        NormalCollectionHeaderView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Identifier_NormalCollectionHeaderView forIndexPath:indexPath];
        header.model = [_headers objectAtIndex:indexPath.section];
        [header setupUI];
        return header;
    }else if([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        NormalCollectionFooterView * footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:Identifier_NormalCollectionFooterView forIndexPath:indexPath];
        footer.model = [_footers objectAtIndex:indexPath.section];
        [footer setupUI];
        return footer;
    }
    return nil;
}


#pragma --mark flowlayout
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//
//    return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
//}





#pragma --mark delegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


#pragma --mark 删除和移动
- (void)lonePressMoving: (UILongPressGestureRecognizer *)longPress
{
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan: {
            {
                NSIndexPath *selectIndexPath = [_clv indexPathForItemAtPoint:[longPress locationInView:_clv]];
                if (!selectIndexPath) {
                    break;
                }
                // 找到当前的cell
                NoramlTitleCollectionViewCell *cell = (NoramlTitleCollectionViewCell *)[_clv cellForItemAtIndexPath:selectIndexPath];
                // 定义cell的时候btn是隐藏的, 在这里设置为NO
                [cell.btnDelete setHidden:NO];
                
                cell.btnDelete.tag = selectIndexPath.item;
                
                //添加删除的点击事件
                [cell.btnDelete addTarget:self action:@selector(btnDelete:) forControlEvents:UIControlEventTouchUpInside];
                
                [_clv beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            [_clv updateInteractiveMovementTargetPosition:[longPress locationInView:longPress.view]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            [_clv endInteractiveMovement];
            break;
        }
        default: [_clv cancelInteractiveMovement];
            break;
    }
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath
{
    NSIndexPath *selectIndexPath = [collectionView indexPathForItemAtPoint:[_longPress locationInView:collectionView]];
    // 找到当前的cell
    NoramlTitleCollectionViewCell *cell = (NoramlTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:selectIndexPath];
    cell.btnDelete.hidden = YES;
    /*1.存在的问题,移动是二个一个移动的效果*/
    //  [collectionView moveItemAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    /*2.存在的问题：只是交换而不是移动的效果*/
    //    [self.array exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
    /*3.完整的解决效果*/
    //取出源item数据
    id objc = [_cells objectAtIndex:sourceIndexPath.item];
    //从资源数组中移除该数据
    [_cells removeObject:objc];
    //将数据插入到资源数组中的目标位置上
    [_cells insertObject:objc atIndex:destinationIndexPath.item];
    //强制invalidate要求重绘制，避免界面混乱
    [_clv.collectionViewLayout invalidateLayout];//可以用layout中的shouldInvalidateLayoutForPreferredLayoutAttributes替代
    //这里传入context对象进行优化
//   UICollectionViewLayoutInvalidationContext * ctx = [[UICollectionViewLayoutInvalidationContext alloc]init];
//    [_clv.collectionViewLayout invalidateLayoutWithContext:nil];
    
    [_clv reloadData];//不调用relaod会飞~ 调了会闪
    
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//删除代码
#pragma mark---btn的删除cell事件

- (void)btnDelete:(UIButton *)btn{
    //cell的隐藏删除设置
    NSIndexPath *selectIndexPath = [_clv indexPathForItemAtPoint:[_longPress locationInView:_clv]];
    // 找到当前的cell
    NoramlTitleCollectionViewCell *cell = (NoramlTitleCollectionViewCell *)[_clv cellForItemAtIndexPath:selectIndexPath];
    cell.btnDelete.hidden = NO;
    
    //取出源item数据
    id objc = [_cells objectAtIndex:btn.tag];
    //从资源数组中移除该数据
    [_cells removeObject:objc];
    [_clv reloadData];
}


#pragma --mark scroll
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDid scroll");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"will begin scroll");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"did end scroll");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"did end drag scroll");
}
@end
