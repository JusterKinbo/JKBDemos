//
//  CircleLayout_UICollectionViewLayout.m
//  KBJDemos
//
//  Created by Juster on 2018/10/23.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "CircleLayout_UICollectionViewLayout.h"


@implementation CircleLayout_UICollectionViewLayout
{
    NSMutableArray * _attributeAttay;
}

/**
 说明：在这个方法中做一些初始化操作
 注意：一定要调用[super prepareLayout]
 */
-(void)prepareLayout{
    [super prepareLayout];
    
    //获取item的个数
    _itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    _attributeAttay = [[NSMutableArray alloc]init];
   //先设定大圆的半径 取长和宽最短的
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height)/2-40;
    //计算圆心位置
    CGPoint center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    //设置每个item的大小为50*50 则半径为25
    for (int i=0; i<_itemCount; i++) {
        UICollectionViewLayoutAttributes * attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
      //设置item大小
    attris.size = CGSizeMake(50, 50);
      //计算每个item的圆心位置
        /*
                          .
                          . .
                          .   . r
                          .     .
                          .........
                          */
        //计算每个item中心的坐标
     //算出的x y值还要减去item自身的半径大小
       float x = center.x+cosf(2*M_PI/_itemCount*i)*(radius-25);
     float y = center.y+sinf(2*M_PI/_itemCount*i)*(radius-25);
       attris.center = CGPointMake(x, y);
        [_attributeAttay addObject:attris];
        }
}
//设置内容区域的大小
-(CGSize)collectionViewContentSize{
    CGSize size = self.collectionView.frame.size;   return size;
}

/**
 1.这个方法的返回值是个数组
 2. 这个数组中存放的都是UICollectionViewLayoutAttributes对象
 3.UICollectionViewLayoutAttributes对象决定了cell的排布方式（frame等）
 */
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    return _attributeAttay;
}



/**
 如果返回YES，那么collectionView显示的范围发生改变时，就会重新刷新布局
 一旦重新刷新布局，就会按顺序调用下面的方法：
 - prepareLayout
 - layoutAttributesForElementsInRect:
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
/**
 - 说明：返回值决定了collectionView停止滚动时最终的偏移量（contentOffset）
 - 参数：- proposedContentOffset：原本情况下，collectionView停止滚动时最终的偏移量
 - velocity：滚动速率，通过这个参数可以了解滚动的方向
 
 */
//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
//{
//    [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
//}

- (void)invalidateLayoutWithContext:(UICollectionViewLayoutInvalidationContext *)context
{
    [super invalidateLayoutWithContext:context];
}

- (UICollectionViewLayoutInvalidationContext *)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(NSArray<NSIndexPath *> *)indexPaths previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths movementCancelled:(BOOL)movementCancelled
{
    return [super invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:indexPaths previousIndexPaths:previousIndexPaths movementCancelled:movementCancelled];
}

- (UICollectionViewLayoutInvalidationContext *)invalidationContextForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
{
    return [super invalidationContextForPreferredLayoutAttributes:preferredAttributes withOriginalAttributes:originalAttributes];
}

- (UICollectionViewLayoutInvalidationContext *)invalidationContextForInteractivelyMovingItems:(NSArray<NSIndexPath *> *)targetIndexPaths withTargetPosition:(CGPoint)targetPosition previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths previousPosition:(CGPoint)previousPosition
{
    return [super invalidationContextForInteractivelyMovingItems:targetIndexPaths withTargetPosition:targetPosition previousIndexPaths:previousIndexPaths previousPosition:previousPosition];
}

@end

