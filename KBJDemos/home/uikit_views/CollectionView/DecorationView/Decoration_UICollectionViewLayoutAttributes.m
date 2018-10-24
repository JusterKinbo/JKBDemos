//
//  Decoration_UICollectionViewLayoutAttributes.m
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "Decoration_UICollectionViewLayoutAttributes.h"

@implementation Decoration_UICollectionViewLayoutAttributes

+ (instancetype)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind withIndexPath:(NSIndexPath *)indexPath
{
    Decoration_UICollectionViewLayoutAttributes *layoutAttributes = [super layoutAttributesForDecorationViewOfKind:decorationViewKind
                                                                                          withIndexPath:indexPath];
    if (indexPath.section%2 == 0) {
        layoutAttributes.color = [UIColor redColor];
    } else {
        layoutAttributes.color = [UIColor blueColor];
    }
    return layoutAttributes;
}

@end
