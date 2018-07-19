//
//  BBAApp2DownlaodModel.h
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBADirectBaseTableViewModel.h"


/**
 app 直达下载 cell model
 */
@interface BBAApp2DownlaodModel : BBADirectBaseTableViewModel

@property (nonatomic,copy) NSString * iconURL;//图片url
@property (nonatomic,copy) NSString * name;//app名称
@property (nonatomic,copy) NSString * volume;//app体积
@property (nonatomic,copy) NSString * version;//app版本
@property (nonatomic,copy) NSString * app;//app标识
@property (nonatomic,copy) NSString * download;//下载提示标识
@property (nonatomic,copy) NSString * appScheme;
@property (nonatomic,copy) NSString * appId;

@end
