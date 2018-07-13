//
//  BBAApp2DownloadTableViewCell.h
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewBaseCell.h"

@class BBAApp2DownlaodModel;
/**
 app直达
 app内部如果想要掉起其他应用，需要将被掉起的应用加入info.plist中，key为LSApplicationQueriesSchemes
 如果未加入，在使用canOpenURL时返回false
 如果未安装，那么直接调到appStore--需要制定appID，直接跳过去
 
 在iOS 10以后如果想直接打开，需要使用openURL option（目前只有一个key，需要指定为NO）
 */
@interface BBAApp2DownloadTableViewCell : UITableViewBaseCell


@end


