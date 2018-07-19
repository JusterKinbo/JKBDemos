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
    NSString * _rcv_url;
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
        
        UITapGestureRecognizer * downloadTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(downloadTap:)];
        [_downLoad addGestureRecognizer:downloadTap];
        //添加手势后add target 失效
//        [_downLoad addTarget:self action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
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
        make.left.equalTo(self->_icon.mas_right).mas_offset(8);
        make.top.equalTo(self->_icon.mas_top).mas_offset(0);
        make.width.mas_equalTo(nameSize.width+1);
    }];
    CGSize appSize = [self textSize:_app.text fontSize:kAppSize_BBAApp2DownloadTableViewCell];
    [_app mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_name.mas_right).mas_offset(7);
        make.centerY.equalTo(self->_name.mas_centerY);
        make.width.mas_equalTo(appSize.width + 8);
        make.height.mas_equalTo(appSize.height + 6);
    }];
    CGSize volumeSize = [self textSize:_volume.text fontSize:kSubtitleSize_BBAApp2DownloadTableViewCell];
    [_volume mas_makeConstraints:^(MASConstraintMaker *make) {//相对于name
        make.left.equalTo(self->_name.mas_left).mas_offset(0);
        make.bottom.equalTo(self->_icon.mas_bottom).mas_offset(0);
        make.width.mas_equalTo(volumeSize.width+1);
    }];
    
    [_bottomVerticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_volume.mas_right).mas_offset(10);
        make.height.mas_equalTo(12);
        make.centerY.equalTo(self->_volume.mas_centerY);
        make.width.mas_equalTo(1);
    }];
    CGSize versionSize = [self textSize:_version.text fontSize:kSubtitleSize_BBAApp2DownloadTableViewCell];
    [_version mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bottomVerticalLine.mas_right).mas_offset(10);
        make.centerY.equalTo(self->_volume.mas_centerY);
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


-(void)downloadTap:(UITapGestureRecognizer *)sender{
    CGPoint point = [sender locationInView:sender.view];
    NSLog(@"handleSingleTap!pointx:%f,y:%f",point.x,point.y);
    [self download:sender.view];
}
//事件
- (void)download:(id)sender
{
    NSLog(@"button down laod");
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
    
    if([self checkIfAppExistByPrivateMethod])
    {
        NSLog(@"私有方法检测这个应用存在");
    }else
    {
         NSLog(@"私有方法检测这个应用不存在！！！");
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
   
//    [self generateCRCWith:@"?url=test." imTimeSign:20 pressTime:10 touchX:10];
    NSLog(@"%ld====",[self generateCRCWith:@"?url=test." imTimeSign:20 pressTime:10 touchX:10]);
    NSLog(@"%ld====",[self generateCRCWith:@"link?url=lala" imTimeSign:20 pressTime:10 touchX:10]);
}

- (BOOL)checkIfAppExistByPrivateMethod
{
    NSString * bundlePath = @"/System/Library/PrivateFrameworks/MobileContainerManager.framework";
    NSString * encodeBundlePath = [self encodeString:bundlePath];
    NSBundle *container = [NSBundle bundleWithPath:[self decodeString:encodeBundlePath]];
    if ([container load]) {
        NSString * appContainerStr = @"MCMAppContainer";
        NSString * encodeAppContainer = [self encodeString:appContainerStr];
        Class appContainer = NSClassFromString([self decodeString:encodeAppContainer]);
        id test = [appContainer performSelector:@selector(containerWithIdentifier:error:) withObject:@"com.tencent.xin" withObject:nil];
        if (test) {
            return YES;
        }
    }
    return NO;
}

//代码混淆--基于base 64
//base64编码
- (NSString *)encodeString:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedStr = [data base64EncodedStringWithOptions:0];
    return encodedStr;
}
//base64解码
- (NSString *)decodeString:(NSString *)string
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:0];
    NSString *decodedStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return decodedStr;
}


/*
 翻译这个函数
 function getCheckCode(href, imTimeSign, pressTime, touchX) {
     var urlSearch;
     var urlReg = /\?url\=([^\.]+)\./;
     var urlMix = /link\?url\=([^\&]+)/;
     var checkCode = 0;
     urlSearch = urlMix.exec(href) || urlReg.exec(href);
     if (urlSearch) {
         var num = (((pressTime * imTimeSign) % 99) + 9);
         var iDomainLen = urlSearch[1].length;
         if (urlMix.exec(href)) {
             iDomainLen = urlSearch[1].length < 20 ? urlSearch[1].length : 20;
         }
         for (var x = 0; x < num; ++x) {
             checkCode += urlSearch[1].charCodeAt((touchX * x) % iDomainLen);
         }
        return checkCode;
     }
     return false;
 }
 */


- (NSUInteger)generateCRCWith:(NSString *)href imTimeSign:(float)imTimeSign pressTime:(float)pressTime touchX:(float)touchX
{
    NSString *urlReg = @"\\?url=([^\\.]+)\\.";
    NSString *urlMix = @"link\\?url=([^&]+)";
    NSString * urlRegMatchStr = [self secondMatchString:href withRegexStri:urlReg];
    NSString * urlMixMatchStr = [self secondMatchString:href withRegexStri:urlMix];
    NSMutableArray * matchArr = [@[] mutableCopy];
    if(urlMixMatchStr) [matchArr addObject:urlMixMatchStr];//优先保证mix
    if(urlRegMatchStr) [matchArr addObject:urlRegMatchStr];
    NSString * urlMatch = nil;
    //保证||判断，那个有值用哪个，优先使用第一个值
    for (NSString * match in matchArr) {
        if(match)
        {
            urlMatch = match;break;
        }
    }
    if(urlMatch)
    {
        NSUInteger totalTime = pressTime * imTimeSign;
        NSUInteger num = ((totalTime % 99) + 9);
        NSUInteger iDomainLen = urlMatch.length;
        if(urlMixMatchStr)
        {
            iDomainLen = urlMatch.length < 20 ? urlMatch.length : 20;
        }
        NSUInteger checkCode = 0;
        for (int x = 0; x < num; ++x) {
            NSInteger X = touchX * x;
            checkCode += [urlMatch characterAtIndex:( X % iDomainLen)];
        }
        return checkCode;
    }
    return 0;
}

- (NSString *)secondMatchString:(NSString *)str withRegexStri:(NSString *)regex
{
    NSError *error = NULL;
    NSString * matchString = nil;
    NSRegularExpression *regexReg = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regexReg firstMatchInString:str options:0 range:NSMakeRange(0, [str length])];
    if([result numberOfRanges]==2)
    {
        NSRange r = [result rangeAtIndex:1];
        matchString = [str substringWithRange:r];
    }
    NSLog(@"match string ==> %@",matchString);
    return matchString;
}


@end
