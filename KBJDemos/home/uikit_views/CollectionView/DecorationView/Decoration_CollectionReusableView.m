//
//  Decoration_CollectionReusableView.m
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "Decoration_CollectionReusableView.h"
#import "Decoration_UICollectionViewLayoutAttributes.h"

@implementation Decoration_CollectionReusableView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    //设置背景颜色
    Decoration_UICollectionViewLayoutAttributes *ecLayoutAttributes = (Decoration_UICollectionViewLayoutAttributes*)layoutAttributes;
    self.backgroundColor = ecLayoutAttributes.color;
}

@end
