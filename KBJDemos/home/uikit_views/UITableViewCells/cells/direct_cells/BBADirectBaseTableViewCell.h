//
//  BBADirectBaseTableViewCell.h
//  KBJDemos
//
//  Created by Juster on 2018/7/19.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "UITableViewBaseCell.h"

/**
 direct base cell 针对 ui 共性
 */
@interface BBADirectBaseTableViewCell : UITableViewBaseCell

//sug ad ck 针对cell的值
@property (nonatomic,assign) CGFloat pressTime;//针对cell的点击时间
@property (nonatomic,assign) CGFloat clickTime;//touch end 与 click时间差 端上为0
@property (nonatomic,assign) CGFloat touchX;//针对cell的点击x
@property (nonatomic,assign) CGFloat touchY;
@property (nonatomic,assign) CGFloat clickX;//同touch值
@property (nonatomic,assign) CGFloat clickY;
@property (nonatomic,assign) CGFloat templateWidth;//cell宽高
@property (nonatomic,assign) CGFloat templateHeight;
@property (nonatomic,copy) NSString * crc;//参考js公式

//测试touches 时间
@property (nonatomic,assign) CGFloat _pressTime;


@end
