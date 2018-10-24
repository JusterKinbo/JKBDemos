//
//  Decoration_CollectionViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "Decoration_CollectionViewController.h"
#import "Decoration_UICollectionViewFlowLayout.h"
#define kIdentifier @"Decoration_UICollectionViewCell"


@interface Decoration_CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView * _clv;
}
@end

@implementation Decoration_CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Decoration_UICollectionViewFlowLayout * layout = [[Decoration_UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _clv = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, ScreenWith, ScreenHeight-64) collectionViewLayout:layout];
    _clv.delegate = self;
    _clv.dataSource = self;
    _clv.backgroundColor = [UIColor yellowColor];
    [_clv registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kIdentifier];
    [self.view addSubview:_clv];
    
}
#pragma --mark datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}


@end
