//
//  Decoration_UICollectionViewFlowLayout.m
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "Decoration_UICollectionViewFlowLayout.h"
#import "Decoration_CollectionReusableView.h"
#import "Decoration_UICollectionViewLayoutAttributes.h"

@implementation Decoration_UICollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
    return [Decoration_UICollectionViewLayoutAttributes class];
}


- (void)prepareLayout
{
    [super prepareLayout];
    self.minimumLineSpacing = 8.0f;
    self.minimumInteritemSpacing = 8.0f;
    self.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
    self.itemSize = CGSizeMake(148.0f, 115.0f);
    //注册装饰视图
    [self registerClass:[Decoration_CollectionReusableView class] forDecorationViewOfKind:Identifier_Decoration_CollectionReusableView];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray *allAttributes = [NSMutableArray arrayWithArray:attributes];
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        
        // 查找一行的第一个item
        if (attribute.representedElementKind == UICollectionElementCategoryCell
            && attribute.frame.origin.x == self.sectionInset.left) {
            
            // 创建decoration属性、
            Decoration_UICollectionViewLayoutAttributes *decorationAttributes =
            [Decoration_UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:Identifier_Decoration_CollectionReusableView
                                                                                   withIndexPath:attribute.indexPath];
            
            // 让decoration view占据整行
            decorationAttributes.frame =
            CGRectMake(0,
                       attribute.frame.origin.y-(self.sectionInset.top),
                       self.collectionViewContentSize.width,
                       self.itemSize.height+(self.minimumLineSpacing+self.sectionInset.top+self.sectionInset.bottom));
            
            // 设置zIndex，表示在item的后面
            decorationAttributes.zIndex = attribute.zIndex-1;
            
            // 添加属性到集合
            [allAttributes addObject:decorationAttributes];
            
        }
        
    }
    
    return allAttributes;
}


@end
