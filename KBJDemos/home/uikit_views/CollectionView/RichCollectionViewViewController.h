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
 
 和TableView一样，每个cell都是调用initWithFrame，因此在布局里面的元素之前，它的frame都是已经确定的
 masonry需要开起约束生效，是因为masory布局的元素需要先生效才能使用它的size
 因此，自定义cell只需要重写元素布局即可
 
 */
@interface RichCollectionViewViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
