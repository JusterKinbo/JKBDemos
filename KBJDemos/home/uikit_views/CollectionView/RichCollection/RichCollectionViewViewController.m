//
//  RichCollectionViewViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/10/23.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "RichCollectionViewViewController.h"
#import "CircleLayout_UICollectionViewLayout.h"
@interface RichCollectionViewViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation RichCollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CircleLayout_UICollectionViewLayout * layout = [[CircleLayout_UICollectionViewLayout alloc]init];
    UICollectionView * collect = [[UICollectionView alloc]initWithFrame:CGRectMake((ScreenWith -350)/2, 100, 350, 400) collectionViewLayout:layout];
    collect.delegate=self;
    collect.dataSource=self;
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collect];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{ return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 25;
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}



@end
