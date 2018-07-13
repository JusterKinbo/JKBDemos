//
//  BBAAppletCellModel.h
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITableViewModelBaseCell.h"


/**
 applet cell model
 */
@interface BBAAppletCellModel : UITableViewModelBaseCell

@property (nonatomic,copy) NSString * iconURL;//图片url
@property (nonatomic,copy) NSString * name;//applet 名称
@property (nonatomic,copy) NSString * personNumber;//使用人数
@property (nonatomic,copy) NSString * detail;//描述
@property (nonatomic,copy) NSString * applet;//applet 标识


@end
