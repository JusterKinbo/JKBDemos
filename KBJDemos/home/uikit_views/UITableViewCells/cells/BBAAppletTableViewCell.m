//
//  BBAAppletTableViewCell.m
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "BBAAppletTableViewCell.h"
#import "BBAAppletCellModel.h"
#import "UIColor+BBAHexColor.h"
#import "UIImage+UIColor.h"

#define kNameSize_BBAAppletTableViewCell 17
#define kSubtitleSize_BBAAppletTableViewCell 12
#define kAppletSize_BBAAppletTableViewCell 10
#define kMaxDetailLength_BBAAppletTableViewCell 15


@interface BBAAppletTableViewCell()
{
    UIImageView * _icon;
    UILabel * _name;
    UILabel * _applet;
    UILabel * _personNumber;
    UIImageView * _bottomVerticalLine;
    UILabel * _detail;
    
}
@end

@implementation BBAAppletTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier
{
    self = [super initWithStyle:style reuseIdentifier:identifier];
    if(self)
    {
        //生成实例
        _icon = [[UIImageView alloc]init];
        _name = [[UILabel alloc]init];
        _applet = [[UILabel alloc]init];
        _personNumber = [[UILabel alloc]init];
        _detail = [[UILabel alloc]init];
        _bottomVerticalLine = [[UIImageView alloc]init];
        
        //添加到contentView
        [self.contentView addSubview:_icon];
        [self.contentView addSubview:_name];
        [self.contentView addSubview:_applet];
        [self.contentView addSubview:_personNumber];
        [self.contentView addSubview:_detail];
        [self.contentView addSubview:_bottomVerticalLine];
    }
    return self;
}

- (void)setModelItem:(BBAAppletCellModel *)item
{
    //设置内容--手百里面需要放在单独的地方
    [_icon sd_setImageWithURL:[NSURL URLWithString:item.iconURL]
             placeholderImage:[UIImage imageNamed:@"applet"]];
    
    NSAttributedString * nameAtt = [[NSAttributedString alloc]initWithString:item.name attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kNameSize_BBAAppletTableViewCell],NSForegroundColorAttributeName:[UIColor blackColor]}];
    _name.attributedText = nameAtt;
    
    NSAttributedString * appletAtt = [[NSAttributedString alloc]initWithString:item.applet attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kAppletSize_BBAAppletTableViewCell],NSForegroundColorAttributeName:[UIColor grayColor]}];
    _applet.attributedText = appletAtt;
    _applet.textAlignment = NSTextAlignmentCenter;
    
    NSAttributedString * personNumberAtt = [[NSAttributedString alloc]initWithString:item.personNumber attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kSubtitleSize_BBAAppletTableViewCell],NSForegroundColorAttributeName:[UIColor grayColor]}];
    _personNumber.attributedText = personNumberAtt;
    
    NSInteger detailLength = [item.detail length];
    NSString * detail ;
    if(detailLength > kMaxDetailLength_BBAAppletTableViewCell)
    {
         detail = [item.detail substringWithRange:NSMakeRange(0, detailLength>kMaxDetailLength_BBAAppletTableViewCell?kMaxDetailLength_BBAAppletTableViewCell:detailLength)];
        detail = [NSString stringWithFormat:@"%@...",detail];
    }else
    {
        detail = item.detail;
    }
   
    NSAttributedString * detailAtt = [[NSAttributedString alloc]initWithString:detail attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kSubtitleSize_BBAAppletTableViewCell],NSForegroundColorAttributeName:[UIColor grayColor]}];
    _detail.attributedText = detailAtt;
    
    //    _bottomVerticalLine.backgroundColor = [UIColor greenColor];不使用背景色，避免cell选中时颜色消失
    _bottomVerticalLine.image = [UIImage imageWithColor:[UIColor lightGrayColor]size:CGSizeMake(1, 12)];
    
}

- (void)updateUI
{
    //添加约束
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(15);
        make.bottom.mas_offset(-15);
        make.left.mas_offset(17);
        make.width.height.mas_equalTo(36).priorityHigh();
    }];
    CGSize nameSize = [self textSize:_name.text fontSize:kNameSize_BBAAppletTableViewCell];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {//相对于icon
        make.left.equalTo(_icon.mas_right).mas_offset(8);
        make.top.equalTo(_icon.mas_top).mas_offset(0);
        make.width.mas_equalTo(nameSize.width+1);
    }];
    CGSize appletSize = [self textSize:_applet.text fontSize:kAppletSize_BBAAppletTableViewCell];
    [_applet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name.mas_right).mas_offset(7);
        make.centerY.equalTo(_name.mas_centerY);
        make.width.mas_equalTo(appletSize.width + 8);
        make.height.mas_equalTo(appletSize.height + 6);
    }];
    CGSize personNumberSize = [self textSize:_personNumber.text fontSize:kSubtitleSize_BBAAppletTableViewCell];
    [_personNumber mas_makeConstraints:^(MASConstraintMaker *make) {//相对于name
        make.left.equalTo(_name.mas_left).mas_offset(0);
        make.bottom.equalTo(_icon.mas_bottom).mas_offset(0);
        make.width.mas_equalTo(personNumberSize.width+1);
    }];
    
    [_bottomVerticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_personNumber.mas_right).mas_offset(10);
        make.height.mas_equalTo(12);
        make.centerY.equalTo(_personNumber.mas_centerY);
        make.width.mas_equalTo(1);
    }];
    CGSize detailSize = [self textSize:_detail.text fontSize:kSubtitleSize_BBAAppletTableViewCell];
    [_detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomVerticalLine.mas_right).mas_offset(10);
        make.centerY.equalTo(_personNumber.mas_centerY);
        make.width.mas_equalTo(detailSize.width+1);
    }];
  
    //生效约束
    //    self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width, 76);
    [self.contentView layoutIfNeeded];
    
    //设置圆角
    _icon.clipsToBounds = YES;
    _icon.layer.cornerRadius = 5;
    
    //设置layer
    _applet.layer.borderColor = [UIColor grayColor].CGColor;
    _applet.layer.borderWidth = 0.3;
    _applet.layer.cornerRadius = 3;
    
}


- (CGSize)textSize:(NSString *)text fontSize:(int)fontSize
{
    NSDictionary * attDic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return [text sizeWithAttributes:attDic];
}

- (void)doSelection
{
    NSLog(@"点击了 applet ");
}

@end
