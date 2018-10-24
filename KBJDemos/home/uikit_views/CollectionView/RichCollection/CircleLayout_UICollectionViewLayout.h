//
//  CircleLayout_UICollectionViewLayout.h
//  KBJDemos
//
//  Created by Juster on 2018/10/23.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleLayout_UICollectionViewLayout : UICollectionViewFlowLayout

//这个int值存储有多少个item
@property (nonatomic,assign) int itemCount;

@end

NS_ASSUME_NONNULL_END
