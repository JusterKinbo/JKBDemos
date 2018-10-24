//
//  NormalCollectionFooterView.h
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Height_NormalCollectionFooterView 40
#define Identifier_NormalCollectionFooterView @"Identifier_NormalCollectionFooterView"

#import "NormalCollectionFooterModel.h"


NS_ASSUME_NONNULL_BEGIN



@interface NormalCollectionFooterView : UICollectionReusableView

@property (nonatomic,strong) NormalCollectionFooterModel * model;


- (void)setupUI;
@end

NS_ASSUME_NONNULL_END
