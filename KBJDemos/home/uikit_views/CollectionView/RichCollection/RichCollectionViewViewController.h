//
//  RichCollectionViewViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/10/23.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 参考博客：https://blog.csdn.net/LVXIANGAN/article/details/73826108
 实现了瀑布流、圆形、3D、球行
 
 每个cell都是调用initWithFrame只会调用一次，后面都是调用preferredLayoutAttributesFittingAttributes
 masonry需要开起约束生效，但是cell size调整需要借助于preferredLayoutAttributesFittingAttributes
 自定义cell只需要重写元素布局即可，如果需要多种cell每种都需要提前注册（collection view只能提前注册然后dequeue）
 
 Decoration:
 针对flowlayout进行布局，可以设置cell的地下view
 参考：https://blog.csdn.net/u014084081/article/details/77164513
 
 nomarl:
 支持cell删除、移动、header悬浮
 悬浮参考：https://github.com/HebeTienCoder/XLPlainFlowLayout/blob/master/XLPlainFlowLayoutDemo/XLPlainFlowLayout/XLPlainFlowLayout.h
        本质是渲染视图时不断更新header位置+调整contentSize
 删除移动参考：https://www.jianshu.com/p/fc058ccd691a
 
 cell 自适应 --实现上分3步骤：
    1）layout估值
    2）setupUI -- 每次生成cell时使用
    3)重写 cell 的 preferredLayoutAttributesFittingAttributes
 参考：https://blog.csdn.net/potato512/article/details/54599410
      https://blog.csdn.net/sinat_29269363/article/details/53405626
 
 invalidateLayoutWithContext可以用于优化渲染
    先调用prepare
    在调用layoutAttributesForElementsInRect
 
 玩转UICollectionViewLayout：https://blog.csdn.net/qq_30513483/article/details/51611653
    layoutAttributesForElementsInRect 返回该区域内所有元素的布局信息，包括cell,追加视图和装饰视图
 
     targetContentOffsetForProposedContentOffset
        如果你希望内容区快速滑动到指定的区域，可以重载该方法。比如，你可以通过该方法让滑动停止在两个item中间的区域，而不是某个item的中间
 
    shouldInvalidateLayoutForPreferredLayoutAttributes
        当collection view包含self-sizing (自排列)的cell时，这些cell可以在布局attributes 应用到它之前更改这些attributes。一个自排列的cell指明一个不同于布局对象给出的size的时候，就会这么做。当cell设置一系列不同的attributes时，collection view将会调用该方法判断是否需要更新布局，默认返回为NO
 
 */
@interface RichCollectionViewViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
