//
//  BBAApp2DownloadTableViewCell.m
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "BBAApp2DownloadTableViewCell.h"
#import "BBAApp2DownlaodModel.h"
#import "UIColor+BBAHexColor.h"
#import "UIImage+UIColor.h"

#define kNameSize_BBAApp2DownloadTableViewCell 17
#define kSubtitleSize_BBAApp2DownloadTableViewCell 12
#define kAppSize_BBAApp2DownloadTableViewCell 10

@interface BBAApp2DownloadTableViewCell()
{
    UIImageView * _icon;
    UILabel * _name;
    UILabel * _app;
    UILabel * _volume;
    UILabel * _version;
    UIImageView * _bottomVerticalLine;
    UIButton * _downLoad;
    NSString * _appScheme;
    NSString * _appID;
}
@end

@implementation BBAApp2DownloadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier
{
    self = [super initWithStyle:style reuseIdentifier:identifier];
    if(self)
    {
        //生成实例
        _icon = [[UIImageView alloc]init];
        _name = [[UILabel alloc]init];
        _app = [[UILabel alloc]init];
        _volume = [[UILabel alloc]init];
        _version = [[UILabel alloc]init];
        _bottomVerticalLine = [[UIImageView alloc]init];
        _downLoad = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //添加到contentView
        [self.contentView addSubview:_icon];
        [self.contentView addSubview:_name];
        [self.contentView addSubview:_app];
        [self.contentView addSubview:_volume];
        [self.contentView addSubview:_version];
        [self.contentView addSubview:_bottomVerticalLine];
        [self.contentView addSubview:_downLoad];
        
        //添加事件
        [_downLoad addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setModelItem:(BBAApp2DownlaodModel *)item
{
    //配置信息
    _appScheme = [item.appScheme copy];
    _appID = [item.appId copy];
    
    [_icon sd_setImageWithURL:[NSURL URLWithString:item.iconURL]
             placeholderImage:[UIImage imageNamed:@"games"]];
    
    NSAttributedString * nameAtt = [[NSAttributedString alloc]initWithString:item.name attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kNameSize_BBAApp2DownloadTableViewCell],NSForegroundColorAttributeName:[UIColor blackColor]}];
    _name.attributedText = nameAtt;
    
    NSAttributedString * appAtt = [[NSAttributedString alloc]initWithString:item.app attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kAppSize_BBAApp2DownloadTableViewCell],NSForegroundColorAttributeName:[UIColor grayColor]}];
    _app.attributedText = appAtt;
    _app.textAlignment = NSTextAlignmentCenter;
    
    NSAttributedString * volumeAtt = [[NSAttributedString alloc]initWithString:item.volume attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kSubtitleSize_BBAApp2DownloadTableViewCell],NSForegroundColorAttributeName:[UIColor grayColor]}];
    _volume.attributedText = volumeAtt;
    
    NSAttributedString * versionAtt = [[NSAttributedString alloc]initWithString:item.version attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kSubtitleSize_BBAApp2DownloadTableViewCell],NSForegroundColorAttributeName:[UIColor grayColor]}];
    _version.attributedText = versionAtt;
    
//    _bottomVerticalLine.backgroundColor = [UIColor greenColor];不使用背景色，避免cell选中时颜色消失
    _bottomVerticalLine.image = [UIImage imageWithColor:[UIColor lightGrayColor]size:CGSizeMake(1, 12)];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://",_appScheme]];
    if([[UIApplication sharedApplication] canOpenURL:url])
    {
        [_downLoad setTitle:@"打开" forState:UIControlStateNormal];
    }else
    {
        [_downLoad setTitle:item.download?item.download:@"下载" forState:UIControlStateNormal];
    }
    [_downLoad setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
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
    CGSize nameSize = [self textSize:_name.text fontSize:kNameSize_BBAApp2DownloadTableViewCell];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {//相对于icon
        make.left.equalTo(_icon.mas_right).mas_offset(8);
        make.top.equalTo(_icon.mas_top).mas_offset(0);
        make.width.mas_equalTo(nameSize.width+1);
    }];
    CGSize appSize = [self textSize:_app.text fontSize:kAppSize_BBAApp2DownloadTableViewCell];
    [_app mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name.mas_right).mas_offset(7);
        make.centerY.equalTo(_name.mas_centerY);
        make.width.mas_equalTo(appSize.width + 8);
        make.height.mas_equalTo(appSize.height + 6);
    }];
    CGSize volumeSize = [self textSize:_volume.text fontSize:kSubtitleSize_BBAApp2DownloadTableViewCell];
    [_volume mas_makeConstraints:^(MASConstraintMaker *make) {//相对于name
        make.left.equalTo(_name.mas_left).mas_offset(0);
        make.bottom.equalTo(_icon.mas_bottom).mas_offset(0);
        make.width.mas_equalTo(volumeSize.width+1);
    }];
    
    [_bottomVerticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_volume.mas_right).mas_offset(10);
        make.height.mas_equalTo(12);
        make.centerY.equalTo(_volume.mas_centerY);
        make.width.mas_equalTo(1);
    }];
    CGSize versionSize = [self textSize:_version.text fontSize:kSubtitleSize_BBAApp2DownloadTableViewCell];
    [_version mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomVerticalLine.mas_right).mas_offset(10);
        make.centerY.equalTo(_volume.mas_centerY);
        make.width.mas_equalTo(versionSize.width+1);
    }];
    [_downLoad mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-17);
        make.centerY.mas_offset(0);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(32);
    }];
    
    
    //生效约束
    [self.contentView layoutIfNeeded];
    
    //设置圆角
    _icon.clipsToBounds = YES;
    _icon.layer.cornerRadius = 5;
    [_downLoad setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]size:_downLoad.frame.size]forState:UIControlStateNormal];
    [_downLoad setBackgroundImage:[UIImage imageWithColor:[UIColor bba_colorWithHexString:@"000000" alpha:0.05]size:_downLoad.frame.size] forState:UIControlStateHighlighted];
    
    //设置layer
    _app.layer.borderColor = [UIColor grayColor].CGColor;
    _app.layer.borderWidth = 0.3;
    _app.layer.cornerRadius = 3;
    
    _downLoad.clipsToBounds = YES;
    _downLoad.layer.borderColor = [UIColor grayColor].CGColor;
    _downLoad.layer.borderWidth = 1;
    _downLoad.layer.cornerRadius = 3;
    
}

- (CGSize)textSize:(NSString *)text fontSize:(int)fontSize
{
    NSDictionary * attDic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return [text sizeWithAttributes:attDic];
}

//事件
- (void)download
{
    //创建一个url，这个url就是WXApp的url，记得加上：//
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://",_appScheme]];
    if([[UIApplication sharedApplication] canOpenURL:url])
    {

        NSString * str = [NSString stringWithFormat:@"%@://",_appScheme];
        [self openURLString:str];
        
    }else
    {
        NSString * str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",_appID];
        [self openURLString:str];
    }
}

- (void)openURLString:(NSString *)urlStr
{
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue <= 10.0) {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        #pragma clang diagnostic pop
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr] options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@NO} completionHandler:^(BOOL success) {
            
        }];
    }
}

- (void)doSelection
{
    NSLog(@"点击了 app %@ cell",_downLoad.titleLabel.text);
}



@end
